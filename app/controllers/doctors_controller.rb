class DoctorsController < ApplicationController

  def list_male
    @male_doctors = Doctor.select {|d| d.gender == "male"}
  end

  def list_female
    @female_doctors = Doctor.select {|d| d.gender == "female"}
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.delete
    redirect_to doctors_path
  end

  private

  def doctor_params
    params.require(:doctor).permit(:username, :address, :gender)
  end

end
