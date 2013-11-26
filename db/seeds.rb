# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#PERMISSIONS
ac = Permission.create :subject_class =>"Application", :subject_action =>'create', :subject_id => nil
ar = Permission.create :subject_class =>"Application", :subject_action =>'read', :subject_id => nil
au = Permission.create :subject_class =>"Application", :subject_action =>'update', :subject_id => nil
ad = Permission.create :subject_class =>"Application", :subject_action =>'destroy', :subject_id => nil
sc = Permission.create :subject_class =>"Server", :subject_action =>'create', :subject_id => nil
sr = Permission.create :subject_class =>"Server", :subject_action =>'read', :subject_id => nil
su = Permission.create :subject_class =>"Server", :subject_action =>'update', :subject_id => nil
sd = Permission.create :subject_class =>"Server", :subject_action =>'destroy', :subject_id => nil


#ROLES
admin_role = Role.create :role_name=> "Admin", :permission_ids => [ac.id, ar.id, au.id, ad.id, sc.id, sr.id, su.id, sd.id]
server_role = Role.create :role_name=>"Servers Admin", :permission_ids => [sc.id, sr.id, su.id, sd.id]
app_role = Role.create :role_name=>"Applications Admin", :permission_ids => [ac.id, ar.id, au.id, ad.id]
front_desk_role = Role.create :role_name=>"Front Desk User", :permission_ids => [sr.id, ar.id]


#USER
User.create :email=>"superadmin@spritle.com", :password=>"super12345", :password_confirmation => "super12345", :super_admin => true
User.create :email=>"admin@spritle.com", :password=>"admin12345", :password_confirmation => "admin12345", :role_ids => [admin_role.id], :super_admin => false
User.create :email=>"serveradmin@spritle.com", :password=>"server12345", :password_confirmation => "server12345", :role_ids => [server_role.id], :super_admin => false
User.create :email=>"appadmin@spritle.com", :password=>"app12345", :password_confirmation => "app12345", :role_ids => [app_role.id], :super_admin => false
User.create :email=>"frontdesk@spritle.com", :password=>"front12345", :password_confirmation => "front12345", :role_ids => [front_desk_role.id], :super_admin => false


#APPLICATION
Application.create :name=>"Word", :version => "2008", :vendor => "Microsoft"
Application.create :name=>"Timesheet", :version => "1.0", :vendor => "Serole Technologies"


#SERVER
Server.create :server_name => "Ubuntu Server 13.04", :processor => "Intel Xeon", :memory => "512 MB", :vendor => "Canonical"
Server.create :server_name => "Windows Server 2003", :processor => "Intel P4", :memory => "1 GB", :vendor => "Microsoft"














