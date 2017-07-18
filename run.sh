#!/bin/bash
set -e

# Check the server was configured.
if [ ! -f /etc/perforce/p4dctl.conf.d/$SERVER_NAME.conf ]; then

    # Configure a server if not yet.
    /opt/perforce/sbin/configure-perforce-server.sh -n \
        -p $P4PORT \
        -u $P4USER \
        -P $P4PASSWD \
        $SERVER_NAME
else
    # Start the server if yet.
    p4dctl start $SERVER_NAME
fi

# Check the server is run.
for i in `seq 20`; do
    # Goto the next step if done.
    test -e /var/run/p4d.$SERVER_NAME.pid && break
    sleep 2
done

# Monitor the log file
exec ls -1v --color=never /opt/perforce/servers/$SERVER_NAME/log | xargs tail -f
