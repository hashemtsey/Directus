# syntax=docker/dockerfile:1.4
FROM directus/directus:10.8.13
USER root
COPY * /etc
CMD ls -ltr /etc | grep -i certificate 
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus
EXPOSE 8055
USER node
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;
