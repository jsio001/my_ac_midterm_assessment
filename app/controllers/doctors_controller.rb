class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @doctors = Doctors.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctors = Doctor.find(params[:id])
    if @doctor.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @doctors = Doctor.find(params[:id])
    @doctors.delete
    redirect_to root_path
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :address, :gender)
  end

end
