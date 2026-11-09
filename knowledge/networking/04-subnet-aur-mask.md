# Subnet aur subnet mask

Subnetting bade network ko chhote tukdon (subnets) mein baantna hai, taaki
management aur security aasan ho.

## Subnet mask
IP address ko do hisson mein baantta hai: network part aur host part.
- 255.255.255.0 (ya /24) matlab pehle 3 number network, aakhri host.
- Jaise 192.168.1.0/24 mein 192.168.1.1 se 192.168.1.254 tak hosts.

## CIDR notation
- /24 = 256 address (254 usable).
- /25 = 128, /26 = 64, aur aise hi. Jitna bada number, utna chhota subnet.

## Gateway
Subnet se bahar jaane ka darwaza. Aam taur par router ka IP, jaise 192.168.1.1.
Jab device ko kisi doosre network se baat karni ho, to woh packet gateway ko
bhejta hai.
