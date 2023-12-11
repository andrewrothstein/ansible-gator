#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/open-policy-agent/gatekeeper/releases/download
APP=gator

# https://github.com/open-policy-agent/gatekeeper/releases/download/v3.11.0-beta.0/gator-v3.11.0-beta.0-linux-amd64.tar.gz

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file="${APP}-v${ver}-${platform}.${archive_type}"
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    # https://github.com/open-policy-agent/gatekeeper/releases/download/v3.11.0-beta.0/sha256sums.txt
    local url="${MIRROR}/v$ver/sha256sums.txt"
    local lchecksums="${DIR}/${APP}-v${ver}-sha256sums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums darwin arm64
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm64
}

dl_ver ${1:-3.14.0}
