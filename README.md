# Full Stack Web Application

A complete full-stack web application built with React.js (frontend), Node.js + Express (backend), and MongoDB (database).

## Features

- **User Authentication** - Register and login with JWT tokens
- **Protected Routes** - Secure dashboard accessible only to authenticated users
- **Responsive Design** - Tailwind CSS for modern UI
- **RESTful API** - Clean API architecture with proper error handling
- **Production Ready** - Docker support, environment configuration, and deployment ready

## Prerequisites

- **Node.js** v14+ ([Download](https://nodejs.org/))
- **MongoDB** - MongoDB Atlas account ([Create free account](https://www.mongodb.com/cloud/atlas))
- **npm** - Node package manager (comes with Node.js)

## Project Structure

```
act/
├── server/                    # Backend (Express + MongoDB)
│   ├── models/               # Database schemas
│   │   └── User.js
│   ├── controllers/          # Business logic
│   │   ├── authController.js
│   │   └── dashboardController.js
│   ├── routes/               # API endpoints
│   │   ├── auth.js
│   │   └── dashboard.js
│   ├── middleware/           # Custom middleware
│   │   ├── auth.js
│   │   └── errorHandler.js
│   ├── server.js             # Main entry point
│   ├── package.json
│   ├── .env                  # Environment variables
│   └── Dockerfile
├── client/                    # Frontend (React)
│   ├── src/
│   │   ├── pages/            # Page components
│   │   │   ├── LoginPage.js
│   │   │   └── DashboardPage.js
│   │   ├── components/       # Reusable components
│   │   │   └── ProtectedRoute.js
│   │   ├── services/         # API calls
│   │   │   └── api.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   ├── .env                  # Environment variables
│   ├── tailwind.config.js
│   └── Dockerfile
└── docker-compose.yml        # Docker multi-container setup
```

## Quick Setup (5 minutes)

### 1. Clone/Extract Project
```bash
cd act
```

### 2. Setup MongoDB

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a free account
3. Create a new cluster
4. Get your connection string: `mongodb+srv://username:password@cluster.mongodb.net/dbname`

### 3. Setup Backend

```bash
cd server

# Install dependencies
npm install

# Create .env file with your MongoDB URI
echo "MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/dbname" > .env
echo "JWT_SECRET=your-secret-key-here" >> .env
echo "PORT=5000" >> .env
echo "NODE_ENV=development" >> .env

# Start backend server
npm start
```

Backend runs on: `http://localhost:5000`

### 4. Setup Frontend (New Terminal)

```bash
cd client

# Install dependencies
npm install

# Start frontend server
npm start
```

Frontend runs on: `http://localhost:3000`

## Usage

### Login
1. Open `http://localhost:3000` in your browser
2. Demo credentials:
   - Email: `demo@example.com`
   - Password: `password123`

3. Or register a new account

### Dashboard
After login, you'll see:
- User information
- Data tables (Leads, Tasks, Users)
- Statistics
- Logout button

## Environment Variables

### Backend (.env)
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/dbname
JWT_SECRET=your-secret-key-min-32-characters
PORT=5000
NODE_ENV=development
CORS_ORIGIN=http://localhost:3000
```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user, returns JWT token

### Dashboard (Protected)
- `GET /api/dashboard/data` - Get dashboard data (requires token)

### Health Check
- `GET /api/health` - Check if server is running

## Running with Docker

```bash
# Build and start both services
docker-compose up -d

# Frontend: http://localhost:3000
# Backend: http://localhost:5000

# Stop services
docker-compose down
```

## Stopping Servers

### Kill Node Processes (Windows PowerShell)
```powershell
Stop-Process -Name node -Force
```

### Kill Node Processes (Mac/Linux)
```bash
pkill -f "node"
```

## Troubleshooting

### MongoDB Connection Error
- Verify MongoDB URI in `.env`
- Check IP whitelist in MongoDB Atlas (add 0.0.0.0/0 for development)
- Ensure database user has correct permissions

### Port Already in Use
```powershell
# Windows - Kill process using port 5000
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# For port 3000
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

### Login Fails
- Verify demo user exists in database
- Check `.env` has correct `JWT_SECRET`
- Clear browser localStorage: `localStorage.clear()`

### CORS Errors
- Verify `CORS_ORIGIN` in backend `.env` matches frontend URL
- Check both servers are running

## Development

### Backend
- Framework: Express.js v4.18.2
- Database: MongoDB with Mongoose ODM
- Authentication: JWT (jsonwebtoken)
- Password Hashing: bcryptjs

### Frontend
- Framework: React 18.2.0
- Routing: React Router DOM v6
- HTTP Client: Axios
- Styling: Tailwind CSS 3.3.0
- Storage: localStorage for token persistence

## Production Deployment

See `DEPLOYMENT_CHECKLIST.md` for detailed deployment instructions to:
- Heroku
- Vercel
- Railway
- DigitalOcean
- AWS
- Docker

## Scripts

### Backend
```bash
npm start              # Start development server
npm run prod           # Start production server
npm run build          # Build for production
npm run lint           # Lint code
```

### Frontend
```bash
npm start              # Start development server
npm run build          # Build for production
npm run serve          # Serve production build
npm test               # Run tests
npm run lint           # Lint code
```

## Security Notes

- **JWT Secret**: Use strong secret (32+ characters) in production
- **Environment Variables**: Never commit `.env` to git
- **CORS**: Whitelist specific origins in production
- **HTTPS**: Use SSL/TLS in production
- **Password Hashing**: Passwords are hashed with bcrypt (10 rounds)

## License

MIT

## Support

For issues or questions:
1. Check `.env` configuration
2. Review error messages in console
3. Check MongoDB connection
4. Verify both servers are running

---

**Ready to deploy?** Check deployment guides for multi-platform deployment options.
