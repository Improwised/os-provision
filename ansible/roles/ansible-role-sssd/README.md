# Role Name

Ansible role to provision SSSD LDAP with PAM on debian and arch

## Requirements

- Ansible >2.11.5

## Role Variables

Available variables are listed below, along with default values (see defaults/main.yaml):

`sssd_restarted_state`: sssd service restarted state (default "restarted")

`sshd_restarted_state`: sshd service restarted state (default "restarted")

`sudoers_allowed_groups`: LDAP group set to be sudoer (default "1001")

`sshd_sss_config_enable`: enable sssd based ssh login (default "no")

`sssd_config`: `yaml` based SSSD config, example below

```yaml
sssd:
  config_file_version: 2
  services: nss, pam, sudo, ssh
  domains: IMPROWISED

domain/IMPROWISED:
  cache_credentials: true
  debug_level: 5
```

this will convert as `sssd.conf`

```conf
[sssd]
  config_file_version: 2
  services: nss, pam, sudo, ssh
  domains: IMPROWISED

[domain/IMPROWISED]
  cache_credentials: true
  debug_level: 5
```

## Example Playbook

```yaml
---
- hosts: all
  become: yes
  tasks:
    - name: "Provision SSSD"
      include_role:
        name: "ansible-role-sssd"

```

## Testing

- `molecule --all --parallel`

### Requirements

- Vagrant >2.2.18
- molecule >3.5.2
  - vagrant:0.6.3 from molecule_vagrant

## License

BSD
