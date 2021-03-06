Vue.component('review-stars', {
  template : `<div class="star-rating">
        <label class="star-rating-star" v-for="rating in ratings"
        :class="{'is-selected': ((value >= rating) && value != null), 'is-disabled': disabled}"
        v-on:click="updateValue(rating)" v-on:mouseover="updateValue(rating)" v-on:mouseout="updateValue(rating)">
        <input class="star-rating star-rating-checkbox" type="radio" :value="rating"
        v-model="value" :disabled="disabled">★</label></div>`,
  props: ['value', 'disabled'],
  data : function(){
    return{
      ratings : [1, 2, 3, 4, 5]
    }
  },
  methods : {
    updateValue : function(value){
      if(!this.diabled){
        this.$emit('input', value)
      }
    }
  }
})

var myVideoApp = {
  movieReviews(movies){
    movies.forEach(review => {myVideoApp.vm.reviews.push({
        name : review.comments_auth,
        rating : review.comments_rating,
        date : review.comments_date,
        content : review.comments_copy
      });
    });
  },

  vm : new Vue ({
    delimiters : ["${", "}"],
    el : "#video",
    data : {
      reviews : [],
      numStars : 0,
      review : "",
      testMessage : "Hello Ryan WAgget",
      name : ""
    },
    methods : {
      addReview(){
        //fetch here
        let movieId = document.querySelector('.movId').textContent;

        axios.post('/api', {
          id : movieId,
          name : this.name,
          stars : this.numStars,
          comment : this.review
        })
        .then ((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
        this.reviews.push({
          name : this.name,
          content :  this.review,
          rating : this.numStars,
          date : `${new Date()}`
        });
        this.name = "";
        this.review = "";
        this.numStars = 0;
      },
    addTvReview(){
      //fetch here
      let movieId = document.querySelector('.movId').textContent;

      axios.post('/tvapi', {
        id : movieId,
        name : this.name,
        stars : this.numStars,
        comment : this.review
      })
      .then ((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });

      this.reviews.push({
        name : this.name,
        content :  this.review,
        rating : this.numStars,
        date : `${new Date()}`
      });

      this.name = "";
      this.review = "";
      this.numStars = 0;
      }
    }
  })
};
myVideoApp.movieReviews(appData.movies);
