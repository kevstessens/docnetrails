class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def new_appointment_doctor_search

    @appointment = Appointment.new
    @doctors = Doctor.all
    if !params[:appointment].nil?
      doctor = Array.new
      if (params[:appointment][:patient_id].blank? and params[:appointment][:doctor_id].blank? and params[:appointment][:ranking].blank?)
        doctor = @doctors
      end
      unless params[:appointment][:patient_id].blank?
        medical_spec = params[:appointment][:patient_id]
        Doctor.joins(:medical_specifications).where("medical_specifications.id = ?", medical_spec).all.each do |doctor2|
          doctor.append(doctor2)
        end
      end
      unless params[:appointment][:doctor_id].blank?
        hospital = params[:appointment][:doctor_id]
        Doctor.joins(:hospitals).where("hospitals.id = ?", hospital).all.each do |doctor2|
          doctor.append(doctor2)
        end
      end
      unless params[:appointment][:ranking].blank?
        prepaid_med = params[:appointment][:ranking]
        hospital = params[:appointment][:doctor_id]
        Doctor.joins(:prepaid_medicals).where("prepaid_medicals.id = ?", prepaid_med).all.each do |doctor2|
          doctor.append(doctor2)
        end
      end
    else
      doctor = Doctor.all
    end



      @doctors = doctor
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: new_appointment_doctor_search }
    end
  end

  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
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

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end
