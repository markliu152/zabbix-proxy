#
# Cookbook:: zabbix-proxy
# Recipe:: default
#
# Copyright:: 2018, Mark Liu, All Rights Reserved.

include_recipe 'zabbix::release'
include_recipe 'zabbix::firewall'

package 'zabbix-proxy'do

template '/etc/zabbix/zabbix_proxy.conf' do
  source 'proxy.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

include_recipe 'zabbix-proxy::mariadb'
include_recipe 'zabbix1::selinux'

service 'zabbix-proxy' do
  action [:enable, :start]
end
