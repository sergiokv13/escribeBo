class Chapter < ActiveRecord::Base
  belongs_to :chapter_president, class_name: 'User'
  #belongs_to :demolay_in_charge, class_name: 'User'
  has_many :consultants, foreign_key: 'chapter_consultant_id', class_name: 'User'
end
