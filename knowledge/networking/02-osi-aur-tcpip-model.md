# OSI aur TCP/IP model

Network ka kaam layers (parton) mein banta diya jata hai, taaki har layer apna
ek kaam kare. Do mashhoor model hain: OSI (7 layers) aur TCP/IP (4 layers).

## OSI ki 7 layers (upar se neeche)
1. Application: user ke app (HTTP, DNS, email).
2. Presentation: data ka format, encryption.
3. Session: baat-cheet ka session banaye rakhna.
4. Transport: TCP/UDP, data ko reliably pahunchana, ports.
5. Network: IP address, routing (raasta chunna).
6. Data Link: ek hi network par devices ke beech, MAC address.
7. Physical: taar, signal, radio waves.

## TCP/IP model (asli internet isi par chalta hai)
- Application (OSI ki 5,6,7)
- Transport (TCP, UDP)
- Internet (IP)
- Network Access / Link (Ethernet, WiFi)

## Yaad rakhne ka tarika
Har layer neeche wali layer ki seva leti hai. Data bhejte waqt upar se neeche
jata hai (har layer apna "header" lagati hai), aur paane waale ke yahan neeche se
upar khulta hai.
