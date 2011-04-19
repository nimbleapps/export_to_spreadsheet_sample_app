# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my_application_session',
  :secret      => '54ee39aa977c9cd704fea6cc4406cf3d0fd2ec86e59f4fa74a82ccf05059a1cf0d9c5609d49ea48beae09b9cb7c62ecb607558a8bfd87cd7a69c9c21eaea4771'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
