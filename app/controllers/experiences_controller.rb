class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = current_group.experiences.ordered
  end

  def show; end

  def new
    @experience = Experience.new
  end

  def create
    @experience = current_group.experiences.build(experience_params)

    if @experience.save
      respond_to do |format|
        format.html { redirect_to experiences_path, notice: "Experience was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Experience was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      respond_to do |format|
        format.html { redirect_to experiences_path, notice: "Experience was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Experience was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_path, notice: "Experience was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Experience was successfully destroyed." }
    end
  end

  private

  def set_experience
    @experience = current_group.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name)
  end
end
