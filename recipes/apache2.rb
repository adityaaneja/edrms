include_recipe "apache2"
include_recipe "apache2::mod_proxy_ajp"
include_recipe "apache2::mod_ssl"
include_recipe "openssl"

node.default['apache']['proxy']['require'] = 'all granted'

openssl_x509 "/etc/httpd/ssl/#{node['hostname']}.pem" do
  common_name "#{node['hostname']}"
  org_unit 'IST'
  org 'University of Alberta'
  city 'Edmonton'
  state 'AB'
  country 'CA'
  expire 365
end

web_app "alfresco" do
  template "apache2/alfresco.conf.erb"
  server_name node['hostname']
  docroot "/usr/share/tomcat"
  alfresco_path "/alfresco"
  share_path "/share"
end


web_app "alfresco-ssl" do
  template "apache2/alfresco-ssl.conf.erb"
  server_name node['hostname']
  server_port node['apache']['mod_ssl']['port']
  docroot "/usr/share/tomcat"
  alfresco_path "/alfresco"
  share_path "/share"
  ssl_path "/etc/httpd/ssl/"
end

