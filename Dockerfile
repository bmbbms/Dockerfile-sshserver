#使用的基础镜像
FROM ubuntu:14.04
#作者信息
MAINTAINER bmbbms 891765948@qq.com
#安装ssh服务
RUN apt-get updte && aapt-get install -y python
RUN mkdir -p /var/run/sshd

RUN mkdir -p /root/.ssh
#取消pam登陆限制
RUN sed -ri 's/session	required	pam_loginuid.so/#session	required	pam_loginuid.so/g'
#添加认证文件和run脚本
ADD authorized_keys /root/.ssh/authorized_keys
ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
#导出端口
expose 32
#设置启动命令
CMD ["/root/run.sh"]

