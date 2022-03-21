#!/usr/bin/with-contenv bashio

declare appToken
declare apiToken
declare hosts

# Create a comfig dir
mkdir -p /etc/zerons
# Create a hosts file
touch /etc/zerons/hosts

# Set the auth token for the ZeroTier Central API
if bashio::config.has_value 'app_auth_token'; then
    appToken=$(bashio::config 'app_auth_token')
    echo -n "${appToken}" > /etc/zerons/token
fi

# Set the auth token for the local JSON API
if bashio::config.has_value 'api_auth_token'; then
    apiToken=$(bashio::config 'api_auth_token')
    echo -n "${apiToken}" > /etc/zerons/authtoken.secret
fi

# Set the custom hosts file
if bashio::config.has_value 'hosts'; then
    hosts=$(bashio::config 'hosts')
    echo "${hosts}" > /etc/zerons/hosts
fi
