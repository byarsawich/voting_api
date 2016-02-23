class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :candidate_id

      t.timestamps null: false
    end
    add_index :votes, :candidate_id
  end
end
