# Role Name

Ansible role to tighten security of debian or arch with SSHD, Fail2ban and UFW

## Requirements

- Ansible >2.11.5

## Role Variables

Available variables are listed below, (see defaults/main.yml for default values):

### SSHD

```security_ssh_enabled: yes```

Enable SSHD service

```ssh_restart_handler_state: restarted```

state of the SSHD (default "restarted")

```security_ssh_port: 22```

SSHD port

```yaml
security_ssh_usedns: no
security_ssh_pubkey_auth: yes
security_ssh_x11_forwarding: no
security_ssh_permit_root_login: no
security_ssh_permit_empty_password: no
security_ssh_gss_api_authentication: no
security_ssh_password_authentication: no
security_ssh_challenge_response_auth: no
```

Other SSHD configurations

### Fail2ban

> more explanation of vars <https://github.com/Oefenweb/ansible-fail2ban#variables>

```security_fail2ban_enabled: yes```

Enable fail2ban

```fail2ban_restart_handler_state: restarted```

state of fail2ban service

```fail2ban_loglevel: "INFO"```

Sets the loglevel output (e.g. 1 = ERROR, 2 = WARN, 3 = INFO, 4 = DEBUG)

```fail2ban_logtarget: /var/log/fail2ban.log```

Sets the log target. This could be a file, SYSLOG, STDERR or STDOUT

```fail2ban_syslog_target: /var/log/fail2ban.log```

```fail2ban_syslog_facility: 1```

```fail2ban_socket: /var/run/fail2ban/fail2ban.sock```

Sets the socket file, which is used to communicate with the daemon

```fail2ban_pidfile: /var/run/fail2ban/fail2ban.pid```

Sets the pid file, which is used to to store the process ID of the daemon (Only works on fail2ban >= 0.8.9)

```fail2ban_dbpurgeage: 86400```

Sets age at which bans should be purged from the database

```fail2ban_sendername: "Fail2ban"```

The 'from' name for emails sent by mta actions. NB: Use

```fail2ban_bantime: 600```

Sets the bantime

```fail2ban_maxretry: 3```

Maximum number of retries before the host is put into jail

```fail2ban_findtime: 600```

 host is banned if it has generated fail2ban_maxretry during the last `fail2ban_findtime`

```fail2ban_backend: auto```

Specifies the backend used to get files modification

```fail2ban_destemail: root@localhost```

Destination email address used

```fail2ban_banaction: iptables-multiport```

Sets the global/default banaction

```fail2ban_banaction_allports: iptables-allports```

Sets the global/default banaction for allports

```fail2ban_mta: sendmail```

Email action

```fail2ban_protocol: tcp```

Sets the default protocol

```fail2ban_chain: INPUT```

Specifies the chain where jumps would need to be added in iptables-* actions

```fail2ban_action: "%(action_)s"```

Default action. Note that variables (including the actions defined elsewhere in the config files) must be wrapped in python-style %( and )s so they are expanded

```fail2ban_services```

Service definitions

```fail2ban_services.{n}.name```

[required] Service name (e.g. ssh)

```fail2ban_services.{n}.enabled```

Whether or not enabled

```fail2ban_services.{n}.*```

[optional] Name of the option

```fail2ban_services.{n}.*.*```

[optional]: Value of the option

```yaml
fail2ban_ignoreips:
  - 127.0.0.1/8
  - ::1
```

Which IP address/CIDR mask/DNS host should be ignored from fail2ban's actions


### UFW

```security_ufw_enabled: no```

Enable ufw

```ufw_default_deny_incoming: no```

Default rule 1: deny incoming

```ufw_default_allow_outgoing: yes```

Default rule 2: allow outgoing

```ufw_logging: "off"```

Disable ufw logging

```yaml
ufw_rules:
  - rule: allow
    interface: "{{ ansible_default_ipv4['interface'] }}"
    to_port: 22
    protocol: tcp
```

UFW rule check default/main.yaml for default and possible values

## Example Playbook

```yaml
---
- hosts: all
  become: yes
  tasks:
    - name: "Security"
      include_role:
        name: "ansible-role-security-hardening"

```

## Testing

- `molecule --all --parallel`

### Requirements

- Vagrant >2.2.18
- molecule >3.5.2
  - vagrant:0.6.3 from molecule_vagrant

## License

BSD
