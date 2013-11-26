class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :server_name
      t.string :vendor
      t.string :processor
      t.string :memory

      t.timestamps
    end
  end
end
