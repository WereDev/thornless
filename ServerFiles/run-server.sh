#!/bin/bash
echo Starting NGINX
nginx
# certbot --nginx -d yourdomain.com -d www.yourdomain.com
# nginx -s reload
echo Starting Thornless
/app/Thornless.UI.Web --urls="http://localhost:5000"