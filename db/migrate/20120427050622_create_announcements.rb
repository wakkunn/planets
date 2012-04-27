class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :subject, :null => false
      t.text :content
      
      t.timestamps
    end
  end
end
