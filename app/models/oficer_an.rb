class OficerAn < ActiveRecord::Base
	validates :text, presence: true
	validates :title, presence: true
	validates :deadline, presence: true

	validate :date_validation
	 
	 has_attached_file :document
 	 validates_attachment_content_type :document, content_type: /\Aimage\/.*\z/


	def date_validation
		date_today = DateTime.now.to_date
		if deadline != nil && date_today > self.deadline
			errors.add(:deadline, 'La fecha ya paso.')
		else
			true
		end
	end

	def state
		date_today = DateTime.now.to_date
		return date_today < self.deadline
	end 
	
end
