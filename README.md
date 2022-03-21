# ZeroNS Home Assistant Addon

[![GitHub Release][releases-shield]][releases]

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

![Github Actions][github-actions-shield]

[![GitHub Activity][commits-shield]][commits]

Zerotier ZeroNS home assistant addon

## About

ZeroNS provides names that are a part of [ZeroTier Central's](https://my.zerotier.com) configured _networks_; once provided an IPv4-capable network it:

- Listens on the local interface joined to that network -- you will want to start one ZeroNS per ZeroTier network.
- Provides general DNS by forwarding all queries to `/etc/resolv.conf` resolvers that do not match the TLD, similar to `dnsmasq`.
- Tells Central to point all clients that have the "Manage DNS" settings turned **on** to resolve to it.
- Finally, sets a provided TLD (`.home.arpa` is the default; recommended by IANA), as well as configuring `A` (IPv4) and `AAAA` (IPv6) records for:
  - Member IDs: `zt-<memberid>.<tld>` will resolve to the IPv4 & IPv6 addresses for them.
  - Names: _if_ the names are compatible with DNS names, they will be converted as such: to `<name>.<tld>`.
    - Please note that **collisions are possible** and that it's _up to the admin to prevent them_.
  - It additionally includes PTR records for members, in all scenarios other than 6plane.
  - _Wildcard everything mode_: this mode enables wildcards for all names under the TLD; for example `my-site.zt-<memberid>.<tld>` will resolve to the member's IP, and named hosts work the same way.

[:books: Read the full add-on documentation][docs]

## Installation

Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store** and add this URL as an additional repository:

```txt
https://github.com/daoudeddy/zerons-addon
```
or you can add it by clicking the
button below.

[![Add repository to your Home Assitant instance.][repository-badge]][repository]

**Note:** this addon require [ZeroTier Addon][zerotier-addon] to be installed.

## License

MIT License

Copyright (c) 2019-2022 Franck Nijhof

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

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[commits-shield]: https://img.shields.io/github/commit-activity/y/daoudeddy/zerons-addon.svg
[commits]: https://github.com/daoudeddy/zerons-addon/commits/main
[docs]: zerons/DOCS.md
[github-actions-shield]: https://github.com/daoudeddy/zerons-addon/actions/workflows/build.yml/badge.svg
[github-actions]: https://github.com/daoudeddy/zerons-addon/actions
[releases-shield]: https://img.shields.io/github/release/daoudeddy/zerons-addon.svg
[releases]: https://github.com/daoudeddy/zerons-addon/releases
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fdaoudeddy%2Fzerons-addon
