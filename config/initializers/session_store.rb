# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_birdyear_session',
  :secret      => '3f3ee97dd5e9a16901773250a55ef9f75547189e4389985dc60fa7e21ffea2c317112d47712024f3fb3f833cacc24691c38388ad6d2e91cc0584d8341e45d6bf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
