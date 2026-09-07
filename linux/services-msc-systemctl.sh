systemctl list-units --type=service --state=running   # what's running right now
systemctl status sshd                                   # properties + recent log, one screen
systemctl enable sshd                                    # "Automatic" startup type
systemctl disable sshd                                    # "Disabled" startup type
systemctl restart sshd                                    # right-click > Restart
