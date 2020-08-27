class MasterList < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :package, presence: true
  validates :application, presence: true
  validates :data_sheet_url, presence: true
  validates :safety_sheet_url, presence: true
end
