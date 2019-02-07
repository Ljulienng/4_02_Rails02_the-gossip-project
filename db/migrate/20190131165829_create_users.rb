class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :email
      t.string :password_digest
      t.text :description
      t.integer :age
      t.belongs_to :city
      t.timestamps
    end
  end
end
