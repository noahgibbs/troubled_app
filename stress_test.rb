#!/usr/bin/env ruby

require 'rest-client'
require 'trollop'

OPTS = Trollop::options do
  opt :number,       'Number of requests/thread',          :default => 1000,     :type => Integer
  opt :threads,      'Number of threads used',             :default => 1,        :type => Integer
  opt :host,         'Host for URL',                       :default => "localhost:8080"
  banner <<-END

    This is a simple stress-test for the troubled app, for easier profiling. It is not
    representative of production data.
  END
end

# List of requests and weighting

REQS = {
  'delays/idle'        => 1,
  'delays/busy_ruby'   => 1,
  'delays/database'    => 1,
  'delays/occasional'  => 1,
  'delays/garbage'     => 1,
  'delays/exception'   => 0
}
TOTAL_WEIGHT = REQS.values.inject 0.0, &:+

# This returns a weighted random URL
def random_req_url
  r = rand() * TOTAL_WEIGHT
  keys = REQS.keys
  while keys.size > 1
    return keys[0] if r <= REQS[keys[0]]
    r -= REQS[keys[0]]
    keys.shift
  end
  keys[0]
end

# Random seed
srand Time.now.to_f

threads = (1..(OPTS[:threads])).map do
  Thread.new do
    begin
      OPTS[:number].times do
        begin
          req_url = "http://#{OPTS[:host]}/#{random_req_url}"
          puts "URL: #{req_url.inspect}"
          RestClient.get req_url
        rescue
          puts "Error #{$!.message.inspect} getting URL: #{req_url.inspect}"
        end
      end
    rescue Exception
      STDERR.puts "Exception #{$!.message.inspect}! Killing thread!"
    end
  end
end

threads.each { |t| t.join }
