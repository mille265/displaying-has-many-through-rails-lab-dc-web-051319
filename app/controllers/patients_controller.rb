class PatientsController < ApplicationController

def index
    @patients = Patient.all
end
def show
    @patient = Patient.find(params[:id])
end
def new
    @patient = Patient.new
end
def create
    @patient = Patient.new(patient_params)
    if @patient.valid?
    @patient.save
    redirect_to patient_path(@patient)
    else
    render :new
    end
end
def edit
    @patient = Patient.find(params[:id])
end
def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
    redirect_to patient_path(@patient)
    else
    render :edit
    end
end
def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
end
private
def patient_params
    params.require(:patient).permit(:name, :subject, :patient_number)
end
end

