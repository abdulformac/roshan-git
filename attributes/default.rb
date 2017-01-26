default['gitlab-setup'] ['prereq_packages'] = %w(curl openssh-server postfix)
default['gitlab-setup'] ['enable_start_services'] = %w(sshd postfix)
default['gitlab-setup'] ['firewall_rules'] = %w(80 443)

