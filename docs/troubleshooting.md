📄 docs/troubleshooting.md

# 🛠️ Troubleshooting Guide

This guide helps you resolve common issues with USB setup, Entware, and DNS-based adblocking on your DD-WRT router.

---

## 🔌 USB Drive Not Mounting?

### ✅ Checklist:
- Make sure the USB is formatted as `ext4`
- Plug it into a known working USB port
- Reboot the router after enabling USB settings

### 🔍 Verify:
Check if the mount point exists:

```bash
ls /mnt

You should see something like usb or the drive label.
📦 Entware Not Working?
✅ Try re-installing:

wget -O - http://bin.entware.net/armv7sf-k3.2/installer/generic.sh | sh

📁 Confirm /opt is working:

ls /opt/bin

If nothing shows up, make sure /opt is linked to /mnt/usb/entware or mounted correctly.
🚫 Adblock Not Working?
✅ Manually run the script:

sh /opt/adblock/adblock-setup.sh

🔍 Confirm Dnsmasq is using the blocklist:

cat /tmp/dnsmasq.conf | grep addn-hosts

You should see:

addn-hosts=/opt/adblock/hosts_adblock.txt

🔄 Restart Dnsmasq:

stopservice dnsmasq
startservice dnsmasq

🧨 Router Freezing / Not Booting?
🛠️ Try a 30/30/30 reset:

    Hold reset for 30 seconds while powered on

    Keep holding, unplug power and wait 30 seconds

    Keep holding, plug power back in and wait 30 seconds

🛟 Still bricked?

Follow TFTP recovery instructions
🧠 General Tips

    Always backup your config before experimenting.

    If something breaks, try:

dmesg | tail
logread

to get helpful debug output.
