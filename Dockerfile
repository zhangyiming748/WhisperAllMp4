FROM python:3.12.5-bookworm
LABEL authors="zen"

# RUN sed -i 's/Suites: bookworm bookworm-updates/Suites: bookworm bookworm-updates bookworm-backports/' /etc/apt/sources.list.d/debian.sources
# RUN sed -i 's/Components: main/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources

RUN apt update
RUN apt install -y ffmpeg
# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install openai-whisper --break-system-packages --no-cache-dir
RUN mkdir /App
WORKDIR /App
COPY whisper.sh .
ENTRYPOINT ["bash", "/App/whisper.sh"]