class ApplicationController < ActionController::Base
  extend Memoist
  include ActionController::HttpAuthentication::Token

  protect_from_forgery with: :null_session

  # before_filter :authenticate_user_from_token!
  # before_filter :authenticate_user!

  def current_user
    @current_user ||= User.by_authorization(*authorization) if authorization
    # @current_user ||= User.first
  end

  def authorization
    token_and_options(request)
  end
  memoize :authorization

  def data
    @data ||= JSON.parse(request.body.read)['data'].with_indifferent_access
  end

  def serialized_resource(resource)
    ActiveModel::SerializableResource.new(resource).serializable_hash
  end

  private

  def require_authentication
    render nothing: true unless current_user
  end

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:email].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end
end
