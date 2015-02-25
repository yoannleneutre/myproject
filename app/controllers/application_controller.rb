class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
   def authorisePatient
	unless patientsigned_in?
		store_location
		redirect_to patientsignin_path, :notice => "You have to be signed in as a patient to access this page"
		end
   end 
  
   def authoriseDoctor
	unless signed_in?
		store_location
		redirect_to signin_path, :notice => "You have to be signed in as a doctor to access this page"
	end
   end	
   
   def authoriseNotSignDoctor
	  if signed_in?
		go_to patientsignin_path 
	  else
		redirect_to root_path, :notice => "You have to sign out as a doctor before sign in as a patient"
		print "You have to sign out as a doctor before sign in as a patient"
	  end
    end
   

  
  def store_location
	session[:return_to] = request.fullpath
  end	
  
end
