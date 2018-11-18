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
    intervention = Intervention.new
    intervention.customer_id = intervention_params["customer_id"]
    intervention.building_id = intervention_params["building_id"]
    intervention.battery_id = intervention_params["battery_id"]
    intervention.column_id = intervention_params["column_id"]
    intervention.elevator_id = intervention_params["elevator_id"]
    intervention.employee_id = intervention_params["employee_id"]
    intervention.report = intervention_params[:description]
    intervention.starttime = ''
    intervention.endtime = ''
    intervention.result = 'incomplete'
    intervention.status = 'pending'
    
    if intervention.save
      intervention.save!

      redirect_to root_path
    else
      intervention.errors
    end
  end
end