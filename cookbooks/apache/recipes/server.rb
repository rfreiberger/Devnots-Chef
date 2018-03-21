package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content '<html><center><h1>Hello World!</h1></center></html>'
  content "<html><center><br>
           Welcome to #{node['hostname']}, at #{node['ipaddress']} powered
           by a #{node['cpu']['0']['mhz']} with memory size of #{node['memory']['total']}.
           "
  mode '0755'
end

service 'httpd' do
  action [ :start, :enable ]
end
