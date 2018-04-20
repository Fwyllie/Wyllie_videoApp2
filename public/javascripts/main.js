const myApp ={
  //Some non-VM fucntionality would go here -> split the movise into genres using Vue


//TREVORS
  // movieGenres(data, genres){
  //   genres.forEach((genre, index) => {
  //     myApp.vm.genres.push({
  //       name : genre,
  //       movies : data.filter(movie => movie.genre_name === genre)
  //     })
  //   })
  // },

// INPUT HARD CODED DATA WORKS
addMovies() {
      myApp.vm.movies.push({
        name  : 'beauty',
        id   : 2,
        cover : 'beauty.jpg'
      });
    },

//RANDOM THINGS I HAVE BEEN TRYING
  // addMovies(movieData) {
  //     movieData.forEach(movie => {myApp.vm.movies.push({
  //       id : movie.movies_id,
  //       title : movie.movies_title,
  //       cover: movie.movies_cover
  //     });
  //   });
  // },

  // addMovies(movieData) {
  //     movieData.forEach(movie => {myApp.vm.movies.push(movie);
  //   });
  // },

  // movieGenres(test) {
  //         test.forEach((movie, index) => {
  //             myApp.vm.movies.push({
  //                 id : movie.movies_id,
  //                 name  : movie.movies_title,
  //                 cover: movie.movies
  //             });
  //         });
  //     },

  // addMovies(test) {
  //   test.forEach((movie, index) => {
  //     myApp.vm.movies.push({
  //       id : test.movies_id,
  //       name : test.moves_title,
  //       cover : test.movies_cover
  //     });
  //   });
  // },


  vm : new Vue({
    el : '#app',
    data : {
      message : "Welcome to Franflix!",
      movies : []
    },
    methods : {

    },
    delimiters : ["${", "}"]
  })
}

//TREVORS
// myApp.movieGenres(appData.movies, ["Family", "Action", "Fantasy"]);

// INPUT HARD CODED DATA WORKS
myApp.addMovies();


// myApp.movieGenres(appData.movieData);
// myApp.addMovies(appData.test);
