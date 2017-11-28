class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
      user ||= User.new # guest user (not logged in)
      if user.user_type_id==1
        can :manage, :all
      elsif user.user_type_id==3 or user.user_type_id==4

        can :read, Item 
        
        cannot :manage, Category
        cannot :manage, UserType
        
        ##can :manage, Location

        can :read, Notification do |notification|
          notification.recipient==user or notification.actor==user
        end
        can :manage, Rating do |r|
          r.user==user
        end
        can :manage, Transaction do |t|
          t.lender_id==user or t.borrower_id==user 
        end
       can :read, User
        can :manage, User do |u|
          u.id==user.id
        end
        #Items authorization
        can :manage, Item do |item|
          item.user==user
        end
        can :destroy, Item do |item|
          item.user==user
        end
        
        can :create, Item

        #Rentals authorization
        can :read, Rental do |rental|
          rental.user==user 
        end
        
        can :change_to_accept, Rental do |rental|
           rental.item.owner==user
        end
        
        
        
        can :update, Rental do |rental|
           rental.user==user
        end
        
        can :destroy, Rental do |rental|
          rental.user==user or rental.item.owner==user
        end
        
        can :create, Rental
        can :create, Rating
        
      end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
