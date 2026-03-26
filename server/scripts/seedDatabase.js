// Add this to your server/server.js after DB connection to seed demo user
// This helps populate the database with demo credentials

const User = require('./models/User');

// Seed demo user (run once)
const seedDemoUser = async () => {
  try {
    const existingUser = await User.findOne({ email: 'demo@example.com' });
    
    if (!existingUser) {
      await User.create({
        name: 'Demo User',
        email: 'demo@example.com',
        password: 'password123'
      });
      console.log('Demo user created successfully');
    }
  } catch (error) {
    console.log('Demo user might already exist or error occurred:', error.message);
  }
};

// Call this after MongoDB connection:
// seedDemoUser();
