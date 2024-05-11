FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install SO packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends\
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose port 8000 to allow communication to/from server
EXPOSE 8000

WORKDIR /app/polls

RUN useradd --uid 10000 runner && chown -R runner:runner /app 
USER 10000
HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1

CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py collectstatic --noinput && python manage.py loaddata fixtures/initial_data.json && uwsgi --ini uwsgi.ini"]
