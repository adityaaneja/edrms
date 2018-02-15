include_recipe "alfresco-appserver::default"
#include_recipe "alfresco-appserver::tomcat"
#include_recipe "alfresco-appserver::tomcat_single"



template '/usr/share/tomcat/conf/catalina.properties' do
        source 'tomcat/catalina.properties.erb'
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
end


template '/etc/systemd/system/tomcat.service' do
	source 'tomcat/tomcat.service.erb'
	owner  'root'
	group  'root'
	mode   '0755'
end

directory '/usr/share/tomcat/webapps' do
        owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end


directory '/usr/share/tomcat/logs' do
        owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end

