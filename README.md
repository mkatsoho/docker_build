# readme


## 如何使用本项目

- １．　本部署项目和被部署项目，　两个项目的目录并列，被部署项目的目录名字不要更改
- ２．　在本部署项目中执行 _cp.sh，　即复制了部署代码到被部署项目的目录中
- ３．　后续的步骤
- ３．１　在被部署项目中，执行 `docker_build.sh`, 它会在被部署目录的　｀../__build/<被部署项目目录名>/` 下生成需要部署的文件
- ３．２　把需要部署的文件（含一个.sh文件）复制到服务器
- ３．３　执行 `docker_load_and_deploy.sh <被部署的文件>` ，完成部署
- ４．　`docker ps`　检查服务是否在执行, 服务的名字（最后一列），映射的端口等
- ５．　可选，起停服务：`docker stop <服务的名字>` 或 `docker start <服务的名字>`


## prereq

python 3.9

thrift==0.15.0
numpy==1.21.2
pandas==1.3.3


## How to start thrift client and server

- New

```
python3 main.py				# run server
python3 client.py 127.0.0.1 9090	# run client
```

- Old

先执行thriftsever文件，然后在终端执行client文件，用python client.py 127.0.0.1 9090

```bash
python3 thriftServer.py
python3 client.py localhost 9090

```

