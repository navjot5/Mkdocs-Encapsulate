# Use a Python 3.7 image
FROM python:3.7

# Install mkdocs for serving the website
RUN pip install mkdocs

# Set the workdir to /app
WORKDIR /app

# default run command
CMD ["bash"]