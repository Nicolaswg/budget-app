class AddIndexToTables < ActiveRecord::Migration[7.0]
  def change
		add_index :agreements, :author_id
		add_index :groups, :author_id
		add_index :group_agreements, :group_id
		add_index :group_agreements, :agreement_id
  end
end
