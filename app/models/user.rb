class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable

  before_create :generate_authentication_token

  def self.with_auth_token(token)
    where(authentication_token: token)
  end

  private

  def generate_authentication_token
    token = Devise.friendly_token

    if self.class.with_auth_token(token).any?
      generate_authentication_token
    else
      self.authentication_token ||= token
    end
  end
end
