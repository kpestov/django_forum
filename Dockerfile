FROM python:3.6

RUN mkdir -p /opt/services/djangoapp/src
WORKDIR /opt/services/djangoapp/src

COPY Pipfile Pipfile.lock /opt/services/djangoapp/src/
RUN pip install --upgrade pip
RUN pip install psycopg2
RUN pip install pipenv && pipenv install --system

COPY . /opt/services/djangoapp/src
RUN cd forumengine && python manage.py collectstatic --no-input

EXPOSE 8000

CMD ["gunicorn", "--chdir", "forumengine", "--bind", ":8000", "forumengine.wsgi:application"]