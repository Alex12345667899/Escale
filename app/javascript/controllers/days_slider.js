document.querySelectorAll('input[type=range]').forEach((input) => {
  input.addEventListener('input', function rangeChange() {
    this.setAttribute('value', this.value);
  });
})
