class Degree < ActiveRecord::Base
  belongs_to :user
  belongs_to :chapter

  def self.for_oficial
    Degree.where(president_aproved: true, deputy_aproved: true, oficial_aproved: [false, nil])
  end

  def self.for_deputy
    Degree.where(president_aproved: true, deputy_aproved: [false, nil])
  end

  def self.for_president
    Degree.where(president_aproved: [false, nil])
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
    self.save
  end
end
