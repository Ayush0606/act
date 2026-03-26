const User = require('../models/User');

// Get dashboard data (protected route)
const getDashboardData = async (req, res) => {
  try {
    // Get current user info
    const user = await User.findById(req.userId);

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'User not found'
      });
    }

    // Dummy data
    const leads = [
      { id: 1, name: 'John Doe', company: 'Acme Corp', status: 'active' },
      { id: 2, name: 'Jane Smith', company: 'Tech Solutions', status: 'pending' },
      { id: 3, name: 'Bob Johnson', company: 'StartUp Inc', status: 'active' }
    ];

    const tasks = [
      { id: 1, title: 'Call John Doe', status: 'completed', dueDate: '2026-03-25' },
      { id: 2, title: 'Send proposal to Jane', status: 'in_progress', dueDate: '2026-03-28' },
      { id: 3, title: 'Follow up with Bob', status: 'pending', dueDate: '2026-03-30' }
    ];

    const users = [
      { id: 1, name: 'Alice Manager', role: 'Manager', status: 'online' },
      { id: 2, name: 'Bob Developer', role: 'Developer', status: 'online' },
      { id: 3, name: 'Charlie Designer', role: 'Designer', status: 'offline' }
    ];

    res.json({
      success: true,
      data: {
        user: {
          id: user._id,
          name: user.name,
          email: user.email
        },
        leads,
        tasks,
        users,
        stats: {
          totalLeads: leads.length,
          completedTasks: tasks.filter(t => t.status === 'completed').length,
          onlineUsers: users.filter(u => u.status === 'online').length
        }
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

module.exports = { getDashboardData };
