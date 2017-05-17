class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :chapter
  belongs_to :campament
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :subject, :presence => true
  validates :content, :presence => true

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

  def is_aproved
    if self.president_aproved or self.oficial_aproved
      true
    else
      false
    end
  end

  def aprove(aprover)
    if aprover.tiene_el_cargo("Oficial Ejecutivo")
      self.oficial_aproved = true
      self.save
    elsif aprover.id == self.chapter.chapter_president_id
      self.president_aproved = true
      self.save
    end
  end

  def self.to_aprove
    announcements = Announcement.all
    announcements_to_be_aproved = Array.new
    announcements.each do |announcement|
      if !announcement.is_aproved
        announcements_to_be_aproved.push(announcement)
      end
    end
    announcements_to_be_aproved
  end

  def self.aproved
    announcements = Announcement.all
    announcements_to_be_aproved = Array.new
    announcements.each do |announcement|
      if announcement.is_aproved
        announcements_to_be_aproved.push(announcement)
      end
    end
    announcements_to_be_aproved
  end

end
