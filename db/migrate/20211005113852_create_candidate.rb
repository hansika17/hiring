class CreateCandidate < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :email, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""

      t.timestamps null: false
    end
    User.all.each do |user|
      user.confirmed_at = Time.now.utc
      user.save!
    end
    add_index :candidates, :email, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

  end
end
