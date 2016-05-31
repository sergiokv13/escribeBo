class Campament < ActiveRecord::Base
  belongs_to :president, class_name: 'User'
  belongs_to :maestro_consejero, class_name: 'User'
  has_many :chapters
  has_many :announcements
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing_entitie.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
