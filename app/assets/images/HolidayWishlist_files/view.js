// var masonry;

// //view for collection
// var ItemsListView = Backbone.View.extend({
//   tagName: 'div',
//   className: 'items-list',
//   template: _.template($('#items-list').html()),

//   initialize: function() {
//     this.listenTo(this.collection, 'add', this.addOne);
//     this.listenTo(this.collection, 'change sync reset', this.render);
//   },
// // $ ->
// //   $('#items').imagesLoaded ->
// //     $('#items').masonry
// //       itemSelector: '.box'
// //       isFitWidth: true

//   render: function() {
//     var container = document.querySelector('#container');
//     // initialize Masonry after all images have loaded
//     imagesLoaded( container, function() {
//       masonry = new Masonry(container, {
//         "itemSelector":'.item',
//         "isFitWidth":true
//       });
//     });

//   addOne: function(item) {
//     var view = new ItemView({model: item});
//     this.$el.append(view.el);
//     this.render();
//   }
// });


