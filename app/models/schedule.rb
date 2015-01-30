class Schedule < ActiveRecord::Base
	has_many :appointments, :dependent => :destroy
	belongs_to :doctor
end
