# Murphy — KDN ka apna AI

Murphy ek local AI chat app hai. Murphy ka dimaag tumhare apne computer par
[Ollama](https://ollama.com) ke zariye chalta hai — koi cloud, koi API bill nahi.
Ye web app ek Claude-jaisi chat screen deti hai jisse tum Murphy se baat kar sakte ho.

## Ek baar ka setup (laptop par)

1. **Ollama install karo** — https://ollama.com/download se Mac app download karke kholo.
2. Is folder mein **`setup_murphy.command`** par double-click karo.
   Ye base model (qwen2.5) download karke `murphy` model bana dega.

## Roz chalana

Is folder mein **`run_web.command`** par double-click karo.
Browser mein `http://localhost:8000` khul jayega aur Murphy se baat shuru.

- Enter = bhejo, Shift+Enter = nayi line
- Upar ⚙ se model ka naam ya host badal sakte ho
- Status dot hara = Murphy chalu, laal = Ollama app band hai

## Files

| File | Kaam |
|------|------|
| `index.html` | Murphy ki chat web app |
| `run_web.command` | App ko browser mein kholta hai |
| `setup_murphy.command` | Ek baar: model download + Murphy banata hai |
| `chat_murphy.command` | Terminal mein Murphy se baat (web app ke bina) |
| `Murphy.modelfile` | Murphy ki pehchaan aur niyam |

## Aage

- Bada/behtar model: `Murphy.modelfile` mein `FROM qwen2.5:7b` ko `qwen2.5:14b` karo, phir `setup_murphy.command` dobara.
- Kisi vishay (jaise networking) mein gehra banana ho to uski library (notes) jodenge.
