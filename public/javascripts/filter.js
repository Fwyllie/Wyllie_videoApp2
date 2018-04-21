(() => {

var movieSelection = document.querySelector(".moviesDiv"),
    musicSelection = document.querySelector(".musicDiv"),
    tvSelection = document.querySelector(".tvDiv"),
    movie = document.querySelector("#filter1"),
    tv = document.querySelector("#filter2"),
    music = document.querySelector("#filter3"),
    movieFs = document.querySelector(".movieFilter"),
    tvFs = document.querySelector(".tvFilter"),
    musicFs = document.querySelector(".musicFilter"),
    clear = document.querySelector("#clearF");

function showMovF(){
  movieFs.style.display="block";
  tvFs.style.display = "none";
  musicFs.style.display = "none";
  movieSelection.style.display = "block";
  musicSelection.style.display = "none";
  tvSelection.style.display = "none";
}
function showtvF(){
  tvFs.style.display="block";
  movieFs.style.display = "none";
  musicFs.style.display = "none";
  movieSelection.style.display = "none";
  musicSelection.style.display = "none";
  tvSelection.style.display = "block";
}
function showmusF(){
  musicFs.style.display="block";
  tvFs.style.display = "none";
  movieFs.style.display = "none";
  movieSelection.style.display = "none";
  musicSelection.style.display = "block";
  tvSelection.style.display = "none";
}
function clearFilter(){
  musicFs.style.display="none";
  tvFs.style.display = "none";
  movieFs.style.display = "none";
  movieSelection.style.display = "block";
  musicSelection.style.display = "block";
  tvSelection.style.display = "block";
}

clear.addEventListener('click', clearFilter, false);
movie.addEventListener('click', showMovF, false);
tv.addEventListener('click', showtvF, false);
music.addEventListener('click', showmusF, false);
})();
