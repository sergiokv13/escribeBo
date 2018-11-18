class Premiacion < ActiveRecord::Base
  has_many :users

  has_attached_file :icon, styles: { medium: "60x60>", thumb: "60x60>" }, default_url: "/assets/missing_premiacion.png"
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
