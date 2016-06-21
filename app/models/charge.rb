class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campament
  belongs_to :chapter
end
