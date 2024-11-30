#!/bin/bash

echo "WALLET_ADDRESS=$WALLET_ADDRESS"
echo "CPU_CORES=$CPU_CORES"
echo "RAM=$RAM"
echo "DISK_SIZE=$DISK_SIZE"
echo "DISK_SELECTION='$DISK_SELECTION'"

# Check if the necessary environment variables are defined
if [ -z "$WALLET_ADDRESS" ] || [ -z "$CPU_CORES" ] || [ -z "$RAM" ] || [ -z "$DISK_SIZE" ]; then
    echo "Veuillez définir les variables d'environnement suivantes : WALLET_ADDRESS, CPU_CORES, RAM, DISK_SIZE"
    exit 1
fi

# Check that DISK_SELECTION is defined (it can be empty)
if [ -z "${DISK_SELECTION+defined}" ]; then
    echo "Veuillez définir la variable d'environnement DISK_SELECTION (peut être vide pour sélectionner la première option)"
    exit 1
fi

# Execute the Node.js script
node automate_rivalz.js

# Keep the container running
tail -f /dev/null
