class ChangeEventToChatroomMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :event_id
    add_reference :messages, :chatroom, null: false, foreign_key: true
  end
end
