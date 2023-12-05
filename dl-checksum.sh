#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://services.gradle.org/distributions

# https://services.gradle.org/distributions/gradle-6.6-bin.zip.sha256
# https://services.gradle.org/distributions/gradle-7.1.1-bin.zip.sha256

dl_ver()
{
    local ver=$1
    local archive_type=${4:-zip}

    local url=$MIRROR/gradle-${ver}-bin.zip.sha256

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(curl -sSLf $url)
}

dl_ver ${1:-8.5}
