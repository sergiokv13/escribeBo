class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :charges
  has_many :degrees
  has_many :inboxes, foreign_key: 'user2_id', class_name: 'Inbox'
  has_many :sent, foreign_key: 'user1_id', class_name: 'Inbox'
  has_many :chapters_created, foreign_key: 'chapter_president_id', class_name: 'Chapter'
  #has_one :chapter_in_charge, foreign_key: 'demolay_in_charge_id', class_name: 'Chapter'
  belongs_to :chapter_consultant, class_name: 'Chapter'
  belongs_to :chapter
  belongs_to :priory, class_name: 'Chapter'
  belongs_to :court, class_name: 'Chapter'
  belongs_to :campament

  after_create :set_first_degree

  def active_for_authentication?
    super and self.enabled
  end

  def set_first_degree
    if role == "Demolay"
      degree = Degree.new
      degree.title = "Iniciatico"
      degree.user_id = id
      degree.chapter_id = self.chapter_id
      degree.president_aproved = true
      degree.deputy_aproved = true
      degree.oficial_aproved = true
      degree.save
    end
  end

  def get_not_seen
    total = 0
    self.inboxes.each do |inbox|
      if !inbox.seen
        total += 1
      end
    end
    return total
  end

  def fullName
    name+" "+lastname
  end

  def enabled
    if president_aproved && deputy_aproved && oficial_aproved
      true
    else
      false
    end
  end

  def status
    if self.enabled
      "Habilitado"
    else
      "No Habilitado"
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

  def number_of_approvals
    if self.is_president
      User.where(president_aproved: [false, nil]).count
    end
    if self.is_deputy
      User.where(deputy_aproved: [false, nil], president_aproved: true).count
    end
    if self.is_oficial
      User.where(oficial_aproved: [false, nil], deputy_aproved: true, president_aproved: true).count
    end
  end

  def is_aprovator
    if self.is_president or self.is_deputy or self.is_oficial
      true
    else
      false
    end
  end

  def is_oficial
    if !self.charges.empty?
      if self.charges.find_by(title: "Oficial Ejecutivo") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def is_deputy
    if !self.charges.empty?
      if self.charges.find_by(title: "Delegado Regional") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def is_president
    if !self.charges.empty?
      if self.charges.find_by(title: "Presidente Consejo Consultivo") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def is_consultor
    if !self.charges.empty?
      if self.charges.find_by(title: "Consultor") != nil
        true
      else
        false
      end
    else
    end
  end

  def is_degree_demolay
    if !self.degrees.empty?
      if self.degrees.find_by(title: "Demolay") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def is_degree_caballero
    if !self.degrees.empty?
      if self.degrees.find_by(title: "Caballero") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def is_degree_chevallier
    if !self.degrees.empty?
      if self.degrees.find_by(title: "Chevallier") != nil
        true
      else
        false
      end
    else
      false
    end
  end

  def tiene_el_grado(x)
    if !self.degrees.empty?
      if self.degrees.find_by(title: x) != nil
        true
      else
        false
      end
    else
      false
    end
  end
  
  def tiene_el_cargo(x)
    if !self.charges.empty?
      if self.charges.find_by(title: x) != nil
        true
      else
        false
      end
    else
      false
    end
  end
end
