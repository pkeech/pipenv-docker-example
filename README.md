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
By utilizing this repository, you can structure your application using `pipenv`. This `Dockerfile` uses **Multi-Stage Builds** allowing for a Development and Production image from the same `Dockerfile`. This example is very simple, but leveraging these concepts, you could create a test image that would consist of a Production Image + Testing tools. 

#### Development
To see this in action (Development Style), run the following command;

`docker build --target development -t pipfile:dev . && docker run -p 8080:8080 --rm pipfile:dev`

This will result in a `Hello World` webpage when you navigate to `http://localhost:8080`

#### Production
To see this in action (Production Style), run the following command;

`docker build --target production -t pipfile:prod . && docker run -p 8080:8080 --rm pipfile:prod`

This will result in a `Hello World` webpage when you navigate to `http://localhost:8080`