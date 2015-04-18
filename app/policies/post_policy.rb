class PostPolicy < ApplicationPolicy
def index?
  true
end

def destroy?
  user.present? && (record.user == user || user.admin? || user.moderator?)
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

