# TCP, UDP aur Ports

Transport layer do tarike se data bhejti hai: TCP aur UDP.

## TCP (reliable)
- Pehle connection banta hai (3-way handshake: SYN, SYN-ACK, ACK).
- Har packet ka hisaab rakhta hai; kho jaye to dobara bhejta hai.
- Order sahi rakhta hai.
- Use: web (HTTP/HTTPS), email, file transfer — jahan har byte zaroori hai.

## UDP (fast)
- Koi handshake nahi, koi guarantee nahi.
- Tez, par packet kho sakte hain.
- Use: video call, live streaming, online games, DNS — jahan speed zyada zaroori
  hai aur thoda data khona chalega.

## Ports
Ek hi IP par kai services chalti hain; port batata hai kaunsi service.
- 80: HTTP, 443: HTTPS, 53: DNS, 22: SSH, 25: SMTP (mail).
IP+port milkar ek service ka pura pata banate hain.
