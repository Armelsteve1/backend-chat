FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Set default environment variables (can be overridden)
ENV PORT=3000

# Command to start the application
CMD ["npm", "run", "start:prod"]
