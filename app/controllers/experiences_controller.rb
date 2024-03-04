class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.ordered
  end

  def show; end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      respond_to do |format|
        format.html { redirect_to experiences_path, notice: 'Experience was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to experiences_path, notice: 'Experience was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_path, notice: 'Experience was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name)
  end
end
