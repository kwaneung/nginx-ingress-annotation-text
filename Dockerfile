FROM python:3.7
LABEL maintainer=alice_k106@naver.com
WORKDIR /root
ADD ["requirements.txt", "/root/"]
RUN sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
RUN apt update && \
  apt install python3 python3-pip -y && \
  pip3 install -r requirements.txt && \
  apt clean autoclean && \
  apt autoremove --yes && \
  rm -rf /var/lib/{apt,dpkg,cache,log}
RUN touch /file
ADD ["app.py", "/root/"]
CMD ["python3", "/root/app.py"]
