#!/bin/sh

docker logs -f $PROXY_NAME >> /app/logs/access.log