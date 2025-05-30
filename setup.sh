#!/bin/bash

echo "=== Billing App Setup Script ==="

# Step 1: Check Java
echo "Checking Java..."
if ! command -v java &> /dev/null; then
  echo "Java is not installed. Please install JDK 17+ from https://adoptium.net/"
  exit 1
else
  java -version
fi

# Step 2: Check Maven
echo "Checking Maven..."
if ! command -v mvn &> /dev/null; then
  echo "Maven is not installed. Please install it from https://maven.apache.org/download.cgi"
  exit 1
else
  mvn -v
fi

# Step 3: Check MySQL
echo "Checking MySQL..."
if ! command -v mysql &> /dev/null; then
  echo "MySQL is not installed. Please install it from https://dev.mysql.com/downloads/installer/"
  exit 1
else
  echo "MySQL client detected"
fi

# Step 4: Check Node
echo "Checking Node.js..."
if ! command -v node &> /dev/null; then
  echo "Node.js is not installed. Please install it from https://nodejs.org/"
  exit 1
else
  node -v
fi

# Step 5: Check npm
echo "Checking npm..."
if ! command -v npm &> /dev/null; then
  echo "npm is not installed."
  exit 1
else
  npm -v
fi

# Step 6: Install Angular CLI
echo "Installing Angular CLI (if not already installed)..."
npm install -g @angular/cli

# Step 7: Create database
echo "Creating MySQL database 'billing'..."
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS billing;"

# Step 8: Build and run backend
echo "Building and starting Spring Boot backend..."
cd backend
mvn clean install
mvn spring-boot:run &
cd ..

# Step 9: Build and run Angular frontend
echo "Installing frontend dependencies..."
cd frontend
npm install
ng serve &
cd ..

echo "=== Setup complete! ==="
echo "Frontend: http://localhost:4200"
echo "Backend: http://localhost:8080"
