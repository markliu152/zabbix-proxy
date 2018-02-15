include_recipe 'zabbix1::mysql'



bash 'zcat_schema' do
  user 'root'
    cwd node['zabbix']['schema']['path'].to_s
    code <<-"EOH"
      zcat #{node['zabbix']['schema']['path']}/create.sql.gz | mysql -u#{node['zabbix']['mysql']['user_name']} -p#{node['zabbix']['mysql']['user_password']} #{node['zabbix']['mysql']['db_name']}
    EOH
    not_if "mysqlshow --user=root --password=#{node['zabbix']['mysql']['root_password']} #{node['zabbix']['mysql']['db_name']}"
end

bash 'create_psk' do
  user 'root'
  code <<-"EOH"
    sh -c "openssl rand -hex 32 > /etc/zabbix/zabbix_proxy.psk"
  EOH
end

