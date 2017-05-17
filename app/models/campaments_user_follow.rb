class CampamentsUserFollow < ActiveRecord::Base
  belongs_to :user
  belongs_to :campament
end
