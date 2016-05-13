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
end
