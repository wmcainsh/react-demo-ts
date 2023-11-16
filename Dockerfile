# ---- Base Node ----
FROM node:21.2 AS base
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production

# ---- Build ----
FROM base AS build
WORKDIR /app
COPY . .
RUN yarn build

# ---- Release ----
FROM nginx:1.25.3-alpine-slim AS release
WORKDIR /app
COPY --from=build /app/build /usr/share/nginx/html
