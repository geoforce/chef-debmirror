debmirror '/share/opscode' do
  host 'apt.opscode.com'
  root '/'
  method 'http'
  dists 'precise-0.10,lucid-0.10'
  arch 'amd64,i386'
  source false
  progress true
  norsync true
end

#css and such
debmirror '/share/medibuntu' do
  host 'packages.medibuntu.org'
  root '/medibuntu'
  method 'rsync'
  dists 'precise,lucid'
  arch 'amd64,i386'
  source false
  progress true
end

directory '/share/chef'

remote_file '/share/chef/chef-full_0.10.12-1_amd64.deb' do
  source 'http://s3.amazonaws.com/opscode-full-stack/ubuntu-11.04-x86_64/chef-full_10.12.0-1_amd64.deb'
  not_if {::File.exists? "/share/chef/chef-full_0.10.10-1_amd64.deb" }
end

include_recipe 'apache2'

web_app "local_ubuntu_mirror" do
  server_name node['ipaddress'] #node['hostname']
  server_aliases [node['fqdn'], "localhost"]
  docroot "/share"
  template 'localmirror.conf.erb'
end
