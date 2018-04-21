var express = require('express');
var controller = require('../controllers/appController');
var router = express.Router();

router.get('/', controller.getHome);
router.get('/parents', controller.getAllParents);
router.get('/kids', controller.getAllKids);
router.get('/watch/:id', controller.getOne);
router.get('/watchTV/:id', controller.getOneTV);
router.post('/api', controller.post_new_review);
router.post('/tvapi', controller.postTvReview);

module.exports = router;
