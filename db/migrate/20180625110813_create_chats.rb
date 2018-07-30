class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.string :description
      t.integer :admin_id
      t.string :uuid
      t.integer :active, :default => 0
      t.timestamps
    end
  end
end
