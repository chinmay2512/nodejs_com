FROM ghcr.io/social-mail/docker-node-clamav:main
VOLUME /var/lib/clamav
VOLUME /data
WORKDIR /app
ENTRYPOINT ["/sbin/tini", "--", "npm", "exec", "social-mail-web-server", "--package=@social-mail/social-mail-web-server"]