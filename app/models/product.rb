class Product < ApplicationRecord
  include AASM

  aasm do
    state :new, initial: true
    state :in_progress
    state :complete

    event :assign_to_production do
      transitions to: :in_progress, from: %i[new]
    end

    event :assign_to_print do
      transitions to: :complete, from: %i[in_progress]
    end
  end
  belongs_to :user

  validates :name, presence: true
  validates :package, presence: true

  scope :for_marketing, -> { where(aasm_state: %w[new in_progress complete]) }
  scope :for_technical, -> { where(aasm_state: %w[new in_progress complete]) }
  scope :for_production, -> { where(aasm_state: %w[new in_progress]) }
  scope :for_print, -> { where(aasm_state: %w[complete]) }

  def production_assign?
    aasm_state == 'new' && !name.blank? && !package.blank? && !description.blank? && !data_sheet_url.blank? && !safety_sheet_url.blank?
  end

  def print_assign?
    aasm_state == 'in_progress' && !manufacturing_date.blank? && !product_code.blank?
  end

  def assigned_to
    case aasm_state
    when 'new'
      'marketing/technical'
    when 'in_progress'
      'production'
    when 'complete'
      'print'
    else
      ''
    end
  end
end
