#!/usr/bin/env bash
# 用于查找指定路径下和子文件夹中所有扩展名为 MP4 的文件,并分离出当前视频的绝对路径(不包含文件名)如果当前路径下不存在扩展名为 srt 的文件,则执行whisper
# 设置要搜索的根目录
root_dir="/data"
model_dir="/data"
echo "root = ${root_dir}"
echo "model_dir = ${model_dir}"
# 遍历根目录及其子目录
find "$root_dir" -type f -name "*.${pattern}" | while read file; do
    # 获取文件的绝对路径
    file_path=$(dirname "$file")
    echo "file = ${file}" # file 就是文件的绝对路径
    echo "file_path  = ${file_path}" # 纯文件夹绝对路径
    echo "最终要执行的命令 = whisper "${file}" --model $model --language $language --model_dir $model_dir --output_format srt"
    whisper "${file}" --model $model --language $language --model_dir $model_dir --output_format srt
done
