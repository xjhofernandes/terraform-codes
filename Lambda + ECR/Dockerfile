FROM python:3.8-slim

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]
CMD ["main.handler"]