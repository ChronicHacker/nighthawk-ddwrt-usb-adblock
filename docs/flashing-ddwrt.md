# 🚀 Flashing DD-WRT on Netgear Nighthawk R6700v3

## 1. Download Firmware
- Visit: https://dd-wrt.com/support/router-database/
- Download:
  - `factory-to-ddwrt.chk`
  - `webflash.bin`
 
  or https://wiki.dd-wrt.com/wiki/index.php/Netgear_R6400v2 (also applies for R6700v3).

## 2. Flash Instructions
1. Connect your PC to the router via Ethernet.
2. Factory reset the router.
3. Go to `http://192.168.1.1` in your browser.
4. Login and go to **Administration > Firmware Upgrade**.
5. Upload `factory-to-ddwrt.chk`
6. Wait ~5 minutes.
7. Reboot and access DD-WRT UI.
8. Go to **Administration > Firmware Upgrade** again.
9. Upload `webflash.bin`
10. Reboot. Done!
