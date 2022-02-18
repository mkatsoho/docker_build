# readme


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

