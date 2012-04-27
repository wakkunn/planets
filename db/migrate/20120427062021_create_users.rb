class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :group, :null => false
      t.string :name
      t.string :email
      t.string :sex
      t.string :country
      t.string :area
      t.string :address1
      t.string :address2
      t.string :phone
      t.text :hits
      t.text :catches
      t.text :balls

      t.timestamps
    end
    add_index :users, :group_id 
  end
end
