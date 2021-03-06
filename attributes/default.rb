{
  'host' => 'archive.ubuntu.com',
  'method' => 'rsync',
  'dists' => 'precise',
  'arch' => 'amd64',
  'sections' => "main,main/debian-installer,universe,restricted,multiverse",
  'state-cache-days' => '7',
  # universe is 29G in precise!
  'target_dir' => '/share/ubuntu',
  'source' => nil
}.each do |k,v| 
  default['debmirror'][k]=v
end
