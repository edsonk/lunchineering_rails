class DestinationOptionsController < ApplicationController
  def show
    render json: destination_option
  end

  private

  def destination_option
    @destination_option ||= DestinationOption.find(params[:id])
  end
end
