class PostPolicy < ApplicationPolicy
def index?
  true
end

class Scope < Scope

    def resolve
      if user.nil?
        return []
      elsif user.admin? || user.moderator?
       scope.all
      else
        scope.where(:id => user.id)
      end
    end
  end
end

