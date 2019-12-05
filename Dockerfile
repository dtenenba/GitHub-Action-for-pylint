FROM python:3.8

LABEL "com.github.actions.name"="GitHub Action for pylint"
LABEL "com.github.actions.description"="Run pylint commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apt-get update -y && apt-get install -y unixodbc-dev

RUN pip install --upgrade pip
RUN pip install pylint
RUN python --version ; pip --version ; pylint --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
