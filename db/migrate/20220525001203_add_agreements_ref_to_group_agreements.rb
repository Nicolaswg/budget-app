class AddAgreementsRefToGroupAgreements < ActiveRecord::Migration[7.0]
  def change
		add_foreign_key :group_agreements, :agreements, column: :agreement_id, on_delete: :cascade
  end
end
