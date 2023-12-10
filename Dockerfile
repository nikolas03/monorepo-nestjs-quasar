FROM node:20-bullseye-slim as buildweb
WORKDIR /app
COPY apps/web/package.json .
RUN npm i 
COPY apps/web .
RUN npm run build

FROM node:20-bullseye-slim as buildapi
WORKDIR /app
COPY apps/api/package.json .
RUN npm i 
COPY apps/api .
RUN npm run build

FROM node:20-bullseye-slim
WORKDIR /app
RUN addgroup --system monorepo && adduser --system --ingroup monorepo monorepo
COPY --from=buildapi /app/package.json .
COPY ecosystem.config.js .
RUN npm install -g pm2 && \
    npm i --omit-dev

COPY --from=buildapi /app/dist .
RUN mkdir client
COPY --from=buildweb /app/dist/spa ./client
RUN chown -R monorepo:monorepo /app
USER monorepo

CMD ["pm2-runtime", "ecosystem.config.js"]



