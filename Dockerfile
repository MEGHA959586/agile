# Build stage – use Alpine‑based GCC to produce a musl‑compatible binary
FROM gcc:alpine AS build

WORKDIR /usr/src/app

COPY hello.c .

RUN gcc -o my_app hello.c

# Runtime stage – Alpine is now fully compatible
FROM alpine:latest

COPY --from=build /usr/src/app/my_app /usr/local/bin/my_app

CMD ["my_app"]