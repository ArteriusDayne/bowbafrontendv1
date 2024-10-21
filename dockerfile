# Use the official Node.js 20 image
FROM node:21-alpine AS base

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the Next.js application
ARG BACKEND_URL
ENV BACKEND_URL=${BACKEND_URL}
RUN echo "BACKEND_URL: $BACKEND_URL"
RUN yarn build

# Expose port 8000
EXPOSE 8000

# Run Next.js in production mode
CMD ["yarn", "start"]
