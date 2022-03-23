#!/bin/bash
port=45080
# 根据端口号去查询对应的PID
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{print $1}')

# 杀掉对应的进程 如果PID不存在,即该端口没有开启,则不执行
if [ -n "$pid" ]; then
    kill -9 $pid
fi

if [ ! -d "./trojan" ]; then
    tar -xvJf trojan-1.15.1-linux-amd64.tar.xz
fi

nohup ./trojan/trojan ./conf/config.json >> run.log  2>&1 &
