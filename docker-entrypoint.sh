#!/bin/sh
# export DISPLAY=:0.0
if [ "$ACCEPT_SERVER_LICENSE_TERMS" = "true" ]; then
    echo "TOS ACCEPTED"
else
    echo "TOS NOT ACCEPTED: Please set the environment variable ACCEPT_SERVER_LICENSE_TERMS to true to accept the TOS."
    echo "You can find the TOS here: https://code.visualstudio.com/license/server"
    # stop the script if the TOS is not accepted
    exit 1
fi

if [ "$CODE_SERVER_TOKEN" != "null" ]; then
    echo "token set to $CODE_SERVER_TOKEN"
    export CODE_SERVER_TOKEN="--connection-token $CODE_SERVER_TOKEN"
else
    echo "token not set"
    export CODE_SERVER_TOKEN="--without-connection-token"
fi

if [ "$CODE_SERVER_LOCAL" = "true" ]; then
    echo "server is going to be hosted locally"
    dbus-run-session -- sh -c "(echo $CREDSTOREPASS | gnome-keyring-daemon --unlock) && code-server serve-local --accept-server-license-terms --telemetry-level $TELEMETRY_LEVEL --host $CODE_SERVER_HOST --server-data-dir "/vscode-server-data" -p $CODE_SERVER_PORT $CODE_SERVER_TOKEN"

    else
    echo "server is going to be hosted externally"
    dbus-run-session -- sh -c "(echo $CREDSTOREPASS | gnome-keyring-daemon --unlock) && code-server serve --random-name --accept-server-license-terms --telemetry-level $TELEMETRY_LEVEL --server-data-dir "/vscode-server-data""

fi
# Run a dbus session, which unlocks the gnome-keyring and runs the VS Code Server inside of it