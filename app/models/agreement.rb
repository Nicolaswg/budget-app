class Agreement < ApplicationRecord
  belongs_to :user
	has_many :group_agreements, foreign_key: 'agreement_id', dependent: :delete_all
end
