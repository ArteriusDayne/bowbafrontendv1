# Use the official Node.js 20 image
FROM node:21-alpine AS base

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
RUN npm install -g npm@10.9.0

# Copy the rest of the application
COPY . .

# Build the Next.js application
RUN yarn build

# Expose port 8000
EXPOSE 8000

# Run Next.js in production mode
CMD ["yarn", "start"]
