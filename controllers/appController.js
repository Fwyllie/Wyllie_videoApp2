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
    let movQuery = 'SELECT movies_id, movies_title, movies_cover FROM tbl_movies';
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
            // defaultMovie : movResult[Math.floor(Math.random() * movResult.length)],
            // data : JSON.stringify(movResult),
            movieData : JSON.stringify(movResult),
            musicData : musResult,
            tvData : tvResult,
            css : 'main.css',
            js : ['main.js'],
            test : ["{movies_id: 10, movies_title: 'Trolls', movies_cover: 'trolls.jpg' }"]
        });
        console.log(movResult);
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
    let query = 'SELECT movie_id, movie_title, movie_rating, movie_thumbnail FROM tbl_movies WHERE movie_kids="yes"';
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
            movieData : movResult,
            musicData : musResult,
            tvData : tvResult,
            css : 'kids.css',
            js : ['filter.js','main.js', 'genreFilter.js']
          });
        });
      });
    });
  });
};

exports.getOne = (req, res) => {
  console.log("hit all movies");
  connect.getConnection((err, connection) => {
    if(err){
      return console.log(err.message);
    }
  let query = `SELECT * FROM tbl_comments WHERE comments_movie = "${req.params.id}"`;
  console.log(req.params.id, req.params.movie);
  connect.query(query, (error, rows) => {
    connection.release();
    if (error){
      console.log(error);
    }
    console.log(rows);
    res.render('moviePage', {
      movie : req.params.id,
      moviesrc : req.params.movie,
      data : JSON.stringify(rows),
      mainpage : false,
      videopage : true
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
    let query = `INSERT INTO tbl_comments VALUES (NULL, "${req.body.name}", "${req.body.comment}", CURRENT_TIMESTAMP(), "${req.body.id}", "${req.body.stars}")`;
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
