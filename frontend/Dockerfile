# syntax=docker/dockerfile:1.7
FROM node:20-alpine
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm ci --silent

# Copy source files (node_modules is excluded by .dockerignore)
COPY . .

# Build the application
RUN npm run build

# Serve the application
EXPOSE 3000
CMD ["npm", "run", "dev", "--", "--host"]