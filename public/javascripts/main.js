const myApp ={
  addMovies(movies) {
      movies.forEach(movie => {myApp.vm.movies.push({
        id : movie.movies_id,
        title : movie.movies_title,
        cover: movie.movies_cover,
        link : movie.movies_trailer
      });
    });
  },
  addMusic(music) {
      music.forEach(song => {myApp.vm.music.push({
        id : song.music_id,
        title : song.music_name,
        artist : song.music_artist,
        cover : song.music_thumbnail,
        link : song.music_link
      });
    });
  },
  addTv(tv) {
      tv.forEach(show => {myApp.vm.tv.push({
        id : show.tv_id,
        title : show.tv_name,
        cover: show.tv_thumbnail
      });
    });
  },

  vm : new Vue({
    el : '#app',
    data : {
      message : "Welcome to Franflix!",
      movies : [],
      music : [],
      tv : []
    },
    methods : {

    },
    delimiters : ["${", "}"]
  })
}

myApp.addMovies(appData.movies);
myApp.addMusic(appData.music);
myApp.addTv(appData.tv);
