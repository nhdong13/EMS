function searchTbl(num, page) {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById('searchBox-' + page);
  filter = input.value.toUpperCase();
  table = document.getElementById('dataTbl-' + page);
  tr = table.getElementsByTagName('tr');
  for (i = 0; i < tr.length; i++) {
    for (j = 1; j <= num; j++){  
      td = tr[i].getElementsByTagName('td')[j];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = '';
          break;
        } else {
          tr[i].style.display = 'none';
        }
      }
    }       
  }
}
