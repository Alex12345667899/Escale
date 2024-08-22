const prevScrollpos = window.scrollY;
window.onscroll = function() {
  const currentScrollPos = window.scrollY;
  if (prevScrollpos > currentScrollPos) {
    document.getElementsByClassName("navbar d-flex justify-content-between align-items-center").style.top = "0";
  } else {
    document.getElementById("navbar d-flex justify-content-between align-items-center").style.top = "-50px";
  }
  prevScrollpos = currentScrollPos;
}
