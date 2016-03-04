module BelongsToUser
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end

  module ClassMethods
    def with_user
      joins(:user)
    end

    def by_user(user)
      user_id = user.respond_to?(:id) ? user.try(:id) : user
      where(user_id: user_id)
    end

    def user_first_name_matching(name)
      with_user.merge(User.first_name_matching(name))
    end

    def user_last_name_matching(name)
      with_user.merge(User.last_name_matching(name))
    end
  end
end
