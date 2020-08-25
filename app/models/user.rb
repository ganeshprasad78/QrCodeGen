class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def admin?
    role.name == 'Admin'
  end

  def production?
    role.name == 'Production'
  end

  def marketing?
    role.name == 'Marketing'
  end

  def technical?
    role.name == 'Technical'
  end

  def printer?
    role.name == 'Printer'
  end

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
