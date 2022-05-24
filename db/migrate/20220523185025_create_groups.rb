class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.integer :author_id
			t.decimal :total_ammount, default: 0

      t.timestamps
    end
		add_index :groups, :author_id
		add_foreign_key :groups, :users, column: :author_id, on_delete: :cascade
  end
end
