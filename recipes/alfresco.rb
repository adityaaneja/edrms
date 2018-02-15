
remote_file '/usr/share/tomcat/webapps/alfresco.war' do
	source 'http://192.168.122.1/alfresco.war'
	owner 'tomcat'
	group 'tomcat'
	mode '0755'
	action :create 
end

remote_file '/usr/share/tomcat/webapps/share.war' do
        source 'http://192.168.122.1/share.war'
        owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end




%w[/usr/share/tomcat/shared /usr/share/tomcat/shared/classes /usr/share/tomcat/shared/lib /usr/share/tomcat/shared/classes/alfresco 
/usr/share/tomcat/shared/classes/alfresco/extension /usr/share/tomcat/shared/classes/alfresco/web-extension].each do |path|
directory path do
   	owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end
end

cookbook_file '/usr/share/tomcat/shared/lib/xmpbox-1.8.10.jar' do 
  source 'xmpbox-1.8.10.jar'
  owner 'tomcat'
  group 'tomcat'
  mode 0755
  action :create
end

cookbook_file '/usr/share/tomcat/shared/lib/preflight-1.8.10.jar' do
  source 'preflight-1.8.10.jar'
  owner 'tomcat'
  group 'tomcat'
  mode 0755
  action :create
end

cookbook_file '/usr/share/tomcat/shared/lib/mysql-connector-java.jar' do
        source 'mysql-connector-java.jar'
        owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end


template '/usr/share/tomcat/shared/classes/alfresco-global.properties' do
        source 'alfresco/alfresco-global.properties.erb'
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
end

template '/usr/share/tomcat/shared/classes/alfresco-encrypted.properties' do
        source 'alfresco/alfresco-encrypted.properties.erb'
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
end

template '/usr/share/tomcat/shared/classes/alfresco/web-extension/share-config-custom.xml' do
        source 'alfresco/share-config-custom.xml.erb'
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
end

template '/usr/share/tomcat/shared/classes/alfresco/web-extension/smartfolders-amp-actions-config.xml' do
        source 'alfresco/smartfolders-amp-actions-config.xml.erb'
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
end


%w[/usr/share/tomcat/alf_data /usr/share/tomcat/alf_data/contentstore /usr/share/tomcat/alf_data/contentstore.deleted
   /usr/share/tomcat/alf_data/solr4 /usr/share/tomcat/alf_data/keystore].each do |path|
directory path do
        owner 'tomcat'
        group 'tomcat'
        mode '0755'
        action :create
end
end

include_recipe "edrms::alfresco-keystore"


service "tomcat.service" do
        action :restart
end

