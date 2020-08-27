class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.technical?
      can %i[read create update destroy], MasterList
      can :read, Product
      can %i[create update], Product
      can :production_assign, Product do |product|
        product.production_assign?
      end

    elsif user.marketing?
      can %i[read create update destroy], MasterList
      can :read, Product
      can %i[create update], Product
      can :production_assign, Product do |product|
        product.production_assign?
      end
    elsif user.production?
      can :read, Product
      can %i[production_update update], Product
      can :print_assign, Product do |product|
        product.print_assign?
      end
    elsif user.printer?
      can %i[read print], Product      
    else
      can :show, Product
    end
  end
end
