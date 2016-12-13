class UserPremiation < ActiveRecord::Base
  belongs_to :user
  belongs_to :premiacion
end
