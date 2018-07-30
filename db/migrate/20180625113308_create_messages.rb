class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true
      t.integer :active, :default => 0
      t.timestamps
    end
  end
end
