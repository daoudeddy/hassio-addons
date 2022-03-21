# ZeroNS Addon: a name service centered around the ZeroTier Central API

ZeroNS provides names that are a part of [ZeroTier Central's](https://my.zerotier.com) configured _networks_; once provided an IPv4-capable network it:

- Listens on the local interface joined to that network -- you will want to start one ZeroNS per ZeroTier network.
- Provides general DNS by forwarding all queries to `/etc/resolv.conf` resolvers that do not match the TLD, similar to `dnsmasq`.
- Tells Central to point all clients that have the "Manage DNS" settings turned **on** to resolve to it.
- Finally, sets a provided TLD (`.home.arpa` is the default; recommended by IANA), as well as configuring `A` (IPv4) and `AAAA` (IPv6) records for:
  - Member IDs: `zt-<memberid>.<tld>` will resolve to the IPv4 & IPv6 addresses for them.
  - Names: _if_ the names are compatible with DNS names, they will be converted as such: to `<name>.<tld>`.
    - Please note that **collisions are possible** and that it's _up to the admin to prevent them_.
  - It additionally includes PTR records for members, in all scenarios other than 6plane.

## Installation

Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store** and add this URL as an additional repository:

```txt
https://github.com/daoudeddy/zerons-addon
```
or you can add it by clicking the
button below.

[![Add repository to your Home Assitant instance.][repository-badge]][repository]

**Note:** this addon require [ZeroTier Addon][zerotier-addon] to be installed.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
network: '!secret zerotier_network_id'
api_auth_token: '!secret zerotier_api_token'
app_auth_token: '!secret zerotier_app_token'
domain: example.com
wildcard: false
hosts:
  # zerotier user IP   Subdomain
  - 127.20.0.1      hassio
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `network`

Configures your ZeroTier network identifier.
This should be the same id in your ZeroTier addon.

**Note**: _This option support secrets, e.g., `!secret zerotier_network_id`._

### Option: `api_auth_token`

This token needs to be set in your ZeroTier addon so you can use it here.
For more information on the ZeroTier JSON API, [check their documentation][api].

**Note**: _This option support secrets, e.g., `!secret zerotier_auth_token`._

### Option: `app_auth_token`

Create this token in your [ZeroTier Account Manager](https://my.zerotier.com/account).

**Note**: _This option support secrets, e.g., `!secret zerotier_app_token`._

### Option: `domain`

Domain will set a TLD for your records, default is home.arpa.

### Option: `hosts`

Append your custom hosts to your records.
Check this [guide][route] if you want to access you local network.

### Option: `wildcard`

Enables wildcard mode, where all member names get a wildcard in this format: *.<name>.<tld>; this points at the member's IP address(es).

## Support

Got questions?

You have several options to get them answered:

[Open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Eddy Daoud][eddy].

## License

MIT License

Copyright (c) 2019-2022 Eddy Daoud

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_zerotier
[api]: https://www.zerotier.com/manual.shtml#4_1
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[issue]: https://github.com/daoudeddy/zerons-addon/issues
[zerotier-addon]: https://github.com/hassio-addons/addon-zerotier
[eddy]: https://github.com/daoudeddy
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/daoudeddy/zerons-addon/releases
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fdaoudeddy%2Fzerons-addon
[zerotier]: https://www.zerotier.com/
[route]: https://zerotier.atlassian.net/wiki/spaces/SD/pages/224395274/Route+between+ZeroTier+and+Physical+Networks