FROM alpine

WORKDIR /app
COPY /database .

# install golang 
RUN apk add --no-cache go git 

# install go packages from go.mod
# go get or go mod
RUN go mod download

EXPOSE 8080
CMD ["go", "run", "main.go"]
