# Build the Docker image for the user account service.
docker build . -t gcr.io/apigee-dev-training-b4c22/stubbed-service

# Push the Docker image for user account service to Google Container Registry.
docker push gcr.io/apigee-dev-training-b4c22/stubbed-service
