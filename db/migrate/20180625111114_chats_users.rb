class ChatsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chats_users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :chat, index: true, foreign_key: true
      t.integer :active, :default => 0

      t.timestamps
    end
  end
end
