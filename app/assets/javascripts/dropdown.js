var bell = document.querySelector('.dropdown-trigger')
if (bell) {
  bell.addEventListener('click', function() {
    var elems = document.querySelector('.dropdown-trigger');
    var instances = M.Modal.init(elems, {});
  });
}




document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.dropdown-trigger');
  var instances = M.Dropdown.init(elems, {});
});
