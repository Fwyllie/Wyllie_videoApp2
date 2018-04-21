// handle the routing requests
const connect = require('../utils/sqlConnect');

exports.getHome = (req, res) => {
  console.log("hit all movies");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
  let query = `SELECT * FROM tbl_movies`;
  connect.query(query, (error, rows) => {
    connection.release();
    if (error){
      console.log(error);
    }
    console.log(rows);
    res.render('login', {
    });
  });
});
};

exports.getAllParents = (req, res) => {
  console.log("run Parents page");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
    let movQuery = 'SELECT movies_id, movies_title, movies_cover, movies_trailer FROM tbl_movies';
    let musQuery = 'SELECT music_id, music_name, music_artist, music_thumbnail, music_link FROM tbl_music';
    let tvQuery = 'SELECT tv_id, tv_name, tv_rating, tv_thumbnail FROM tbl_tv';
    connect.query(movQuery, (err, movResult) => {
      connect.query(musQuery, (err, musResult) => {
        connect.query(tvQuery, (err, tvResult) => {
          connection.release();
          if(err){
            return console.log(err.message);
          }
          res.render('parents_home', {
            title: 'Fran\'s Greatest Hits',
            movieData : JSON.stringify(movResult),
            musicData : JSON.stringify(musResult),
            tvData : JSON.stringify(tvResult),
            css : 'main.css',
            js : ['main.js'],
        });
        console.log(musResult);
        });
      });
    });
  });
};
exports.getAllKids = (req, res) => {
  console.log("run getSingletv");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
    let query = 'SELECT movies_id, movies_title, movies_cover, movies_trailer FROM tbl_movies WHERE movies_kids="yes"';
    let musQuery = 'SELECT music_id, music_name, music_artist, music_thumbnail, music_link FROM tbl_music WHERE music_kids="yes"';
    let tvQuery = 'SELECT tv_id, tv_name, tv_rating, tv_thumbnail FROM tbl_tv WHERE tv_kids="yes"';
    connect.query(query, (err, movResult) => {
      connect.query(musQuery, (err, musResult) => {
        connect.query(tvQuery, (err, tvResult) => {
          connection.release();
          if(err){
            return console.log(err.message);
          }
          res.render('kids_home', {
            title: 'Fran\'s Greatest Hits',
            movieData : JSON.stringify(movResult),
            musicData : JSON.stringify(musResult),
            tvData : JSON.stringify(tvResult),
            css : 'kids.css',
            js : ['main.js']
          });
        });
      });
    });
  });
};

exports.getOne = (req, res) => {
  console.log("hit get one");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
  let revquery = `SELECT * FROM tbl_comments WHERE comments_movie = "${req.params.id}"`;
  let movquery = `SELECT movies_id, movies_cover, movies_title, movies_runtime, movies_storyline, movies_trailer, movies_release FROM tbl_movies WHERE movies_id = "${req.params.id}"`
  // console.log(req.params.id, req.params.link);
    connect.query(revquery, (error, revResult) => {
      connect.query(movquery, (error, movResult) => {
        connection.release();
        if (error){
          console.log(error);
        }
        console.log(revResult);
        res.render('watch', {
          movieId : req.params.id,
          singleData : movResult[0],
          movieData : JSON.stringify(revResult),
          js : ['movieVM.js']
        });
      });
    });
});
};

exports.getOneTV = (req, res) => {
  console.log("hit get one TV");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
  let revquery = `SELECT * FROM tbl_comments WHERE comments_tv = "${req.params.id}"`;
  let movquery = `SELECT tv_id, tv_thumbnail, tv_name, tv_desc, tv_rating, tv_video, tv_episode FROM tbl_tv WHERE tv_id = "${req.params.id}"`
    connect.query(revquery, (error, revResult) => {
      connect.query(movquery, (error, movResult) => {
        connection.release();
        if (error){
          console.log(error);
        }
        console.log(revResult);
        res.render('watchTV', {
          movieId : req.params.id,
          singleData : movResult[0],
          movieData : JSON.stringify(revResult),
          js : ['movieVM.js']
        });
      });
    });
});
};

exports.post_new_review = (req, res) => {
  console.log("hit all movies");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
    let query = `INSERT INTO tbl_comments VALUES (NULL, "${req.body.name}", "${req.body.comment}", CURRENT_TIMESTAMP(), "${req.body.id}", 'no', "${req.body.stars}")`;
    console.log(req.params.id, req.params.movie);
    connect.query(query, (error, rows) => {
      connection.release();
      if (error){
        console.log(error);
      }
      res.json(rows);
    });
  });
};
exports.postTvReview = (req, res) => {
  console.log("hit all movies");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
    let query = `INSERT INTO tbl_comments VALUES (NULL, "${req.body.name}", "${req.body.comment}", CURRENT_TIMESTAMP(), 'no', "${req.body.id}", "${req.body.stars}")`;
    console.log(req.params.id, req.params.movie);
    connect.query(query, (error, rows) => {
      connection.release();
      if (error){
        console.log(error);
      }
      res.json(rows);
    });
  });
};
