#运行
#chmod +x download_and_unzip.sh
#./download_and_unzip.sh

#!/bin/bash

# 下载并解压文件的函数
download_and_unzip() {
  for i in $(seq 1 148); do
    # 格式化文件编号
    filename=$(printf "IHME-GBD_2021_DATA-3c4ae114-%d.zip" "$i")
    url="https://dl.healthdata.org:443/gbd-api-2021-public/3c4ae114eb5545ba5d3323ced0533458_files/$filename"
    
    echo "Downloading $filename ..."
    wget --no-check-certificate "$url"
    
    echo "Unzipping $filename ..."
    unzip -o "$filename"
  done
}

# 删除所有 .zip 文件的函数
delete_zip_files() {
  echo "Deleting .zip files ..."
  rm -f *.zip
}

# 调用函数
download_and_unzip
delete_zip_files
