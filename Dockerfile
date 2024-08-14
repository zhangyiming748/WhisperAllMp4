FROM python:3.12.5-bookworm
LABEL authors="zen"

RUN sed -i 's/deb.debian.org/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources

RUN apt update
RUN apt install -y ffmpeg
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install openai-whisper --break-system-packages --no-cache-dir
RUN mkdir /App
WORKDIR /App
COPY whisper.sh .
RUN chmod +x /App/whisper.sh
ENTRYPOINT ["/App/whisper.sh"]
# docker build -t whisper:3 .
# docker run -e model=base -e language=Chinese -v /e/Movies/杰克威胁taiga:/data whisper:1