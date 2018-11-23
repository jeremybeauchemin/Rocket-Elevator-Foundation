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
      ZendeskAPI::Ticket.create!($client, :priority => "normal",
        :subject => "#{interventions_params[:interventions]} Ticket #{interventions_params{:employee_id}}", 
        :comment => "#{interventions_params[:author_id]} from #{interventions_params[:customer_id]} with #{interventions_params[:building_id]} and #{interventions_params[:battery_id]} and #{interventions_params[:column_id]} also #{interventions_params[:elevators]} and #{interventions_params[:employee_id]} and #{interventions_params[:author_id]} and #{interventions_params[:Report]}",
        :submitter_id => current_user.id,
        :type => "Task"
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




