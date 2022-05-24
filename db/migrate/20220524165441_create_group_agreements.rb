class CreateGroupAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :group_agreements do |t|
      t.integer :group_id
      t.integer :agreement_id

      t.timestamps
    end
		add_index :group_agreements, :group_id
		add_index :group_agreements, :agreement_id
		add_foreign_key :group_agreements, :groups, column: :group_id, on_delete: :cascade
		add_foreign_key :group_agreements, :agreements, column: :agreement_id, on_delete: :cascade
  end
end
