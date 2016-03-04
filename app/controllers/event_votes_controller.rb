class EventVotesController < ApplicationController
  include Concerns::EventPublishing

  before_filter :require_authentication

  def index
    render json: filter_votes, include: 'destination_option.destination'
  end

  def show
    render json: vote
  end

  def update
    if vote.update_attributes(vote_params)
      # publish_event('/event_votes', serialized_resource(vote))
      render json: vote
    end
  end

  private

  def event
    @event ||= Event.find(params[:event_id])
  end

  def vote
    @vote ||= current_user.event_votes.find(params[:id])
  end

  def current_vote
    @current_vote ||= event_votes.by_user(current_user).first_or_create
  end

  def event_votes
    @event_votes ||= event.votes
  end

  def filter_votes
    return current_vote if params[:current]

    votes = event_votes
    votes = votes.for_option(params[:option]) if params[:option]
    votes
  end

  def vote_params
    {
      destination_option_id: data[:relationships][:destination_option][:data][:id]
    }
  end
end
