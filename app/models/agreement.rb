class Agreement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_agreements, foreign_key: 'agreement_id', dependent: :delete_all

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
