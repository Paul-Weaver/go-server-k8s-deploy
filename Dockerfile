# Using golang:1.21-alpine as the base image for the builder stage
FROM golang:1.21-alpine as builder

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the go.mod file into the /app directory
COPY go.mod .

# Copy the main.go source file into the /app directory
COPY main.go .

# Compile the application to a binary called 'main'.
# CGO_ENABLED=0 disables CGO for static building. GOOS=linux ensures compatibility.
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Start a new stage from alpine:3.19 for a smaller, final image
FROM alpine:3.19

# Set the working directory in the container to /root/
WORKDIR /root/

# Copy the compiled 'main' binary from the builder stage to the /root/ directory
COPY --from=builder /app/main .

# Expose port 8080 for the application
EXPOSE 8080

# Command to run the compiled binary
CMD ["./main"]
