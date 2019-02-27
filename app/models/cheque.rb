class Cheque < ApplicationRecord
  enum status: { active: 0, deleted: 1 }

  validates :name, :date, :value_cents, presence: true
end
