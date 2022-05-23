class CreateAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.string :name
      t.float :amount, default: 0
      t.integer :author_id

      t.timestamps
    end

		add_index :agreements, :author_id
		add_foreign_key :agreements, :users, column: :author_id, on_delete: :cascade
  end
end
