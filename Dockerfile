FROM golang:1.23 AS build
WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 go build -o /coffee ./cmd/coffee

FROM gcr.io/distroless/static
COPY --from=build /coffee /coffee
ENTRYPOINT ["/coffee"]
