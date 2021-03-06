class DestinationsController < ApplicationController
  include Concerns::EventPublishing

  def index
    render json: Destination.alphabetized
  end

  def show
    render json: destination
  end

  def update
    destination.update_attributes(destination_params)
    publish_event('destinations', serialized_resource(destination))

    render json: destination
  end

  def create
    destination = Destination.create(destination_params)
    publish_event('destinations', serialized_resource(destination))

    render json: destination
  end

  def destroy
    destination.destroy
    head :no_content
  end

  private

  def destination_params
    data[:attributes].slice(:name)
  end

  def destination
    @destination ||= Destination.find(params[:id])
  end
end
