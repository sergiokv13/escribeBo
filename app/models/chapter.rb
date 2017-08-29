class Chapter < ActiveRecord::Base
  belongs_to :chapter_president, class_name: 'User'
  belongs_to :campament
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing_entitie.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :announcements
  belongs_to :chapter_consultant_president, foreign_key: 'chapter_consultant_president_id',class_name: 'User'

  has_many :demolays, foreign_key: 'chapter_id', class_name: 'User'
  has_many :knights, foreign_key: 'priory_id', class_name: 'User'
  has_many :chevaliers, foreign_key: 'court_id', class_name: 'User'
  has_many :chapter_user_follows


  validates :chapter_name, :presence => true

  def announcements_to_aprove
    announcements = Announcement.all
    announcements_to_be_aproved = Array.new
    announcements.each do |announcement|
      if !announcement.is_aproved
        announcements_to_be_aproved.push(announcement)
      end
    end
    announcements_to_be_aproved
  end

  def consultants
    c = Array.new
    Degree.where(:chapter_id => id).where(:title => "Consultor").each do |degree|
      if degree.aproved
        c.push(User.find(degree.user_id)).uniq
      end
    end
    c
  end

  def aproved_announcements
    announcements_to_be_aproved = Array.new
    announcements.each do |announcement|
      if announcement.is_aproved
        announcements_to_be_aproved.push(announcement)
      end
    end
    announcements_to_be_aproved
  end

  def chapter_users
    if self.chapter_type == "Capítulo"
        return self.demolays
    end
    if self.chapter_type == "Priorato"
      return self.knights
    end
    if self.chapter_type == "Corte"
      return self.chevaliers
    end
  end

  def drop_gestion
    self.chapter_president = nil
    self.chapter_consultant_president = nil
    self.save
  end

  def self.autoridades
    autoridades = Array.new
    Chapter.all.each do |c|
      if !c.chapter_consultant_president.nil?
        autoridades.push(User.find(c.chapter_consultant_president))
      end
      if !c.chapter_president.nil?
        autoridades.push(User.find(c.chapter_president))
      end
      autoridades
    end
  end

end
