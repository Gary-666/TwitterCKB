# 使用Python官方镜像
FROM python:3.11
LABEL authors="GaryMa"

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器
COPY . /app

# 设置 pip 使用清华源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 暴露应用端口
EXPOSE 8000

# 启动FastAPI应用
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
