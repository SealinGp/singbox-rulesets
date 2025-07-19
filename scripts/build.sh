#!/bin/bash

# 查找当前目录及子目录下所有的 .json 文件
find . -type f -name "*.json" | while read -r json_file; do
    # 获取文件所在目录
    dir_path=$(dirname "$json_file")
    # 获取不带路径的文件名
    filename=$(basename "$json_file")
    # 去掉 .json 后缀
    base_name="${filename%.json}"
    # 生成对应的 .srs 文件名（保持相同目录）
    srs_file="${dir_path}/${base_name}.srs"

    echo "Compiling $json_file to $srs_file..."

    # 执行 sing-box 编译命令（在原始目录生成 .srs）
    sing-box rule-set compile --output "$srs_file" "$json_file"

    # 检查是否成功
    if [ $? -eq 0 ]; then
        echo "Successfully compiled $json_file to $srs_file"
    else
        echo "Failed to compile $json_file"
        exit 1
    fi
done

echo "All JSON files have been compiled to SRS format."
