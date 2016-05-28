class Campament < ActiveRecord::Base
  belongs_to :president, class_name: 'User'
  has_many :chapters
end
