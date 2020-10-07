FROM python:3.8-slim-buster AS build
RUN apt-get update && apt-get install -y build-essential libffi-dev
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.8-slim-buster
COPY --from=build /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
CMD ["datasette", "-h", "0.0.0.0", "-p", $PORT]
