FROM golang:alpine
EXPOSE 8080 1935
RUN mkdir /app 
ADD . /app
WORKDIR /app
RUN apk add --no-cache ffmpeg ffmpeg-libs
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o owncast .
WORKDIR /app
CMD ["/app/owncast"]