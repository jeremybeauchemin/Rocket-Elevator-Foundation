require 'zendesk_api'

class InterventionsController < ApplicationController
  before_action :authenticate_user!
 
  
  def building_by_customer
    customer_id = params[:id]
    buildings = Building.where(customer_id: customer_id)
    render json: buildings
  end

  def battery_by_building
    building_id = params[:id]
    batteries = Battery.where(building_id: building_id)
    render json: batteries
  end

  def column_by_battery
    battery_id = params[:id]
    columns = Column.where(battery_id: battery_id)
    render json: columns
  end

  def elevator_by_column
    column_id = params[:id]
    elevators = Elevator.where(column_id: column_id)
    render json: elevators
  end

  def new_interventions
    interventions = Intervention.new(interventions_params)
    interventions.author_id = current_user.id
    interventions.start = ''
    interventions.end = ''
    interventions.Result = 'incomplete'
    interventions.Status = 'pending'
    
    if interventions.save!
      ZendeskAPI::Ticket.create!($client, 
         {
           :author_id => interventions.author_id,
           :customer_id => interventions.customer_id,
           :building_id => interventions.building_id, 
           :battery_id => interventions.battery_id,
            :column_id => interventions.column_id, 
             :elevator_id => interventions.elevator_id,
             :employee_id => interventions.employee_id,
             :Report => interventions.Report,
             :description => "Tickets"
         }
       )
      redirect_to root_path
     else
      interventions.errors
    end
  end

  private

  def interventions_params
    params.require(:interventions).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :Report)
  end
end




