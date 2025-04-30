FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the code
COPY . .

# Set build argument for base URL (with default value)
ARG BASEURL="/docs-scs"
ENV BASEURL=$BASEURL

# Build the application
RUN npm run build


