#!/bin/bash

USER="root"
PASS="root"
DATABASE="llocker"

echo "========================================================================"
echo ""
echo "    Starting MongoDB post execution script"

RET=1
while [[ RET -ne 0 ]]; do
    echo "    Waiting for confirmation of service startup..."
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo " -- Creating an ${USER} for database ${DATABASE}"

mongo admin << EOF
db.createUser({user: "${USER}", pwd: "${PASS}", roles: [{role:'root', db:'admin'}]});
EOF

mongo admin -u ${USER} -p ${PASS} << EOF
use llocker
db.createUser({user: "${USER}", pwd: "${PASS}", roles: [{role:'readWrite', db:"${DATABASE}"}]});
EOF

touch /data/db/.mongodb_password_set

echo "    Configured Database: $DATABASE  User: $USER  Pass: $PASS "
echo ""
echo " Done!"
echo "========================================================================"
