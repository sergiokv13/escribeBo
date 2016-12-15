class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campament
  belongs_to :chapter

  def self.history(gestion , charges)
  	charges.all.each do |charge|
  		x = ChargesHistory.new
      x.title = charge.title
      x.gestion = gestion
      x.user_id = charge.user_id
      x.campament_id = charge.campament_id
      x.chapter_id = charge.chapter_id
      x.created_at = charge.created_at
  		x.save
      charge.delete
  	end
  end

  def self.drop_capitulo(gestion)
    charges = Charge.where(:ente => "Capitulo")
    history(gestion,charges)
  end

  def self.drop_priorato(gestion)
    charges = Charge.where(:ente => "Priorato")
    history(gestion,charges)
  end

  def self.drop_corte(gestion)
    charges = Charge.where(:ente => "Corte")
    history(gestion,charges)
  end

  def self.drop_departamento(gestion)
    charges = Charge.where(:ente => "Campamento")
    history(gestion,charges)
  end

  def self.drop_gabinete(gestion)
    charges = Charge.where(:ente => "Gabinete")
    history(gestion,charges)
  end

end
