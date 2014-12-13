var Item = Backbone.Model.extend({
  defaults: {
    title: '',
    descripition: '',
    image_url: '',
    url: '',
    created_at: ''
  }
});

var ItemCollection = Backbone.Collection.extend({
  model: Item,

  url: '/items'

});
