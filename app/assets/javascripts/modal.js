document.getElementById("open-modal-new").addEventListener('click', function() {
  var elems = document.querySelector('.modal');
  var instances = M.Modal.init(elems, {});
  instances.open();
});
