cd /root/; fetch "https://people.freebsd.org/~acm/ports/wazuh/wazuh-gen-certs.tar.gz"
cd /root/; tar xvfz wazuh-gen-certs.tar.gz
echo 'indexer1_ip="10.0.0.10"' > /root/wazuh-gen-certs/indexer.lst
echo 'server1_ip="10.0.0.20"' > /root/wazuh-gen-certs/server.lst
echo 'dashboard_ip="10.0.0.30"' > /root/wazuh-gen-certs/dashboard.lst
cd /root/wazuh-gen-certs; echo y | sh gen-certs.sh

bastille cmd wazuh-indexer passwd -p 'sshroot'
scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.10:~
bastille cmd wazuh-indexer mkdir /usr/local/etc/opensearch/certs
bastille cmd wazuh-indexer cp /root/wazuh-certificates/admin.pem /usr/local/etc/opensearch/certs/
bastille cmd wazuh-indexer cp /root/wazuh-certificates/admin-key.pem /usr/local/etc/opensearch/certs/
bastille cmd wazuh-indexer cp /root/wazuh-certificates/indexer1.pem /usr/local/etc/opensearch/certs/
bastille cmd wazuh-indexer cp /root/wazuh-certificates/indexer1-key.pem /usr/local/etc/opensearch/certs/
bastille cmd wazuh-indexer cp /root/wazuh-certificates/root-ca.pem /usr/local/etc/opensearch/certs/
bastille cmd wazuh-indexer chown -R opensearch:opensearch /usr/local/etc/opensearch/
bastille cmd wazuh-indexer chmod -R 755 /usr/local/etc/opensearch/

scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.20:~
bastille cmd wazuh-server passwd -p 'sshroot'

bastille cmd wazuh-dashboard passwd -p 'sshroot'
scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.30:~
bastille cmd wazuh-dashboard mkdir /usr/local/etc/opensearch-dashboards/certs
bastille cmd wazuh-dashboard cp /root/wazuh-certificates/dashboard.pem /usr/local/etc/opensearch-dashboards/certs/
bastille cmd wazuh-dashboard cp /root/wazuh-certificates/dashboard-key.pem /usr/local/etc/opensearch-dashboards/certs/
bastille cmd wazuh-dashboard cp /root/wazuh-certificates/root-ca.pem /usr/local/etc/opensearch-dashboards/certs/
bastille cmd wazuh-dashboard chown www:www /usr/local/etc/opensearch-dashboards/certs/root-ca.pem
bastille cmd wazuh-dashboard chmod 755 /usr/local/etc/opensearch-dashboards/certs/root-ca.pem
