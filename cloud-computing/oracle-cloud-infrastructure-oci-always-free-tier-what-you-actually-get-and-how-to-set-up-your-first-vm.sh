# 1. OCI's own Security List / Network Security Group (done in the console):
#    Networking > Virtual Cloud Networks > your VCN > Security Lists >
#    add an Ingress Rule for the port you need (e.g. TCP 80/443)

# 2. The instance's own OS-level firewall:
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT   # Oracle Linux (iptables-based)
sudo ufw allow 80/tcp                                                        # Ubuntu (if ufw is active)
