# 💽 USB Storage & Entware Setup for DD-WRT (Nighthawk R6700v3)

This guide will walk you through setting up USB storage and installing Entware on your DD-WRT-flashed Nighthawk router. This is the base for things like local storage, logging, package installs, and adblocking.

---

## 🧰 Requirements

- 🧠 DD-WRT flashed and working
- 🔌 USB flash drive (preferably 4GB+)
- ⚙️ USB formatted as `ext4` (recommended)

---

## 🔧 Step 1: Format USB (from Linux)

On your Linux PC, run the following:

```bash
lsblk       # Find your USB drive (e.g. /dev/sdX)
sudo umount /dev/sdX1
sudo mkfs.ext4 /dev/sdX1
***Replace X with your actual USB device ID (like sdb).

🔌 Step 2: Mount USB Drive in DD-WRT

    Go to your router UI: http://192.168.1.1

    Navigate to: Services > USB

    Enable these options:

[✔] Core USB Support  
[✔] USB Storage Support  
[✔] Automatic Drive Mount  

    Optional: Set mount point to /mnt/usb

    Click Save and then Apply Settings

    Reboot the router

To verify it's mounted:

ls /mnt
# You should see 'usb' or your device label listed

📦 Step 3: Install Entware

    SSH into your router:

ssh root@192.168.1.1

    Install Entware to the mounted USB:

mkdir -p /mnt/usb/entware
wget -O - http://bin.entware.net/armv7sf-k3.2/installer/generic.sh | sh

This will download Entware and install it under /opt.
🧬 Step 4: Update System PATH

So Entware binaries are recognized, add /opt/bin:/opt/sbin to your system's environment:

echo 'export PATH=$PATH:/opt/bin:/opt/sbin' >> /etc/profile

Reboot your router to apply changes.
✅ Verification

To test if Entware is working, run:

opkg update

You should see packages being fetched. Now you can install apps like htop, nano, or use this setup for DNS-based adblocking.
🧠 Pro Tips

    Always back up your router config before changes.

    If USB fails to mount on reboot, check the Services > USB tab again and try a different port.

    You can add more packages by using:

    opkg install <package-name>

You’ve now got a DD-WRT router with a working package manager and mounted USB storage—ready for adblocking, logging, and more.


---

Want me to do the same for the `docs/adblock-setup.md` and `scripts/adblock-setup.sh` with full working code, updated for your Chr0nicHacker handle?


