# SSH tunnel to the development database
function cryptio_development_database
  ssh -N -L 6661:127.0.0.1:15004 user@cryptio
end
