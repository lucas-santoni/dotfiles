# SSH tunnel to the production database
function cryptio_production_database
  ssh -N -L 6662:127.0.0.1:15005 user@cryptio
end
