# /bin/bash
sudo docker run -it --rm --gpus all \
     -v `pwd`:/home/jovyan/work \
     -v /data:/data \
     -p 10000:8888 \
     --name jupyter-cuda jupyter-cuda sh -c 'jupyter-lab --allow-root --ip=*'
