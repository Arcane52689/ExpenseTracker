class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :token, unique: true, null: false
      t.text :browswer_info

      t.timestamps null: false
    end
    add_index :sessions, :token, unique:true

  end
end
