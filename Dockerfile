# syntax=docker/dockerfile:1.4
FROM directus/directus:10.6.2
USER root
COPY ca-certificate123.crt /etc
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus
EXPOSE 8055
USER node
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;
