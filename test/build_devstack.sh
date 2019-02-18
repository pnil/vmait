
network=${1:-default}

set -e

mkdir -p images

[ -f images/devstack-base.img ] || \
    ./vmait image create images/devstack-base.img config/devstack-base.setup

./vmait image copy images/devstack-base.img images/devstack-1.img
./vmait vm create devstack-1 config/devstack.vm disk=images/devstack-1.img network=$network
