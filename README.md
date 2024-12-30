# Wazuh
The Open Source Security Platform Unified XDR and SIEM protection for endpoints and cloud workloads.

## Now apply template to container
```sh
bastille create wazuh 14.1-RELEASE YourIP-Bastille

bastille bootstrap https://github.com/bastille-templates/wazuh
bastille template wazuh bastille-templates/wazuh
```
Edii file /usr/local/bastille/jails/wazuh/fstab
```sh
fdesc	/dev/fd		fdescfs		rw	0	0
proc	/proc		procfs		rw	0	0
```

## License
This project is licensed under the BSD-3-Clause license.
