# DNS (Domain Name System)

DNS internet ki phone-book hai. Insaan naam yaad rakhte hain (google.com), par
computer IP se baat karte hain. DNS naam ko IP mein badalta hai.

## Kaise chalta hai
1. Aap browser mein example.com likhte ho.
2. Computer DNS resolver (aam taur par ISP ya 8.8.8.8 jaisa) se poochta hai.
3. Resolver root -> TLD (.com) -> authoritative server se hota hua IP laata hai.
4. IP milte hi browser us server se judta hai.

## Record types
- A: naam -> IPv4.
- AAAA: naam -> IPv6.
- CNAME: ek naam ko doosre naam par bhejna (alias).
- MX: mail server.
- TXT: tareeke-tareeke ki jaankari (jaise domain verify).

## Caching
Jawaab kuch samay ke liye save hota hai (TTL), taaki baar-baar na poochna pade.
