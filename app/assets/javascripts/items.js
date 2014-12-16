var EtsyData = []

function getEtsyData() {
  // var baseUrl = "https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi&category=accessories"

 $.ajax({
  url:'/api_call',
  type: 'GET',
  dataType: "json",
  success: function(data) {
    console.log(data);
        EtsyData = data.response
      }
  })
}

// $(document).ready(function(){
//   // console.log("???");
//   getEtsyData();
// });
