class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :chapter
  belongs_to :campament
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def aprobada(usuario)
  	flag1 = false
  	self.degrees.split(',').each do |degree|
  		if !flag1
  			flag1 = usuario.tiene_el_grado(degree);
  		end
  	end
  	flag2 = false
  	self.charges.split(',').each do |charge|
  		if !flag2
  			flag2 = usuario.tiene_el_cargo(charge);
  		end
  	end
  	return flag1 || flag2
  end 
end
