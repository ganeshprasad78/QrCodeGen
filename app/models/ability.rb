class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.technical?
      can %i[read create update destroy], MasterList
      can :read, Product
      can :print, Product do |product|
        product.can_print?
      end
      can :print_assign, Product do |product|
        product.print_assign?
      end
      can :production_assign, Product do |product|
        product.production_assign?
      end
    elsif user.marketing?
      can %i[read create update destroy], MasterList
      can :read, Product
      can :print, Product do |product|
        product.can_print?
      end
      can :print_assign, Product do |product|
        product.print_assign?
      end
      can :production_assign, Product do |product|
        product.production_assign?
      end
    elsif user.production?
      can %i[create update read], Product
      can %i[production_update update], Product
      can :generate_qr_code, Product do |product|
        product.aasm_state == 'initial'
      end
      can :print, Product do |product|
        product.can_print?
      end
    elsif user.printer?
      can %i[read], Product
      can :print, Product do |product|
        product.can_print?
      end   
    else
      can :show, Product
    end
  end
end
