class Purchase < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :quantity, presence: true



end