class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :password
      t.timestamps

      add_reference :username, :index => true
    end
  end
end