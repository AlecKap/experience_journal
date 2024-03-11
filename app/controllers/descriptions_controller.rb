class DescriptionsController < ApplicationController
  
  before_action :set_experience
  before_action :set_entry_date
  before_action :set_event
  before_action :set_description, only: [:edit, :update, :destroy, :show]

  def show; end

  def new
    @description = @event.build_description
  end

  def edit; end

  def create
    @description = @event.build_description(description_params)

    if @description.save
      redirect_to experience_entry_date_event_path(@experience, @entry_date, @event), notice: "Description was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @description.update(description_params)
      redirect_to experience_entry_date_event_path(@experience, @entry_date, @event), notice: "Description was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @description.destroy

    redirect_to experience_entry_date_event_path(@experience, @entry_date, @event), notice: "Description was successfully destroyed."
  end

  private

  def description_params
    params.require(:description).permit(:content)
  end

  def set_event
    @event = @entry_date.events.find(params[:event_id])
  end

  def set_description
    @description = @event.description
  end

  def set_entry_date
    @entry_date = EntryDate.find(params[:entry_date_id])
  end

  def set_experience
    @experience = current_group.experiences.find(params[:experience_id])
  end
end