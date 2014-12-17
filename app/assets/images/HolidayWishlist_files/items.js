(function() {
  $(function() {
    return $('#items').imagesLoaded(function() {
      return $('#items').masonry({
        itemSelector: '.box',
        isFitWidth: true
      });
    });
  });

}).call(this);
