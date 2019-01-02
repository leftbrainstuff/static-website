FROM golang:1.11.2-alpine3.8

# Set the working directory
WORKDIR /go/src/github.com/hugomd/go-example

# Copy our main file
COPY main.go .

# Build the Golang app
RUN CGO_ENABLED=0 GOOS=linux go build -o app .

# Create the second stage of our build
FROM scratch

WORKDIR /app

# Copy from the first stage (--from=0)
COPY --from=0 /go/src/github.com/hugomd/go-example/app .
CMD ["./app"]
