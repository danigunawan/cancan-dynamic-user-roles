class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :version
      t.string :vendor

      t.timestamps
    end
  end
end
