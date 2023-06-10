* ERROR: ‘/usr/sbin/iptables-restore -w -n‘ failed: iptables-restore v1.8.2 (nf_tables)
-> https://blog.csdn.net/u014292402/article/details/127016182

* ERROR when execute "firewall-cmd --reload": centos 8, firewalld error `COMMAND_FAILED: 'python-nftables' failed`
-> https://stackoverflow.com/questions/70622426/centos-8-firewalld-error-command-failed-python-nftables-failed 
-> Change from "FirewallBackend=nftables"" into "FirewallBackend=nftables"

* Failing to start dockerd: failed to create NAT chain DOCKER
-> https://forums.docker.com/t/failing-to-start-dockerd-failed-to-create-nat-chain-docker/78269
-> Switch from nftables into iptables.

* Need to Switch from nftables into iptables-legacy by running this commands:
`sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`
