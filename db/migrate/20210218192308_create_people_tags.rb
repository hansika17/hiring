class CreatePeopleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :people_tags do |t|
      t.string :name, null: false
      t.string :color, null: false, default: "gray"
      t.timestamps
    end
  end
end
