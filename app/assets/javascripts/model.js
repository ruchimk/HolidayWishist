var Item = Backbone.Model.extend({
  defaults: {
    title: '',
    descripition: '',
    image_url: '',
    url: ''
  }
});

var ItemCollection = Backbone.Collection.extend({
  model: Item,

  url: '/items'

});
