#!/bin/bash -i
./../setup.sh && source ~/.bashrc

cd ~/ComfyUI
pip install -r requirements.txt
pm2 start --name comfy "python main.py --port 8188 --listen 0.0.0.0 --front-end-version Comfy-Org/ComfyUI_frontend@latest" 
cd ~/comfy-middleware
pm2 start --name comfy-middleware "python main.py --port 3000"

cd ~/emprops_component_library/server_scripts/basic

./nodes.sh && source ~/.bashrc

./models.sh && source ~/.bashrc

pm2 restart all;