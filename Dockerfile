# step1 specify the base image
# FROM ubuntu 18
FROM ubuntu:latest
ENV \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
# FROM alpine
# FROM python
# CMD ["pwd"]
# RUN cd home
WORKDIR /home/corob/html
COPY . /home/corob/html
# # CMD ["cd", "home"]
# CMD ["ls"]

# Download and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN apt-get update
RUN apt-get install python3.10
RUN apt-get install python3-pip -y

# RUN python3-pip install --root-user-action=ignore requests -y
RUN apt-get install python3-venv -y
RUN python3 -m venv my-project-env
RUN python3 -m venv my-project-env

# RUN groupadd -r django && useradd -r -g django django
# USER django
# CMD ["source", "/my-project-env/bin/activate"]
# CMD ["pwd"]
ENV PATH="/my-project-env/bin:$PATH"
RUN pip install -r requirements.txt
# WORKDIR /home/corob/html/my-project-env/bin/
# CMD ["source", "my-project-env/bin/activate", "&&", "pip3", "install", "-r", "requirements.txt"]
# CMD ["source", "my-project-env/bin/activate", "&&", "pip3", "freeze"]
# CMD ["ls","-la"]

# CMD ["source", "my-project-env/bin/activate", "&&", "python3", "manage.py", "runserver", "0.0.0.0:8000"]

# # Install dependencies:
# # COPY requirements.txt .
# RUN source /my-project-env/bin/activate && pip3 install -r requirements.txt
#
# # Run the application:
# # COPY myapp.py .
# CMD source /my-project-env/bin/activate && python3 manage.py runserver 0.0.0.0:8000

# RUN python3 -m venv my-project-env
# RUN source /my-project-env/bin/activate
# RUN pip3 install -r requirements.txt
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]