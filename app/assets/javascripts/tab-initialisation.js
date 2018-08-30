document.addEventListener('DOMContentLoaded', function() {
  var el = document.querySelector('.tabs');
  var instance = M.Tabs.init(el, {
    swipeable: false
  });
});

document.getElementById("open-modal-new").addEventListener('click', function() {
  var elems = document.querySelector('.modal');
  var instances = M.Modal.init(elems, {});
  instances.open();
});
