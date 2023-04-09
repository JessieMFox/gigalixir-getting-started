#!/bin/sh

cat << EOF > /run/config.json
{
  "log": {
    "loglevel": "none"
  },
  "inbounds": [{
    "port": 443,
    "protocol": "vless",
    "settings": {
      "clients": [{
        "id": "${ID}"
      }],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "/"
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom"
  }]
}
EOF

chmod +x ./xr
./xr run -c /run/config.json
