class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
	belongs_to :schedule
	
	validates :time, presence: true
	validates :reason, presence: true
	validate :validate_datepast

	
	def validate_datepast
		errors.add(:time, "cannot be in the past") if time.past?
	end	
	
end
