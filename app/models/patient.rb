class Patient < ActiveRecord::Base
	has_many :appointments, :dependent => :destroy
	
	validates :name, presence: true
	validates :adress, presence: true
	validates :sex, presence: true
	validates :email, presence: true
	validates :password, presence: true
	
	has_secure_password
	validates_confirmation_of :password
	validates_uniqueness_of :email
	
	
	def age
		(Date.today - dob).to_i/365
	end	
end
