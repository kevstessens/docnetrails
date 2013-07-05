class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
    @user = User.new
    @user.patient=@patient

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit

    @patient = Patient.find(params[:id])
    @user = User.find(@patient.user_id)
  end

  def create_for_doctor
    @patient_created = User.new(params[:user])
    @patient_created.user_role_id = UserRole.paciente.id
    @patient_created.birthdate = Date.current
    @patient_created.prepaid_medical_id = 1
    @patient = Patient.new
    @patient_created.patient = @patient

    respond_to do |format|
      if @patient_created.save
        format.html { redirect_to appointments_create_for_doctor_path(:datetime => params[:user][:datetime], :patient_id => @patient_created.patient.id), notice: 'Appointment and new patient were successfully created.' }
      else
        format.html { redirect_to @patient_created, notice: 'Error.' }
        format.json { render json: @patient_created.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /patients
  # POST /patients.json
  def create
    @user = User.new(params[:user])
    @user.user_role_id = UserRole.paciente.id

    respond_to do |format|
      if @user.save
        @patient = @user.patient
        NewPatientMailer.new_patient_created(@patient).deliver
        format.html { redirect_to @patient, notice: t("controllers.patient_c") }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])
    @user = @patient.user


    respond_to do |format|
      if @user.update_without_password(params[:user])
        format.html { redirect_to @patient, notice: t("controllers.patient_u") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
