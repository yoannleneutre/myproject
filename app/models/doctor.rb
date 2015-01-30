class Doctor < ActiveRecord::Base
	has_many :appointments, :dependent => :destroy
	has_many :schedules, :dependent => :destroy
	
	validates :name, presence: true
	validates :adress, presence: true
	validates :phonenumber, numericality: { only_integer: true }
	validates :sex, presence: true
	validates :email, presence: true
	
end
