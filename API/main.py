from fastapi import FastAPI
import numpy as np
import tensorflow as tf
from keras.preprocessing import image
import requests
from PIL import Image
from fastapi.middleware.cors import CORSMiddleware
# from pyngrok import ngrok
import uvicorn
# import nest_asyncio


gen_label_map = {0: 'battery', 1: 'biological', 2: 'brown-glass', 3: 'cardboard',
                  4: 'clothes', 5: 'green-glass', 6: 'metal', 7: 'paper', 8: 'plastic',
                    9: 'shoes', 10: 'trash', 11: 'white-glass'}

app = FastAPI()
model = tf.keras.models.load_model('kaggle/working/ceptionpath')
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"Hello World"}

@app.get("/url/{url:path}",)
async def read_item(url: str):
    img_width, img_height = 320,320
    img = Image.open(requests.get(url, stream=True).raw).resize((img_width, img_height))
    # img = image.img_to_array(img)
    img = tf.keras.utils.img_to_array(img)
    
    img = np.expand_dims(img, axis = 0)
    # ans = img.shape
    
    pred = model.predict(img)
    # pred = pred.argmax(1)
    # pred = [gen_label_map[item] for item in pred]
    dic = {}
    for i in range(12):
        dic[i] = pred[0][i]  
    p = sorted(dic.items(), key=lambda x:x[1], reverse = True)
    
    predss = []
    for i in p:
        if(i[1] >= 10e-02):
            predss.append(i[0])
    preda = [gen_label_map[item] for item in predss]

    # return Response(content=preda, media_type="application/list")
    return {str(preda)}

# ngrok_tunnel = ngrok.connect(8000)
# print('Public URL:', ngrok_tunnel.public_url)
# nest_asyncio.apply()
# uvicorn.run(app, host='0.0.0.0',port=3000) #make it 8000

if __name__ == "__main__":
    uvicorn.run("__main__:app", host="0.0.0.0", port=3000)

# https://i.ibb.co/KKDw9fy/shoes1017.jpg
# https://i.ibb.co/R39SK3Z/test.jpg
# uvicorn fast:app --reload