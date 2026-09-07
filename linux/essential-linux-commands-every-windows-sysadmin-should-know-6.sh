cat /etc/sysctl.conf                     # kernel-level tunables (closest thing to HKLM\SYSTEM settings)
sysctl -a | grep net.ipv4                 # view current kernel parameter values live
sudo sysctl -w net.ipv4.ip_forward=1       # change one live (like editing a DWORD and it takes effect immediately)
