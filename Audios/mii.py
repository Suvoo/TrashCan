from googletrans import Translator
from gtts import gTTS
import os

def trans(sen,la):
    translat = Translator()
    a = translat.translate(sen, dest=la)
    # print(a.text)
    return a.text

mat = ['paper','cardboard','plastic','metal','trash','battery','shoes','clothes',
'green-glass','brown-glass','white-glass','biological']

ans = []

for i in mat:
    t = 'This is ' + i
    ans.append(t)

lan1,lan2 = [],[]

for i in ans:
    lan1.append(trans(i,'ta'))
    lan2.append(trans(i,'hi'))

# print(ans,lan1,lan2)
fns = []
for i in range(len(ans)):
    fn = ans[i] + '   ' + lan1[i] + '   ' + lan2[i]
    fns.append(fn)
print(fns)

for i in range(len(fns)):
    mytext = fns[i]
    language = 'ta'
    myobj = gTTS(text=mytext, lang=language, slow=False)
    myobj.save("welcome{}.mp3".format(i))

