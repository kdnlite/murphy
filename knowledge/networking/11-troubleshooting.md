# Network troubleshooting (dikkat theek karna)

Jab internet na chale, kadam-kadam jaanch karo.

## Aam tools
- ping: kisi IP/naam tak pahunch hai ya nahi, aur kitni der (latency). Jaise
  `ping google.com`.
- traceroute (Mac/Linux) / tracert (Windows): packet kin-kin hops se jata hai.
- nslookup / dig: DNS theek kaam kar raha hai ya nahi.
- ip / ifconfig / ipconfig: apna IP, gateway dekhna.

## Kadam
1. Physical: cable juda hai? WiFi on hai?
2. Apna IP sahi mila (DHCP)? 169.254.x.x matlab DHCP fail.
3. Gateway ko ping karo (router). Na ho to local dikkat.
4. 8.8.8.8 ko ping karo. Chale par naam na chale -> DNS ki dikkat.
5. Website na khule par baaki sab theek -> us site ya DNS ki samasya.

## Aam hal
- Router restart (30 second band).
- Device ka WiFi off/on.
- DNS badal kar dekho (jaise 1.1.1.1 ya 8.8.8.8).
- Cable/port badal kar dekho.
