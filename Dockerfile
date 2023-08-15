FROM golang:1.20-bullseye as build

#RUN go install github.com/glebarez/pgssl@latest
RUN go install github.com/privacyint/pgssl@latest

FROM gcr.io/distroless/base-debian11

COPY --from=build /go/bin/pgssl /

ENTRYPOINT ["/pgssl"]