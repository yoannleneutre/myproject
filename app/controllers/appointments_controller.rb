class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
   #before_filter :authoriseDoctor, :only => [:new, :create, :edit, :update, :drsappointment]
   before_filter :authorisePatient, :only => [:new, :create, :edit, :update]

  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  def drsappointment
  unless !signed_in?
	@appointments = Appointment.where("doctor_id = ?", @current_doctor.id)
	respond_to do |format|
		format.html 
	end	
   end	
end	

def patientappointment
  unless !patientsigned_in?
	@appointments = Appointment.where("patient_id = ?", @current_patient.id)
	respond_to do |format|
		format.html 
	end	
   end	
end	
  
  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])
	@appointment.patient_id = @current_patient.id
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
	if signed_in?
		respond_to do |format|
		  format.html { redirect_to mydoctorappointments_path, notice: 'The appointment was successfully deleted' }
		  format.json { head :no_content }
		end  
	else 
		respond_to do |format|
		  format.html { redirect_to mypatientappointments_path, notice: 'The appointment was successfully deleted' }
		  format.json { head :no_content }  
		end	  
    end
  end
end
