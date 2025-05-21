# Wazuh
The Open Source Security Platform Unified XDR and SIEM protection for endpoints and cloud workloads.

## Now apply template to container
```sh
git clone https://github.com/bastille-templates/wazuh.git

bastille create wazuh 14.2-RELEASE Your_IP
cp files/fstab /usr/local/bastille/jails/wazuh/
cp files/jail.conf /usr/local/bastille/jails/wazuh/
bastille stop wazuh; bastille start wazuh

bastille bootstrap https://github.com/bastille-templates/wazuh
bastille template wazuh bastille-templates/wazuh
```

## License
This project is licensed under the BSD-3-Clause license.
