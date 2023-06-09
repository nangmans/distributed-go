FROM golang:1.19-alpine AS build
WORKDIR /go/src/proglog
COPY . . 
RUN CGO_ENABLED=0 go build -o /go/bin/proglog ./cmd/proglog

FROM alpine
COPY --from=build /go/bin/proglog /bin/proglog
ENTRYPOINT [ "/bin/proglog" ]