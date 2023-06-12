class ExerciseSetsController < ApplicationController

  def create
    @set = ExerciseSet.new(exercise_set_params)
    @set.custom_field = JSON.parse(exercise_set_params[:custom_field])
    @set.block = Block.find(params[:exercise_set][:block_id])
    @session = @set.block.session
    if @set.save
      redirect_to exercise_session_path(@session)
    else
      render "exercise_sessions/show", status: :unprocessable_entity
    end
  end

  def destroy
    @set = ExerciseSet.find(params[:id])
    @session = @set.block.session
    @set.destroy
    redirect_to exercise_session_path(@session), status: :see_other
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:distance, :weight, :repetitions, :block_id, :custom_field)
  end
end
