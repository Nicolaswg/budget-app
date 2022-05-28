class AddUserRefToAgreements < ActiveRecord::Migration[7.0]
  def change
		add_foreign_key :agreements, :users, column: :author_id, on_delete: :cascade
  end
end
