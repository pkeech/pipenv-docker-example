# Example Pipenv Project (Dockerized)

## Why Pipenv? Why not Requirements.txt?
*Placeholder*

## Usage
By utilizing this repository, you can structure your application using `pipenv`.

Before you begin, you will need to generate a `Pipfile` and a `Pipfile.lock`.

1. Create a temporary container (or environment).
   `docker run -it --rm -v $(pwd)/:/app --workdir /app --entrypoint /bin/bash python:3.11.0-slim-buster`

2. Install the required dependencies. This will generate the files.
   `pipenv install flask`

3. Exit the temporary container.
   
4. Ensure the files are included in your `Dockerfile`