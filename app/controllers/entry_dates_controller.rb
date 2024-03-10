class EntryDatesController < ApplicationController
  before_action :set_experience
  before_action :set_entry_date, only: [:edit, :update, :destroy, :show]

  def show
    @events = @entry_date.events.ordered
  end

  def new
    @entry_date = @experience.entry_dates.build
  end

  def create
    @entry_date = @experience.entry_dates.build(entry_date_params)

    if @entry_date.save
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
    if @entry_date.update(entry_date_params)
      respond_to do |format|
        format.html { redirect_to experience_path(@experience), notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry_date.destroy

    respond_to do |format|
      format.html { redirect_to experience_path(@experience), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  def entry_date_params
    params.require(:entry_date).permit(:date)
  end

  def set_experience
    @experience = current_group.experiences.find(params[:experience_id])
  end
  
  def set_entry_date
    @entry_date = @experience.entry_dates.find(params[:id])
  end

end