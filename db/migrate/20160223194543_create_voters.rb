class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :party
      t.string :token

      t.timestamps null: false
    end
  end
end
