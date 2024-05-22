let hamMenuIcon = document.getElementById("ham-menu");
let navBar = document.getElementById("navbarSupportedContent");
let navLinks = navBar.querySelectorAll(".nav-link");

hamMenuIcon.addEventListener("click", () => {
  navBar.classList.toggle("active");
  hamMenuIcon.classList.toggle("fa-times");
});

navLinks.forEach((navLink) => {
  navLink.addEventListener("click", () => {
    navBar.classList.remove("active");
    hamMenuIcon.classList.remove("fa-times");
  });
});
