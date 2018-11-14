#!/bin/bash

set -euxo pipefail

OUTDIR=`pwd`/dist/release

# Typecheck
node_modules/.bin/tsc --noEmit

# Clean out the release directory
rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"

# Build the compiled assets
node_modules/.bin/parcel build assets/index.html --no-cache --out-dir "$OUTDIR" --public-url "./" --detailed-report