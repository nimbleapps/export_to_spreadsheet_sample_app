class User < ActiveRecord::Base
  has_one  :google_token, :class_name => "GoogleToken", :dependent=>:destroy
end
