document.addEventListener('DOMContentLoaded', function() {
  var el = document.querySelector('.tabs');
  var instance = M.Tabs.init(el, {
    swipeable: false
  });
});

const modalNew = document.getElementById("open-modal-new")
if (modalNew) {
  modalNew.addEventListener('click', function() {
    var elems = document.querySelector('.modal');
    var instances = M.Modal.init(elems, {});
    instances.open();
  });
}
