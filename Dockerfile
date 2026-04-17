# ---- Build Stage ----
# Use Alpine-based GCC (produces musl-compatible binary)
FROM gcc:alpine AS build

WORKDIR /usr/src/app

COPY hello.c .

RUN gcc -o my_app hello.c

# ---- Run Stage ----
# Alpine is already small and compatible with the binary
FROM alpine:latest

COPY --from=build /usr/src/app/my_app /usr/local/bin/my_app

CMD ["my_app"]