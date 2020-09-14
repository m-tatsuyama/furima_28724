function price () {
  const input = document.getElementById('item-price');
  const log = document.getElementById('add-tax-price');
  const log2 = document.getElementById('profit');

  input.addEventListener('input', updateValue);

  function updateValue(e) {
    log.textContent = e.target.value*0.1;
    log2.textContent = (e.target.value)-(e.target.value*0.1);
  }
} window.addEventListener("load", price);