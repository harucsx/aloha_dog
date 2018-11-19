// sitemap
var sitemap = document.getElementById('Mysitemap');
// Get the button that opens the sitemap
var sitemapbtn = document.getElementById("sitemapBtn");
// Get the <span> element that closes the sitemap
var span = document.getElementsByClassName("close")[0];
// When the user clicks the button, open the sitemap 
sitemapbtn.onclick = function() {
    sitemap.style.display = "block";
}
// When the user clicks on <span> (x), close the sitemap
span.onclick = function() {
    sitemap.style.display = "none";
}