async function fetchHtmlAsText(url) {
  return await (await fetch(url)).text();
}

// this is your `load_home() function`
async function loadHome() {
  const contentDiv = document.getElementById("header-placeholder");
  contentDiv.innerHTML = await fetchHtmlAsText("header.html");
}


(function () {
  loadHome();
})();