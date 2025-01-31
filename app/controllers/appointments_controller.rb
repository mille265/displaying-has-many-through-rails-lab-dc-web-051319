class AppointmentsController < ApplicationController
   
    def index
        @appointments = Appointment.all
    end
    def show
        @appointment = Appointment.find(params[:id])
    end
    def new
        @appointment = Appointment.new
    end
    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.valid?
        @appointment.save
        redirect_to appointment_path(@appointment)
        else
        render :new
        end
    end

    private

    def appointment_params
        params.require(:appointment).permit(:name, :age)
    end
end

