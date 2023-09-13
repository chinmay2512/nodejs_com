FROM ghcr.io/social-mail/docker-node-clamav:main
VOLUME /var/lib/clamav
VOLUME /data/cert
VOLUME /data/files
WORKDIR /app
COPY package*.json ./
COPY index.js ./
RUN npm install -s @social-mail/social-mail-web-server
ENTRYPOINT ["/sbin/tini", "--", "npm", "start"]