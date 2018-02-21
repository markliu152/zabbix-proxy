package 'mariadb'
package 'mariadb-server'
service 'mariadb' do
  action [:enable, :start]
end

bash "create_database" do
  code <<-EOH
    mysql -uroot -e "create database #{node['zabbix']['proxy']['db_name']} character set utf8 collate utf8_bin;"
    mysql -uroot -e "grant all privileges on #{node['zabbix']['proxy']['db_name']}.* to #{node['zabbix']['proxy']['user_name']}@localhost identified by '#{node['zabbix']['proxy']['user_password']}';"
  EOH
  not_if "mysql -uroot -e'show databases;' | grep #{node['zabbix']['proxy']['db_name']}"
end

bash 'extract_data' do
  code <<-EOH
    zcat #{node['path']} | mysql -u#{node['zabbix']['proxy']['user_name']} -p#{node['zabbix']['proxy']['user_password']} #{node['zabbix']['proxy']['db_name']}
  EOH
end
