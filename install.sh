#!/bin/sh
set -e

REPO="justinphilpott/seed"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
BINARY_NAME="seed"

# Detect OS
OS="$(uname -s)"
case "$OS" in
    Linux)  OS="linux" ;;
    Darwin) OS="darwin" ;;
    *)      echo "Error: unsupported OS: $OS" >&2; exit 1 ;;
esac

# Detect architecture
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64)  ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    arm64)   ARCH="arm64" ;;
    *)       echo "Error: unsupported architecture: $ARCH" >&2; exit 1 ;;
esac

ASSET="seed-${OS}-${ARCH}"
URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"

echo ""
echo "    🌱 seed · installer"
echo "    ─────────────────────────────"
echo "    OS: ${OS}  Arch: ${ARCH}"
echo "    Source: github.com/${REPO}"
echo "    Target: ${INSTALL_DIR}/${BINARY_NAME}"
echo ""

# Spinner helper — runs in background, caller kills via $SPINNER_PID
start_spinner() {
    printf "    %s " "$1"
    while true; do
        for c in '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏'; do
            printf '\b%s' "$c"
            sleep 0.1
        done
    done &
    SPINNER_PID=$!
}

stop_spinner() {
    kill "$SPINNER_PID" 2>/dev/null
    wait "$SPINNER_PID" 2>/dev/null
    printf '\b✓\n'
}

# Create install directory
start_spinner "Creating ${INSTALL_DIR}..."
mkdir -p "$INSTALL_DIR"
stop_spinner

# Download binary
TMPFILE="$(mktemp)"
trap 'rm -f "$TMPFILE"; kill "$SPINNER_PID" 2>/dev/null' EXIT

start_spinner "Downloading ${ASSET} from latest release..."
if command -v curl >/dev/null 2>&1; then
    curl -fsSL -o "$TMPFILE" "$URL"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$TMPFILE" "$URL"
else
    stop_spinner
    echo "Error: curl or wget is required" >&2
    exit 1
fi
stop_spinner

# Install
start_spinner "Installing to ${INSTALL_DIR}/${BINARY_NAME}..."
mv "$TMPFILE" "${INSTALL_DIR}/${BINARY_NAME}"
chmod +x "${INSTALL_DIR}/${BINARY_NAME}"
stop_spinner

# Verify
start_spinner "Verifying installation..."
if "${INSTALL_DIR}/${BINARY_NAME}" --version >/dev/null 2>&1; then
    VERSION="$("${INSTALL_DIR}/${BINARY_NAME}" --version 2>&1 || true)"
    stop_spinner
    if [ -n "$VERSION" ]; then
        echo ""
        echo "    ${VERSION}"
    fi
else
    stop_spinner
fi

echo ""

# PATH hint
case ":$PATH:" in
    *":${INSTALL_DIR}:"*)
        echo "    Ready to go! Run 'seed' to get started."
        ;;
    *)
        echo "    Add ${INSTALL_DIR} to your PATH to get started:"
        echo "      export PATH=\"${INSTALL_DIR}:\$PATH\""
        ;;
esac

echo ""
