@echo off
echo === Billing App Setup Script (Windows) ===

REM Step 1: Check Java
java -version
IF %ERRORLEVEL% NEQ 0 (
    echo Java not found. Please install JDK 17+ from https://adoptium.net/
    exit /b
)

REM Step 2: Check Maven
mvn -v
IF %ERRORLEVEL% NEQ 0 (
    echo Maven not found. Please install it from https://maven.apache.org/
    exit /b
)

REM Step 3: Check MySQL
mysql --version
IF %ERRORLEVEL% NEQ 0 (
    echo MySQL client not found. Please install it from https://dev.mysql.com/
    exit /b
)

REM Step 4: Check Node
node -v
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js not found. Please install it from https://nodejs.org/
    exit /b
)

REM Step 5: Check npm
npm -v
IF %ERRORLEVEL% NEQ 0 (
    echo npm not found.
    exit /b
)

REM Step 6: Install Angular CLI
echo Installing Angular CLI globally (if not already installed)...
npm install -g @angular/cli

REM Step 7: Create database
echo Creating MySQL database 'billing'...
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS billing;"

REM Step 8: Build and run backend
echo Building and starting Spring Boot backend...
cd backend
mvn clean install
start cmd /k "mvn spring-boot:run"
cd ..

REM Step 9: Install frontend and run Angular
cd frontend
npm install
start cmd /k "ng serve"
cd ..

echo === Setup Complete ===
echo Frontend: http://localhost:4200
echo Backend: http://localhost:8080
pause
