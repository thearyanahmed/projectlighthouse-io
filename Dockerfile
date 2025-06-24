# -------- Stage 1: Builder --------
FROM rust:1.86 AS builder

WORKDIR /app

# Cache dependencies
COPY Cargo.toml Cargo.lock ./
RUN mkdir src \
    && echo "fn main() {}" > src/main.rs \
    && echo "" > src/lib.rs
RUN cargo build --release
RUN rm -rf src

# Copy full source and build actual binary
COPY . .
# Remove this line: COPY config/ /app/config/
RUN ls -la
RUN cargo build --release --bin lighthouseio

# Rename binary to lighttheway
RUN cp target/release/lighthouseio target/release/lighttheway

# -------- Stage 2: Runtime --------
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy renamed binary
COPY --from=builder /app/target/release/lighttheway /app/lighttheway

COPY entrypoint.sh /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
