<style>
    .carousel {
      margin: auto; 
      max-width: 800px; 
      height:300px;
    }
    .carousel-item{
      margin-left: 150px;
    }
</style>


<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
<div id="carouselExampleDark" class="carousel carousel-dark slide">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="3000">

      <img src="${pageContext.request.contextPath}/resources/img/advertisement/b.png" class="img-thumbnail" alt width="50%">

      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="3000">

      <img src="${pageContext.request.contextPath}/resources/img/advertisement/c.png" class="img-thumbnail" alt width="50%">

      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="3000">

      <img src="${pageContext.request.contextPath}/resources/img/advertisement/e.png" class="img-thumbnail" alt width="50%">

      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>