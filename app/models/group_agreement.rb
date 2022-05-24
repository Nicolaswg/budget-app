class GroupAgreement < ApplicationRecord
	after_create :increase_group_total

	belongs_to :agreement
	belongs_to :group

	def increase_group_total 
		group.increment!(:total_ammount, agreement.amount)
	end
end
