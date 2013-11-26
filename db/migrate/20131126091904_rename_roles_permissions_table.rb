class RenameRolesPermissionsTable < ActiveRecord::Migration
  def change
    rename_table :roles_permissions, :permissions_roles
  end
end
