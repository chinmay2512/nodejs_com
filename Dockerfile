FROM ghcr.io/social-mail/docker-node-clamav:main
VOLUME /var/lib/clamav
VOLUME /data
WORKDIR /app
COPY package*.json ./
COPY index.js ./
RUN npm install -s @social-mail/social-mail-web-server
ENV HOST 0.0.0.0
ENV PORT 80
ENV SELF_HOST true
EXPOSE 80 443 25
ENTRYPOINT ["/sbin/tini", "--", "npm", "start"]