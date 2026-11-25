#!/usr/bin/env sh
set -e
DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT
MIRROR=https://services.gradle.org/distributions

# https://services.gradle.org/distributions/gradle-6.6-bin.zip.sha256
# https://services.gradle.org/distributions/gradle-7.1.1-bin.zip.sha256

dl_ver()
{
    local ver=$1
    local archive_type=${4:-zip}

    local url=$MIRROR/gradle-${ver}-bin.zip.sha256

    local sum
    sum=$(curl -fsSL --proto '=https' --tlsv1.2 "$url" | awk '{print $1}')
    if ! printf '%s' "$sum" | grep -Eq '^[0-9a-f]{64}$'
    then
        echo "bad or missing checksum for $url: '$sum'" >&2
        exit 1
    fi
    printf "  # %s\n" "$url"
    printf "  '%s': sha256:%s\n" "$ver" "$sum"
}

dl_ver ${1:-9.9.2}
