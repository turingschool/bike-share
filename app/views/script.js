var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onmouseover = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxWidth){
      panel.style.maxWidth = null;
    } else {
      panel.style.maxWidth = panel.scrollWidth + "px";
    } 
  }
}