# Ubuntu/Debian-family (ufw):
sudo ufw allow 443/tcp
sudo ufw status verbose

# RHEL/CentOS/Alma/Rocky-family (firewalld):
sudo firewall-cmd --add-port=443/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
