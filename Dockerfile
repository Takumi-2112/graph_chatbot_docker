FROM python:3.10-slim  

# Set the working directory in the container  
WORKDIR /app  

# Copy the dependencies file to the working directory  
COPY ./app/requirements.txt .  

# Install any dependencies  
# dont need to do ./app/requirements.txt because we set the working directory to /app
RUN pip install -r requirements.txt  

# Copy the content of the local src directory to the working directory so that if the code changes, we dont need to rebuild the image 
COPY ./app .

# expose the port the app runs on
EXPOSE 8000

# Define the command to run the application when the container starts
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# docker build -t "docker username"/"name of your project":latest . to build the image
# docker run -p 8000:8000 --env-file ./app/.env "docker username"/"name of your project":latest to run the container