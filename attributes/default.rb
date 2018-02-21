default['zabbix']['proxy']['server'] = '192.168.0.187'
default['path'] = '/usr/share/doc/zabbix-proxy-mysql*/schema.sql.gz'
default['zabbix']['proxy']['hostname'] = 'zabbix_proxy'
default['zabbix']['proxy']['db_name'] = 'zabbix_proxy'
default['zabbix']['proxy']['user_name'] = 'zabbix'
default['zabbix']['proxy']['user_password'] = '123456'
default['zabbix']['proxy']['TLSConnect'] = 'psk'
default['zabbix']['proxy']['TLSAccept'] = 'psk'
default['zabbix']['proxy']['TLSPSKIdentity'] = 'PSK 001'
default['zabbix']['proxy']['TLSPSKFile'] = '/etc/zabbix/zabbix_proxy.psk'
default['port'] = '10051/tcp'
