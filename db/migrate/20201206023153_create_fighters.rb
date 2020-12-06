class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.string :photo
      t.string :weightclass
      t.integer :wins
      t.integer :losses
      t.string :titles
      t.string :about
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
