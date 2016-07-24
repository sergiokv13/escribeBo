class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campament
  belongs_to :chapter

  def self.drop_gestion
  	Charge.all.each do |charge|
  		x = ChargesHistory.new(charge.attributes)
  		x.save
  		charge.campament.drop_gestion
  		charge.chapter.drop_gestion
  	end
  	Charge.delete_all
  end


end
