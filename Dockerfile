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
RUN addgroup --system monorepo && adduser --system --ingroup monorepo monorepo && mkdir client
COPY ecosystem.config.js .
RUN npm install -g pm2
COPY --from=buildapi /app/package.json .
RUN npm i --production
COPY --from=buildapi /app/dist .
COPY --from=buildweb /app/dist/spa ./client
RUN chown -R monorepo:monorepo /app
USER monorepo

CMD ["pm2-runtime", "ecosystem.config.js"]



