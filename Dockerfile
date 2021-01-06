FROM python:3.7

ENV PYTHONBUFFERED 1

RUN mkdir /code

WORKDIR /code

COPY . .

RUN pip install -r requirements.txt
CMD ["ls"]

CMD ["gunicorn", "-c", "config/gunicorn/conf.py" , "--bind", ":8000", "--chdir", "django_docker", "django_docker.wsgi:application"]
