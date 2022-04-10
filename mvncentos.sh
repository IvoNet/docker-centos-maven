#!/usr/bin/env bash
docker run -it \
        --rm  \
        -v $(pwd):/project \
        -v $(echo "$HOME/.m2/repository"):/repository \
        --entrypoint /entrypoint.sh \
        ivonet/centos-maven mvn "$@"