class CreatePrivateMessageRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :private_message_recipients do |t|
      t.belongs_to :private_message
      t.belongs_to :recipient
      t.timestamps
    end
    remove_column :private_messages, :recipient_id
  end
end
