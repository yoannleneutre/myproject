class Doctor < ActiveRecord::Base
	has_many :appointments, :dependent => :destroy
	has_many :schedules, :dependent => :destroy
	
	validates :name, presence: true
	validates :adress, presence: true
	validates :sex, presence: true
	validates :email, presence: true
	validates :password, presence: true 
	has_secure_password
	validates_confirmation_of :password
	validates_uniqueness_of :email
	validate :validate_datefuture
	
	geocoded_by :adress
	after_validation :geocode, :if => :adress_changed?

	def self.search(search)
		search_condition = search + "%"
		find(:all, :conditions => ['name LIKE ?', search_condition])
	end		
	
	
	
	def validate_datefuture
		errors.add(:dob, "cannot be in the future") if dob.future?
	end	
	
	def age
	(Date.today - dob).to_i/365
	end	
	
end
