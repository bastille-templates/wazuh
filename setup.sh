cd /root/; fetch "https://people.freebsd.org/~acm/ports/wazuh/wazuh-gen-certs.tar.gz"
cd /root/; tar xvfz wazuh-gen-certs.tar.gz
echo 'indexer1_ip="10.0.0.10"' > /root/wazuh-gen-certs/indexer.lst
echo 'server1_ip="10.0.0.20"' > /root/wazuh-gen-certs/server.lst
echo 'dashboard_ip="10.0.0.30"' > /root/wazuh-gen-certs/dashboard.lst
cd /root/wazuh-gen-certs; echo y | sh gen-certs.sh

scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.10:~
scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.20:~
scp -r /root/wazuh-gen-certs/wazuh-certificates root@10.0.0.30:~