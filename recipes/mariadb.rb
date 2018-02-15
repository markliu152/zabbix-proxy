include_recipe 'zabbix1::mysql'

bash 'zcat_schema' do
  user 'root'
    cwd node['zabbix']['schema']['path'].to_s
    code <<-"EOF"
      zcat #{node['zabbix']['schema']['path']}/schema.sql.gz | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
    EOF
    not_if "mysqlshow --user=root --password=#{node['zabbix']['mysql']['root_password']} #{node['zabbix']['mysql']['db_name']}"
end

