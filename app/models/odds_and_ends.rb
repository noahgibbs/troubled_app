class OddsAndEnds < ActiveRecord::Base
  belongs_to :odds_and_ends, :foreign_key => :parent_id
end
