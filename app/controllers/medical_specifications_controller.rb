class MedicalSpecificationsController < ApplicationController
  # GET /medical_specifications
  # GET /medical_specifications.json
  def index
    @medical_specifications = MedicalSpecification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_specifications }
    end
  end

  # GET /medical_specifications/1
  # GET /medical_specifications/1.json
  def show
    @medical_specification = MedicalSpecification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_specification }
    end
  end

  # GET /medical_specifications/new
  # GET /medical_specifications/new.json
  def new
    @medical_specification = MedicalSpecification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_specification }
    end
  end

  # GET /medical_specifications/1/edit
  def edit
    @medical_specification = MedicalSpecification.find(params[:id])
  end

  # POST /medical_specifications
  # POST /medical_specifications.json
  def create
    @medical_specification = MedicalSpecification.new(params[:medical_specification])

    respond_to do |format|
      if @medical_specification.save
        format.html { redirect_to @medical_specification, notice: 'Medical specification was successfully created.' }
        format.json { render json: @medical_specification, status: :created, location: @medical_specification }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_specifications/1
  # PUT /medical_specifications/1.json
  def update
    @medical_specification = MedicalSpecification.find(params[:id])

    respond_to do |format|
      if @medical_specification.update_attributes(params[:medical_specification])
        format.html { redirect_to @medical_specification, notice: 'Medical specification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_specifications/1
  # DELETE /medical_specifications/1.json
  def destroy
    @medical_specification = MedicalSpecification.find(params[:id])
    @medical_specification.destroy

    respond_to do |format|
      format.html { redirect_to medical_specifications_url }
      format.json { head :no_content }
    end
  end
end
