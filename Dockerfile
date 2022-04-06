#Define GOLANG as default base image
FROM golang:latest

#Set Workdir
RUN mkdir /app
WORKDIR /app

# Fetch and build app
RUN cd /app/
RUN go clean -modcache
RUN go install github.com/ebkopec/t@latest
RUN git clone https://github.com/EBKopec/t.git
RUN pwd
RUN cd t/ && go build

# Expose app port
EXPOSE 8888

# Run service entrypoint
ENTRYPOINT ["/app/t"]
#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]




