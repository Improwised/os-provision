# Role Name

Ansible role to provision [osquery](https://github.com/osquery/osquery) daemon
for [fleetmd](https://github.com/fleetdm/fleet)

## Requirements

- Ansible >2.12.1

## Role Variables

Available variables are listed below, along with default values
(see defaults/main.yaml):

`fleet_login_cred`: fleet credentials to generate and push osqueyrd stats key

If you want to use password

`fleet_login_cred`: `<USERNAME>:<PASSWORD>`

Else bearer token auth mechanism

`fleet_login_cred`: `<BEARER-TOKEN>`

`osqueryd_version`: Osquery version `5.0.1` (default)

`osqueryd_deb`: Osquery package download path for debian systems
`https://pkg.osquery.io/deb/osquery_{{ osqueryd_version }}-1.linux_amd64.deb`
(default)

`fleet_secret_env_file`: Path of entroll secret get stored

`/etc/osquery/osqueryd_env.conf` (default)

`osqueryd_flags_file`: Osqueryd flags file path `/etc/osquery/osquery.flags`
(default)
`osqueryd_conf_file`: Osqueryd config file path `/etc/osquery/osquery.conf`
(default)

`osqueryd_flags`:  Osqueryd flags in yaml format

```yaml
osqueryd_flags:
  logger_plugin: tls
  config_refresh: 10
  force: FLAG
```

...Will render at `osqueryd_flags_file` as...

```conf
--logger_plugin=tls
--config_refresh: 10
--force
```

> `FLAG` is special *value* that will make *key* as flag

`osqueryd_conf_file`: Osqueryd config file path `/etc/osquery/osquery.conf`
(default)

`osqueryd_conf`: YAML formatted Osqueryd config that will reanders as json
at `osqueryd_conf_file`

## TODO

- [ ] molecule testing

<!--
## Testing

- `molecule --all --parallel`

### Requirements

- Vagrant >2.2.18
- molecule >3.5.2
  - vagrant:0.6.3 from molecule_vagrant
  -
-->

## License

MIT
