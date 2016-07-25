class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campament
  belongs_to :chapter

  def self.drop_gestion(gestion)
  	Charge.all.each do |charge|
  		x = ChargesHistory.new
      x.title = charge.title
      x.gestion = gestion
      x.user_id = charge.user_id
      x.campament_id = charge.campament_id
      x.chapter_id = charge.chapter_id
      x.created_at = charge.created_at
  		x.save
      if charge.campament != nil
  		  charge.campament.drop_gestion
      end
      if charge.chapter != nil
  		  charge.chapter.drop_gestion
      end
  	end
  	Charge.delete_all
  end


end
