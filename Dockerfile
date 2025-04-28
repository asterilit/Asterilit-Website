# Use the official Node.js image
FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Install git
RUN apt-get update && apt-get install -y git

# Clone the repo
RUN git clone https://github.com/asterilit/Asterilit-Website.git . 

# Install Node.js dependencies
RUN npm install

# Expose the app port
EXPOSE 3000

# Start the web server
CMD ["npm", "start"]
