FROM postgres:alpine3.18 as db
ENV PGDATA /app-data
ENV POSTGRES_PASSWORD $SocialMail2023
FROM ghcr.io/social-mail/docker-node-clamav:main
COPY --from=db / /
VOLUME /app-data
VOLUME /var/lib/clamav
VOLUME /app-files
WORKDIR /app
COPY package*.json ./
COPY index.js ./
RUN npm install -s @social-mail/social-mail-web-server
ENV HOST 0.0.0.0
ENV PORT 80
ENV SELF_HOST true
ENV SOCIAL_MAIL_DB_SERVER postgres
ENV SOCIAL_MAIL_DB_HOST localhost
ENV SOCIAL_MAIL_DB_PORT 5432
ENV SOCIAL_MAIL_DB_DATABASE SocialMails
ENV SOCIAL_MAIL_DB_USER postgres
ENV SOCIAL_MAIL_DB_PASSWORD $SocialMail2023
ENV SOCIAL_MAIL_STORAGE volume
ENV SOCIAL_MAIL_STORAGE_PATH /app-files
EXPOSE 80 443 25
ENTRYPOINT ["/sbin/tini", "--", "npm", "start"]