class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.technical?
      can :read, Product
      can %i[create update], Product
      can :production_assign, Product do |product|
        product.production_assign?
      end
      can :print_assign, Product do |product|
        product.print_assign?
      end
    elsif user.marketing?
      can :read, Product
      can %i[create update], Product
      can :production_assign, Product do |product|
        product.production_assign?
      end
      can :print_assign, Product do |product|
        product.print_assign?
      end
    elsif user.production?
      can :read, Product
      can %i[production_update update], Product
      can :marketing_assign, Product do |product|
        product.marketing_assign?
      end
    elsif user.printer?
      can :read, Product      
    else
      can :show, Product
    end
  end
end
