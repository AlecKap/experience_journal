class EventsController < ApplicationController
  before_action :set_experience
  before_action :set_entry_date
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  def show
    @description = @event.description
  end

  def new
    @event = @entry_date.events.build
  end

  def create
    @event = @entry_date.events.build(event_params)

    if @event.save
      respond_to do |format|
        format.html { redirect_to experience_entry_date_path(@experience, @entry_date), notice: "Event was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Event was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      respond_to do |format|
        format.html { redirect_to experience_entry_date_path(@experience, @entry_date), notice: "Event was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Event was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to experience_entry_date_path(@experience, @entry_date), notice: "Event was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Event was successfully destroyed." }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title)
  end
  
  def set_entry_date
    @entry_date = EntryDate.find(params[:entry_date_id])
  end
  
  def set_event
    @event = @entry_date.events.find(params[:id])
  end

  def set_experience
    @experience = current_user.experiences.find(params[:experience_id])
  end
end