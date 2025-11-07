# Start from a small base image
FROM alpine:latest

# Create a working directory inside the image
WORKDIR /app

# Copy all files from your repo into the container
COPY . .

# Show the contents of /app when the container runs
CMD ["sh", "-c", "echo '📁 Files inside container:' && ls -R /app"]
