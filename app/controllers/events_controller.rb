class EventsController < ApplicationController
  def index
    render json: Event.reverse_chronological
  end

  def show
    render json: event, include: ['destination_options.destination', 'votes']
  end

  # def update
  #   event.update_attributes(event_params)
  #   render json: event
  # end

  def create
    event = Event.create(event_params)
    Destination.randomize(3).each do |destination|
      event.destination_options.create(destination: destination)
    end
    render json: event, include: ['destination_options.destination', 'votes']
  end

  def destroy
    event.destroy
    head :no_content
  end

  private

  def current_vote
    event.user_vote(current_user)
  end

  def event_params
    params.fetch(:event, {})
  end

  def event
    @event ||= Event.find(params[:id])
  end
end
