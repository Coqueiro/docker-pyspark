# docker-pyspark

This image can be used to run pyspark apps in a simple environment. It simply contains Python==3.7 and PySpark==2.4.4. This image doesn't provide cluster scalability.

## Running on interative mode
This allows you to enter inside the container and run any quantity of commands. This is specially handy during debugging.

Example:
```
docker run -it --name docker-pyspark -v path/to/your/app:/app:ro coqueirotree/docker-pyspark:latest bash
```

## Running your app
To do so, you need to volume your app to `/app` and run this container with whatever command you desire.


Example:
```
docker run --name docker-pyspark -v path/to/your/app:/app:ro coqueirotree/docker-pyspark:latest python3 entrypoint.py
```