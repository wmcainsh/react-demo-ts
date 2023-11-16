# Use an official Node runtime as the base image
FROM node:21.2

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and yarn.lock files to the workdir
COPY package.json yarn.lock ./

# Install all dependencies
RUN yarn install --production

# Copy the current directory contents into the container at /app
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the app when the container launches
CMD ["yarn", "start"]