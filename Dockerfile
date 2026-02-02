# Using Node 23 to match the supported environment
FROM node:23-alpine
WORKDIR /app

# 1. Get Backend (GH Actions fetches Artifacts)
# This copies the dist/ folder and package files from the server-build artifact
COPY server-build/ ./

# 2. Get Frontend  (GH Actions fetches Artifacts)
# We create the directory first, then copy the UI assets into it
RUN mkdir -p dist/ui
COPY ui-build/ ./dist/ui/

# Install production dependencies for the backend
RUN npm install --omit=dev

# Set production environment
ENV NODE_ENV=production
EXPOSE 3000

# 4. Start People Portal!
CMD ["npm", "run", "start"]
