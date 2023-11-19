FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt requirements.txt

# 设置清华镜像源并安装依赖项
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

COPY . .

CMD ["python", "app.py"]
