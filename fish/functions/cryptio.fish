# SSH tunnel to the development database
function cryptio_development_database
  ssh -N -L 6661:127.0.0.1:15004 user@cryptio
end

# SSH tunnel to the development database, to be run in the background
function _cryptio_development_database_background
  ssh -f -o ExitOnForwardFailure=yes -L 6661:127.0.0.1:15004 user@cryptio sleep 10
end

# SSH tunnel to the production database
function cryptio_production_database
  ssh -N -L 6662:127.0.0.1:15005 user@cryptio
end

# SSH tunnel to the production database, to be run in the background
function _cryptio_production_database_background
  ssh -f -o ExitOnForwardFailure=yes -L 6662:127.0.0.1:15005 user@cryptio sleep 10
end
