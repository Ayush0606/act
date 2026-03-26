const express = require('express');
const { getDashboardData } = require('../controllers/dashboardController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

// Dashboard routes
router.get('/data', verifyToken, getDashboardData);

module.exports = router;
