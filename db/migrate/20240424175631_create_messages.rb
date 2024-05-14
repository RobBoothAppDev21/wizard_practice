class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :chat, null: false, foreign_key: true, type: :uuid
      t.integer :role, null: false, default: 0
      t.string :content, null: false
      t.integer :response_number, null: false, default: 0

      t.timestamps
    end
  end
end
