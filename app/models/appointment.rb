class Appointment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
	belongs_to :schedule
	
	validates :time, presence: true
	validates :reason, presence: true
	
end
