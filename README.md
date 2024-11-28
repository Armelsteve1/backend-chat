# 🚀 BackendChat - Backend

## 📖 **Description**

**BackendChat** is a backend application built with **NestJS** to power a real-time messaging system. It uses **PostgreSQL** for user management and **MongoDB** for storing messages. This guide explains how to set up and deploy the project locally using **Docker**.

✨ **Features include:**
- 🔒 Secure user authentication with **JWT**.
- 💬 Real-time messaging powered by **WebSocket**.
- 📑 API documentation generated with **Swagger**.
- 📂 Database initialization scripts for both PostgreSQL and MongoDB.

---

## 🛠️ **Features**

### 🔑 **Authentication**
- User registration, login, and logout.
- Password hashing with **bcrypt**.
- Session management using **JWT**.

### 👤 **User Management (PostgreSQL)**
- CRUD operations for user data.
- Secure storage of user information.

### 📨 **Real-Time Messaging (MongoDB)**
- Send and receive real-time messages.
- Store messages with:
  - **Timestamp**.
  - **Status**.
  - **Sender information**.

### 📋 **API Documentation**
- Full endpoint documentation available via **Swagger** at `/api/docs`.

---

## 📋 **Requirements**

Before starting, ensure you have the following tools installed:
- 🐳 [Docker](https://www.docker.com/products/docker-desktop)
- 🟩 [Node.js](https://nodejs.org/) (version 16 or higher)
- 🌿 [Git](https://git-scm.com/)

---

## 🚧 **Installation and Deployment**

### **1️⃣ Clone the repository**
```bash
git clone https://github.com/Armelsteve1/backend-chat.git
cd BackendChat
```

### **2️⃣ Configure environment variables**
- Create a `.env.local` file at the root of the project with the following content:
  ```env
  POSTGRES_USER=.............
  POSTGRES_PASSWORD=...........
  POSTGRES_DB=backendchat_local_db

  MONGODB_URI=mongodb://localhost:27017/backendchat_chat
  JWT_SECRET=..............
  PORT=3000
  ```

---

### **3️⃣ Initialize the databases**

#### 🐘 **PostgreSQL**
- The `init_postgres.sql` script initializes the database with a `users` table.
  - **Script location:** `init_postgres.sql`
    ```sql
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL
    );
    ```

#### 🍃 **MongoDB**
- The `init_mongodb.js` script initializes the database with a `messages` collection and a sample message.
  - **Script location:** `init_mongodb.js`
    ```javascript
    db = db.getSiblingDB("backendchat_chat");

    db.createCollection('messages');
    db.messages.insertOne({
        content: 'Welcome to BackendChat!',
        sender: 'System',
        timestamp: new Date()
    });
    ```

---

### **4️⃣ Start the application with Docker**

1. Ensure Docker is running.
2. Start the containers:
   ```bash
   docker-compose up --build
   ```

3. The following services will be available:
   - 🌐 **Backend**: http://localhost:3000
   - 📑 **Swagger Documentation**: http://localhost:3000/api/docs
   - 🐘 **PostgreSQL**: Port `5432`
   - 🍃 **MongoDB**: Port `27017`

4. To stop the containers:
   ```bash
   docker-compose down
   ```

---

## 🔎 **Verifying the Setup**

### 🐘 **PostgreSQL**
1. Connect to PostgreSQL using the `psql` CLI or a GUI tool like `pgAdmin`.
2. Example command to connect using `psql`:
   ```bash
   psql -h localhost -p 5432 -U local_user -d backendchat_local_db
   ```
3. Verify the `users` table:
   ```sql
   SELECT * FROM users;
   ```

### 🍃 **MongoDB**
1. Connect to MongoDB using `mongosh`:
   ```bash
   mongosh "mongodb://localhost:27017/backendchat_chat"
   ```
2. Verify the `messages` collection:
   ```javascript
   show collections;
   db.messages.find().pretty();
   ```

---

## 📋 **API Documentation**

- Full Swagger documentation is available via:
  ```
  http://localhost:3000/api/docs
  ```

- Example endpoints:
  - `POST /auth/login`: User login.
  - `GET /users`: Retrieve all users.
  - `POST /messages`: Send a message.

---

## ✅ **Testing**

### **Run Unit Tests**
To execute all unit tests for the backend:
```bash
npm run test
```

---

## 🗂️ **Project Structure**

```
src/
├── app/
│   ├── app.module.ts          # Main application module
│   ├── app.controller.ts      # Root controller
│   ├── app.service.ts         # Root service
├── users/                     # User management module
│   ├── users.controller.ts    # User-related routes
│   ├── users.service.ts       # User business logic
│   ├── user.entity.ts         # User entity (PostgreSQL)
│   ├── users.module.ts        # User module
├── auth/                      # Authentication module
│   ├── auth.controller.ts     # Authentication routes
│   ├── auth.service.ts        # Authentication business logic
│   ├── auth.module.ts         # Authentication module
├── messages/                  # Messaging module
│   ├── messages.controller.ts # Messaging routes
│   ├── messages.service.ts    # Messaging business logic
│   ├── message.schema.ts      # Messaging schema (MongoDB)
│   ├── messages.module.ts     # Messaging module
├── config/
│   ├── database.config.ts     # Database configuration
├── main.ts                    # Application entry point
```

---

## 🎯 **Best Practices**

1. **Environment variables:**
   - Store sensitive data like database credentials in `.env.local`.
   - Add `.env.local` to `.gitignore` to prevent it from being committed to Git.

2. **Docker Commands:**
   - Start containers: `docker-compose up --build`
   - Stop containers: `docker-compose down`

3. **Database Initialization:**
   - PostgreSQL and MongoDB are automatically initialized using `init_postgres.sql` and `init_mongodb.js`.

---

## 🤝 **Contributors**

- [Armel Steve Ouetchoua](https://github.com/Armelsteve1) - Developer passioner
