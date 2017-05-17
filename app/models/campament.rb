class Campament < ActiveRecord::Base
  belongs_to :president, class_name: 'User'
  belongs_to :maestro_consejero, class_name: 'User'
  has_many :chapters
  has_many :announcements
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing_entitie.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, :presence => true

  def drop_gestion
    self. president = nil
    self.maestro_consejero = nil
    self.save
  end
  
end
