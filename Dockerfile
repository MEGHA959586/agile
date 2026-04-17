# ---- Build Stage ----
# Use a full GCC image to compile the code
FROM gcc:latest AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the source code into the container
COPY hello.c .

# Compile the program
RUN gcc -o my_app hello.c

# ---- Run Stage ----
# Use a minimal Linux image to just run the compiled program
FROM alpine:latest

# Copy the compiled binary from the build stage
COPY --from=build /usr/src/app/my_app /usr/local/bin/my_app

# Command to run when the container starts
CMD ["my_app"]