class EventDatesController < ApplicationController
  before_action :set_experience

  def new
    @event_date = @experience.event_dates.build
  end

  def create
    @event_date = @experience.event_dates.build(event_date_params)

    if @event_date.save
      redirect_to experience_path(@experience), notice: "Date was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_date_params
    params.require(:event_date).permit(:date)
  end

  def set_experience
    @experience = current_group.experiences.find(params[:experience_id])
  end
end