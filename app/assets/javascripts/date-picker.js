document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    console.log(elems);
    var instances = M.Datepicker.init(elems, {firstDay: 1, showClearBtn: true, autoClose: true, format: 'ddd dd mmm, yyyy'});

    // instances.open();
  });
