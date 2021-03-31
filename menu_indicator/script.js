let list = document.querySelectorAll(".list");

for (let i = 0; i < list.length; i++) {
  list[i].onmouseover = () => {
    let j = 0;
    while (j < list.length) {
      list[j++].className = "list";
    }
    list[i].className = "list active"
  }

}