# edit this file to contain credentials for the OAuth services you support.
# each entry needs a corresponding token model.
#
# eg. :twitter => TwitterToken, :hour_feed => HourFeedToken etc.
#
# OAUTH_CREDENTIALS={
#   :twitter=>{
#     :key=>"",
#     :secret=>""
#   },
#   :google=>{
#     :key=>"",
#     :secret=>"",
#     :scope=>"" # see http://code.google.com/apis/gdata/faq.html#AuthScopes
#   },
#   :agree2=>{
#     :key=>"",
#     :secret=>""
#   },
#   :fireeagle=>{
#     :key=>"",
#     :secret=>""
#   },
#   :hour_feed=>{
#     :key=>"",
#     :secret=>"",
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://hourfeed.com" # Remember to add a site for a generic OAuth site
#     }
#   },
#   :nu_bux=>{
#     :key=>"",
#     :secret=>"",
#     :super_class=>"OpenTransactToken",  # if a OAuth service follows a particular standard 
#                                         # with a token implementation you can set the superclass
#                                         # to use
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://nubux.heroku.com" 
#     }
#   }
# }
# 
OAUTH_CREDENTIALS = {
  :google => {
    :key     => 'your_key',
    :secret  => 'your_secret',
    :scope   => 'https://docs.google.com/feeds/ https://spreadsheets.google.com/feeds/ https://www.google.com/m8/feeds/ https://www.google.com/calendar/feeds/',
    :options => {
      :site               => 'https://www.google.com',
      :request_token_path => '/accounts/OAuthGetRequestToken',
      :access_token_path  => '/accounts/OAuthGetAccessToken',
      :authorize_path     => '/accounts/OAuthAuthorizeToken',
      :signature_method   => 'HMAC-SHA1'
    }
  }
}
load 'oauth/models/consumers/service_loader.rb'
