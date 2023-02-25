# Set base image
FROM python:3.8-slim-buster

# Set working directory
RUN mkdir -p ~/docker-app/ 
WORKDIR ~/docker-app/

# Set up the environment
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy necessary files
COPY ./Microservices/ .
RUN ls -haltr

# Train the model and run the flask app
RUN python3 code_model_training/train.py

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
