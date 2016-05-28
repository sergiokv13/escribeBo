class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :charges
  has_many :degrees
  has_many :chapters_created, foreign_key: 'chapter_president_id', class_name: 'Chapter'
  #has_one :chapter_in_charge, foreign_key: 'demolay_in_charge_id', class_name: 'Chapter'
  belongs_to :chapter_consultant, class_name: 'Chapter'
  belongs_to :chapter
  belongs_to :priory, class_name: 'Chapter'
  belongs_to :court, class_name: 'Chapter'

  after_create :set_first_degree

  def active_for_authentication?
    super and self.enabled
  end

  def set_first_degree
    if role == "Demolay"
      degree = Degree.new
      degree.title = "Iniciatico"
      degree.user_id = id
      degree.save
    end
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
    if role == "Presidente Consejo Consultivo"
      User.where(president_aproved: [false, nil]).count
    end
    if role == "Delegado Regional"
      User.where(deputy_aproved: [false, nil], president_aproved: true).count
    end
    if role == "Oficial Ejecutivo"
      User.where(oficial_aproved: [false, nil], deputy_aproved: true, president_aproved: true).count
    end
  end

  def is_aprovator
    if role == "Presidente Consejo Consultivo" or role == "Delegado Regional" or role == "Oficial Ejecutivo"
      true
    else
      false
    end
  end
end
