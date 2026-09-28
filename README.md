# singbox-rulesets

Personal Singbox rule sets for private use only.
**By using these rules, you acknowledge that you understand Singbox and take full responsibility for your network configuration.**

---

## ⚠️ Disclaimer
1. **Personal Use Only**
   These rule sets are customized for my personal needs and may not suit your requirements.
   - No guarantees of accuracy, completeness, or suitability for any purpose.
   - Use at your own risk.

2. **No Official Support**
   This project is not affiliated with the Singbox team.
   - Issues related to these rules should not be reported to Singbox official channels.

3. **Security & Privacy**
   - Rules may include domain/IP targets I trust, but you should verify them yourself.
   - I am not responsible for any data leaks or security incidents caused by using these rules.

---

## 📝 Source Format
Refer to the official documentation:
[Singbox Rule Set Source Format](https://sing-box.sagernet.org/configuration/rule-set/source-format/)

## App Store direct routing

The second rule in `rulesets/direct.json` contains selected App Store API,
download, image and CDN alias hosts marked `@cn` in the upstream
[apple](https://github.com/v2fly/domain-list-community/blob/master/data/apple) and
[itunes](https://github.com/v2fly/domain-list-community/blob/master/data/itunes)
lists (checked 2026-09-28). These are exact host matches. `@cn` means mainland
China access is available, not that the host is exclusive to Chinese accounts;
other storefronts sharing these hosts also use the direct route. CDN aliases
only match when the alias itself is the queried/routed hostname.

Put `sea-rulesets-direct` before Apple proxy rules in both DNS and routing.
For DNS, use a mainland resolver before any proxy AAAA/HTTPS suppression rules.
Any blanket IPv6 direct rule must exclude `geosite-apple` and `geoip-apple` so
the remaining Apple traffic reaches its proxy rule. Keep ad blocking first.

After editing the source, run
`sing-box rule-set compile rulesets/direct.json -o rulesets/direct.srs`.
Configurations using the remote `direct.srs` need the updated binary published
at their configured URL and refreshed before the new domains take effect.
