%w[browser.p12 generate_keystores.bat keystore readme.txt ssl-keystore-passwords.properties ssl-truststore-passwords.properties CreateSSLKeystores.txt generate_keystores.sh keystore-passwords.properties ssl.keystore ssl.truststore].each do |file|

cookbook_file "/usr/share/tomcat/alf_data/keystore/#{file}" do
        source "#{file}"
        owner  'tomcat'
        group  'tomcat'
        mode   '0644'
	action :create
end
end
