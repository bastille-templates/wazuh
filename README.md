# Wazuh
The Open Source Security Platform Unified XDR and SIEM protection for endpoints and cloud workloads.

## Now apply template to container
```sh
git clone https://github.com/bastille-templates/wazuh.git; cd wazuh

JAIL_IP=172.16.1.10
R_FreeBSD=14.2-RELEASE
bastille create wazuh ${R_FreeBSD} ${JAIL_IP}
PATH_JAIL="/usr/local/bastille/jails/wazuh"
cp files/jail.conf ${PATH_JAIL}/
sed -e "s,%%SERVER_IP%%,${JAIL_IP},g" -i "" ${PATH_JAIL}/jail.conf
cp files/rdr.conf ${PATH_JAIL}/

bastille stop wazuh; bastille start wazuh
bastille bootstrap https://github.com/bastille-templates/wazuh
bastille template wazuh bastille-templates/wazuh
```

## License
This project is licensed under the BSD-3-Clause license.
