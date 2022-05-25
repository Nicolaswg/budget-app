class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
	has_many :group_agreements, foreign_key: 'group_id', dependent: :delete_all
end
