class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :subject_class
      t.string :subject_action
      t.integer :subject_id

      t.timestamps
    end
  end
end
