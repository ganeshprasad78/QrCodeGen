class Product < ApplicationRecord
  include AASM

  aasm do
    state :new, initial: true
    state :in_progress
    state :marketing
    state :complete

    event :assign_to_production do
      transitions to: :in_progress, from: %i[new]
    end

    event :assign_to_print do
      transitions to: :complete, from: %i[in_progress]
    end
  end

  belongs_to :user
  belongs_to :master_list

  delegate :name, :name_hidden, :package, :package_hidden, :application, :application_hidden,
           :data_sheet_url, :data_sheet_hidden, :safety_sheet_url, :safety_sheet_hidden, to: :master_list, allow_nil: true

  scope :for_marketing, -> { where(aasm_state: %w[new in_progress marketing complete]) }
  scope :for_technical, -> { where(aasm_state: %w[new in_progress marketing complete]) }
  scope :for_production, -> { where(aasm_state: %w[new in_progress]) }
  scope :for_print, -> { where(aasm_state: %w[complete]) }

  def production_assign?
    aasm_state == 'new' && marketing_field_not_blank?
  end

  def marketing_field_not_blank?
    !name.blank? && !package.blank? && !application.blank? && !data_sheet_url.blank? && !safety_sheet_url.blank?
  end

  def print_assign?
    aasm_state == 'in_progress' && production_not_blank?
  end

  def production_not_blank?
    !manufacturing_date.blank? && !product_code.blank?
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
