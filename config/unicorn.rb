# Read about unicorn workers here:
# http://doc.gitlab.com/ee/install/requirements.html#unicorn-workers
#
worker_processes 3

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false
