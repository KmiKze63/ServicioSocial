const express = require('express');
const router = express.Router();
const { listUsers, listPendingRequests } = require('../controllers/adminController');
const { verifyToken, isAdmin } = require('../middleware/auth');

router.get('/users', verifyToken, isAdmin, listUsers);
router.get('/requests/pending', verifyToken, isAdmin, listPendingRequests);

module.exports = router;
