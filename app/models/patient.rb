class Patient < ActiveRecord::Base
	has_many :appointments, :dependent => :destroy
	
	validates :name, presence: true
	validates :adress, presence: true
	validates :phonenumber, presence: true
	validates :sex, presence: true
end
