var express = require('express');
var controller = require('../controllers/appController');
var router = express.Router();

router.get('/', controller.getHome);
router.get('/parents', controller.getAllParents);
router.get('/kids', controller.getAllKids);
router.get('/watch/:id', controller.getOne);
router.post('/api', controller.post_new_review);

module.exports = router;
