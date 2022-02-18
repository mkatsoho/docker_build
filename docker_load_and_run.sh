#! /usr/bin/env bash


TgzFiles=$*

echo
echo "执行方式Usage:"
echo "    $0 docker_image_server.tgz docker_image_client.tgz"
echo
echo
echo ">>> TODO: $TgzFiles >>>"
echo
echo
echo "在3秒中内，可以使用 control-c 终止执行"
sleep 5


declare -i port
port=9190

for f in $TgzFiles; do
  echo
  echo ">>> Handling $f, using port $port >>>"


  FileName=`basename $f .tgz`
  DockerImage=`echo $FileName | awk -F '-' '{print $1}'`  
  Main=`echo $FileName | awk -F '-' '{print $2}'`  
  DockerTag=`echo $FileName | awk -F '-' '{print $3}'`  
  NickName=${DockerImage}_${Main}

  # docker log dir
  mkdir /tmp/${NickName}


  # load docker
  docker load < $f
  docker tag ${DockerImage}_${Main}:${DockerTag} ${DockerImage}_${Main}:latest 


  # start docker
  docker rm -f ${NickName}
  [ "$Main" == "client" ] && docker run -d --name ${NickName} -v /tmp/${NickName}:/app/logs ${DockerImage}_${Main}:${DockerTag}	   			# start client
  [ "$Main" == "server" ] && docker run -d --name ${NickName} -v /tmp/${NickName}:/app/logs -p $port:9090/tcp ${DockerImage}_${Main}:${DockerTag}  	# start server
done


