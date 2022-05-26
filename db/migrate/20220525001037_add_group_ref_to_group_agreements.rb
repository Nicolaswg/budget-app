class AddGroupRefToGroupAgreements < ActiveRecord::Migration[7.0]
  def change
		add_foreign_key :group_agreements, :groups, column: :group_id, on_delete: :cascade
  end
end
