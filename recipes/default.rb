#
# Cookbook:: zabbix-proxy
# Recipe:: default
#
# Copyright:: 2018, Mark Liu, All Rights Reserved.

include_recipe 'zabbix1::release'
include_recipe 'zabbix1::firewall'
include_recipe 'zabbix-proxy::mariadb'

package 'zabbix-proxy'do
  action :install
end

bash 'openssl_psk' do
  code <<-EOH
    sh -c "openssl rand -hex 32 > /etc/zabbix/zabbix_proxy.psk"
  EOH
end

template '/etc/zabbix/zabbix_proxy.conf' do
  source 'proxy.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

include_recipe 'zabbix1::selinux'

service 'zabbix-proxy' do
  action [:enable, :start]
end
