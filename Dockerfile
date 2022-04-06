#Define GOLANG as default base image
FROM golang:latest

#Set Workdir
RUN mkdir /app
ADD . /app
WORKDIR /app

# Fetch and build app
RUN export GO111MOLUDE=on
RUN go clean -modcache
RUN go install github.com/ebkopec/t@latest
RUN cd /app/ && git clone https://github.com/EBKopec/t.git
RUN cd /app/t/ && go build
RUN ls -ltr /app/t/*
# Expose app port
EXPOSE 8888

# Run service entrypoint
ENTRYPOINT ["/app/t"]
#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]




