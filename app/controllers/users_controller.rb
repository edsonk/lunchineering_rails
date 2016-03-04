class UsersController < ApplicationController
  def index
    if params[:current]
      render json: current_user
    end
  end

  def show
    render json: current_user
  end
end
