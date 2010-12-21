class Ability
  include CanCan::Ability
  def initialize(user)
     user ||= User.new  #guest
     if user.role? :super_admin
        can :manage, :all
     elseif  user.role? :pr_admin
 	can :manager, [Announce,AnnouncesTranslation]
     endif   user.role?  :contractor_admin
        can :read,[ContractorsReport]
        can :manage , ContractorReport do |product|
             ContractorReport.try(:owner) == user
        end
     end
  end
end
