const express = require('express');
const router = express.Router();
const { getProfile, getMyRequests } = require('../controllers/userController');
const { verifyToken } = require('../middleware/auth');

router.get('/profile', verifyToken, getProfile);
router.get('/requests', verifyToken, getMyRequests);

module.exports = router;
