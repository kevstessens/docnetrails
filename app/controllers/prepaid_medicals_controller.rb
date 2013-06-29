class PrepaidMedicalsController < ApplicationController
  # GET /prepaid_medicals
  # GET /prepaid_medicals.json
  def index
    @prepaid_medicals = PrepaidMedical.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prepaid_medicals }
    end
  end

  # GET /prepaid_medicals/1
  # GET /prepaid_medicals/1.json
  def show
    @prepaid_medical = PrepaidMedical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prepaid_medical }
    end
  end

  # GET /prepaid_medicals/new
  # GET /prepaid_medicals/new.json
  def new
    @prepaid_medical = PrepaidMedical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prepaid_medical }
    end
  end

  # GET /prepaid_medicals/1/edit
  def edit
    @prepaid_medical = PrepaidMedical.find(params[:id])
  end

  # POST /prepaid_medicals
  # POST /prepaid_medicals.json
  def create
    @prepaid_medical = PrepaidMedical.new(params[:prepaid_medical])

    respond_to do |format|
      if @prepaid_medical.save
        format.html { redirect_to @prepaid_medical, notice: 'Prepaid medical was successfully created.' }
        format.json { render json: @prepaid_medical, status: :created, location: @prepaid_medical }
      else
        format.html { render action: "new" }
        format.json { render json: @prepaid_medical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prepaid_medicals/1
  # PUT /prepaid_medicals/1.json
  def update
    @prepaid_medical = PrepaidMedical.find(params[:id])

    respond_to do |format|
      if @prepaid_medical.update_attributes(params[:prepaid_medical])
        format.html { redirect_to @prepaid_medical, notice: 'Prepaid medical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prepaid_medical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepaid_medicals/1
  # DELETE /prepaid_medicals/1.json
  def destroy
    @prepaid_medical = PrepaidMedical.find(params[:id])
    @prepaid_medical.destroy

    respond_to do |format|
      format.html { redirect_to prepaid_medicals_url }
      format.json { head :no_content }
    end
  end
end
