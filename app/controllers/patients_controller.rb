class PatientsController < ApplicationController
  def index
    if params[:deleted].to_s == 'true'
      @patients = Patient.where(deleted: true)
    else
      @patients = Patient.where(deleted: false)
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to root_path, notice: 'Successfully Create'
    else
      flash.now[:notice] = @patient.errors.full_messages
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to root_path, notice: "Successfully Update"
    else
      flash.now[:notice] = @patient.errors.full_messages
      render :edit
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @patient.update viewed_count: @patient.viewed_count + 1
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.update deleted: true
      redirect_to root_path, notice: 'Successfully Delete'
    else
      redirect_to root_path, notice: 'Something Wrong'
    end
  end

  private
    def patient_params
      params.fetch(:patient, Hash.new).permit(:first_name, :middle_name, :last_name, :date_of_birth, :gender, :location_id, :status)
    end
end
