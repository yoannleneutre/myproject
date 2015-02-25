class SessionsController < ApplicationController
  
  #before_filter :authoriseNotSignDoctor, :only => [:createpatient, :newpatient]
  
  def new
  end

  def create
	doctor = Doctor.find_by_email(params[:email])
	if doctor && doctor.authenticate(params[:password])
		session[:doctor_id] = doctor.id
		redirect_to doctor[:return_to] || root_path
	else
		flash[:error] = "Invalid email/password combination"
		render 'new'
	end	
  end

  def destroy
	if signed_in?
		session[:doctor_id] = nil
		flash[:notice]= "You are disconnected"
	else
		flash[:notice] = "You need to sign in first"
	end
		redirect_to root_path
  end

  def newpatient
  end

  def createpatient
	patient = Patient.find_by_email(params[:email])
	if patient && patient.authenticate(params[:password])
		session[:patient_id] = patient.id
		redirect_to patient[:return_to] || root_path
	else
		flash[:error] = "Invalid email/password combination"
		render 'newpatient'
	end	
  end

  def destroypatient
	if patientsigned_in?
		session[:patient_id] = nil
		flash[:notice]= "You are disconnected"
	else
		flash[:notice] = "You need to sign in first"
	end	
	redirect_to root_path
  end
end
