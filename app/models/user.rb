class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def admin?
    return unless role
    role.name == 'Admin'
  end

  def production?
    return unless role
    role.name == 'Production'
  end

  def marketing?
    return unless role
    role.name == 'Marketing'
  end

  def technical?
    return unless role
    role.name == 'Technical'
  end

  def printer?
    return unless role
    role.name == 'Printer'
  end

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
