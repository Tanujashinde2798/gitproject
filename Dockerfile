FROM python:3.9

WORKDIR /app/backend

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install only required package
RUN pip install mysqlclient

# Copy project files
COPY . .

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
