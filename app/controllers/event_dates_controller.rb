class EventDatesController < ApplicationController
  before_action :set_experience
  before_action :set_event_date, only: [:edit, :update, :destroy, :show]

  def show; end

  def new
    @event_date = @experience.event_dates.build
  end

  def create
    @event_date = @experience.event_dates.build(event_date_params)

    if @event_date.save
      respond_to do |format|
        format.html { redirect_to experience_path(@experience), notice: "Date was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event_date.update(event_date_params)
      respond_to do |format|
        format.html { redirect_to experience_path(@experience), notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event_date.destroy

    respond_to do |format|
      format.html { redirect_to experience_path(@experience), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  def event_date_params
    params.require(:event_date).permit(:date)
  end

  def set_event_date
    @event_date = @experience.event_dates.find(params[:id])
  end

  def set_experience
    @experience = current_group.experiences.find(params[:experience_id])
  end
end