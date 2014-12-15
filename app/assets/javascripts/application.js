// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_serialize_object
//= require underscore
//= require backbone
//= require masonry/jquery.masonry
//= require turbolinks
//= require_tree .


// snowflake animation from:http://sutherlandboswell.com/2012/11/creating-pretty-snow-with-javascript-html-css/
var ready = function() {
  function getWidth() {
    var x = 0;
    if (self.innerHeight) {
        x = self.innerWidth;
    }
    else if (document.documentElement && document.documentElement.clientHeight) {
        x = document.documentElement.clientWidth;
    }
    else if (document.body) {
        x = document.body.clientWidth;
    }
    return x;
}

function getHeight() {
    var y = 0;
    if (self.innerHeight) {
        y = self.innerHeight;
    }
    else if (document.documentElement && document.documentElement.clientHeight) {
        y = document.documentElement.clientHeight;
    }
    else if (document.body) {
        y = document.body.clientHeight;
    }
    return y;
}

function getRandom(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

var width = getWidth();
var height = getHeight();
var flakeCount = 40;
var gravity = 0.8;
var windSpeed = 20;
var flakes = [];

var currentFlake = 0;
var snowglobe = document.getElementById("snowglobe");

while (currentFlake < flakeCount) {
    var flake = document.createElement("div");
    flake.className = 'flake';
    flake.style.fontSize = getRandom(12, 24) + 'px';
    flake.style.top = getRandom(0, height) + 'px';
    flake.style.left = getRandom(0, width) + 'px';
    flake.innerHTML = "•";
    newFlake = snowglobe.appendChild(flake);
    newFlake.speed = getRandom(1, 100);
    flakes.push(newFlake);
    currentFlake++;
}
function doAnimation() {
    for (var i = 0; i < flakes.length; i++) {
        newX = false;
        newY = false;
        // Calculate Y position
        newY = parseFloat(flakes[i].style.top) + (flakes[i].speed / 100) * gravity;
        if (newY > height) {
            newY = 0 - parseInt(flakes[i].style.fontSize);
            // If Y is at bottom, randomize X
            newX = getRandom(0, width);
        }
        // Calculate X position if it hasn't been set randomly
        if (!newX) newX = parseFloat(flakes[i].style.left) + Math.sin(newY / windSpeed);
        if (newX < -20) newX = width + 20;
        if (newX > width + 20) newX = -20;
        // Set new position
        flakes[i].style.top = newY + 'px';
        flakes[i].style.left = newX + 'px';
    }
}

//function to run every 10 milliseconds
setInterval(doAnimation, 10);

//account for the user changing the browser's size
//new width/height can be set to calculate possible snowflake positions
window.onresize = function(event) {
    width = getWidth();
    height = getHeight();
  }
}

$(document).ready(ready);
$(document).on('page:load', ready);
