# Example Pipenv Project (Dockerized)

### Why Pipenv? Why not Requirements.txt?
*Placeholder*

### Requirements
Before you begin, you will need to generate a `Pipfile` and a `Pipfile.lock`.

1. Create a temporary container (or environment).
   ```bash
   docker run -it --rm -v $(pwd)/:/app --workdir /app --entrypoint /bin/bash python:3.11.0-slim-buster
   ```

2. Install the required dependencies. This will generate the files.
   ```
   pipenv install flask
   ```

3. Exit the temporary container.
   
4. Ensure the files are included in your `Dockerfile`


### Usage
By utilizing this repository, you can structure your application using `pipenv`. To see this in action, run the following command;

`docker build -t pipfile:test . && docker run -p 8080:8080 --rm pipfile:test`

This will result in a `Hello World` webpage when you navigate to `http://localhost:8080`

> **Note**: If you need to change the port exposed, update the docker run command to your needs. Left is External!!