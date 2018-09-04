document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init
    (elems, {firstDay: 1, showClearBtn: true, autoClose: true, format: 'ddd dd mmm, yyyy', minDate: 0});
  });

