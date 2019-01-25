FROM python:3.6

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# copy current dir's content to container's WORKDIR root i.e. all the contents of the web app
COPY . .