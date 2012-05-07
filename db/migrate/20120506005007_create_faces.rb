class CreateFaces < ActiveRecord::Migration
  def change
    create_table :faces do |t|
      t.text :email
      t.text :url

      t.timestamps
    end
  end
end
