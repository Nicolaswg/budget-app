class CreateAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.string :name
      t.float :amount
      t.integer :author_id

      t.timestamps
    end
  end
end
