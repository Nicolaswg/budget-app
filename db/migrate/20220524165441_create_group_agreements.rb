class CreateGroupAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :group_agreements do |t|
      t.integer :group_id
      t.integer :agreement_id

      t.timestamps
    end
  end
end
