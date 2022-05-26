class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_agreements, foreign_key: 'group_id', dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
end
