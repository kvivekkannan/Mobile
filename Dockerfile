# ---- Stage 1: Build ----
FROM node:18-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# ---- Stage 2: Run ----
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY package*.json ./
RUN npm install --only=production
CMD ["node", "dist/server.js"]
