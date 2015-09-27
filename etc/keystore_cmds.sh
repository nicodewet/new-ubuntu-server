keytool -import -trustcacerts -alias AddTrustExternalCARoot -file certs/AddTrustExternalCARoot.crt -keystore tomcat.keystore
keytool -import -trustcacerts -alias PositiveSSLCA2 -file certs/PositiveSSLCA2.crt -keystore tomcat.keystore
keytool -import -trustcacerts -alias mykey -file certs/www_vouchertool_com.crt -keystore tomcat.keystore
