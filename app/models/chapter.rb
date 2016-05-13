class Chapter < ActiveRecord::Base
  belongs_to :chapter_president, class_name: 'User'
  #belongs_to :demolay_in_charge, class_name: 'User'
  has_many :consultants, foreign_key: 'chapter_consultant_id', class_name: 'User'
  has_many :demolays, foreign_key: 'chapter_id', class_name: 'User'
  has_many :knights, foreign_key: 'priory_id', class_name: 'User'
  has_many :chevalliers, foreign_key: 'court_id', class_name: 'User'
end
