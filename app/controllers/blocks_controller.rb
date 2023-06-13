class BlocksController < ApplicationController
  before_action :set_session, only: %i[new create destroy update]

  def create
    @block = Block.new(block_params)
    @block.session = @session

    if @block.save
      redirect_to exercise_session_path(@session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @block = Block.find(params[:block][:block_id])
    @block.update(block_params)
    redirect_to exercise_session_path(@session), status: :see_other
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    redirect_to exercise_session_path(@session), status: :see_other
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end

  def block_params
    params.require(:block).permit(:name, :note, :gear, :rest_between_sets, :custom_field, :session_id, :category_id)
  end
end
