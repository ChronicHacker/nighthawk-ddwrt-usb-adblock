docs/adblock-setup.md

# 🚫 Adblock Configuration (DD-WRT + Entware)

This guide explains how to set up network-wide adblocking on your DD-WRT router using a custom `hosts` file with Dnsmasq. This blocks ads, trackers, and known malware domains for all devices on your network.

---

## ✅ Prerequisites

- ✅ DD-WRT installed
- ✅ Entware installed and working
- ✅ USB storage mounted at `/mnt/usb`
- ✅ Router has internet access

---

## 📥 Step 1: Download the Adblock Script

SSH into your router and run:

```bash
mkdir -p /opt/adblock
wget -O /opt/adblock/adblock-setup.sh https://raw.githubusercontent.com/Chr0nicHacker/nighthawk-ddwrt-usb-adblock/main/scripts/adblock-setup.sh
chmod +x /opt/adblock/adblock-setup.sh

This script will:

    Download a blocklist

    Save it as hosts_adblock.txt

    Inject it into Dnsmasq’s configuration

🧪 Step 2: Run the Script Manually (First Time)

sh /opt/adblock/adblock-setup.sh

Then check that Dnsmasq loaded the blocklist:

cat /tmp/dnsmasq.conf | grep addn-hosts

You should see:

addn-hosts=/opt/adblock/hosts_adblock.txt

🔁 Step 3: Set the Script to Run on Every Boot

To enable automatic blocking on startup:

    Log in to DD-WRT Web UI

    Navigate to Administration > Commands

    Paste:

    sh /opt/adblock/adblock-setup.sh

    Click Save Startup

🌐 Blocklist Source

This script uses the trusted list from:

https://someonewhocares.org/hosts/zero/hosts

You can swap this out in the script for other blocklists.

🚀 Optional: Update Script Weekly

To auto-update the blocklist weekly, you can set up a cron job:

echo "0 3 * * 0 sh /opt/adblock/adblock-setup.sh" >> /tmp/crontab
crontab /tmp/crontab

🙌 Done!

Your router now blocks ads for every device on your network—no browser extensions needed.



