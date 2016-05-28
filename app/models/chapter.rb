class Chapter < ActiveRecord::Base
  belongs_to :chapter_president, class_name: 'User'
  belongs_to :campament
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :chapter_consultant_president, foreign_key: 'chapter_consultant_president_id',class_name: 'User'
  has_many :consultants, foreign_key: 'chapter_consultant_id', class_name: 'User'
  has_many :demolays, foreign_key: 'chapter_id', class_name: 'User'
  has_many :knights, foreign_key: 'priory_id', class_name: 'User'
  has_many :chevalliers, foreign_key: 'court_id', class_name: 'User'
end
