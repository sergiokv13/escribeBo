class Degree < ActiveRecord::Base
  belongs_to :user
  belongs_to :chapter


  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["application/pdf", "application/jpg", "application/png", "application/zip"]

  def aproved 
    return (self.president_aproved == true && self.deputy_aproved && self.oficial_aproved)
  end
  

  def self.all_to_be
    degrees = Array.new
    Degree.all.each do |degree|
      if !degree.aproved
        degrees.push(degree)
      end
    end
    return degrees
  end

  def is_oficial
    if self.president_aproved == true and self.deputy_aproved == true and (self.oficial_aproved == false or self.oficial_aproved == nil)
      true
    else
      false
    end
  end

  def aprove_president
    self.president_aproved = true
    self.save
  end

  def aprove_deputy
    self.deputy_aproved = true
    self.save
  end

  def aprove_oficial
    self.oficial_aproved = true
    if self.title == "Senior DeMolay"
      user = User.find(self.user_id)
      user.role = "No DeMolay"
      user.save
    end
    self.save
  end
end
