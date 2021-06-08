console.log("Custom scripts are working")

// Dropdown Function

function hideNav(element) {
    console.log("Hid Nav is working")
    switch (element.style.visibility) {
        case "visible":
            element.style.visibility = "hidden";
            break;
        case "hidden":
            element.style.visibility = "visible";
            break;
        default:
            console.log(element.style.visibility);
    }
}

// Nav Profile Dropdown

let navDropdown = document.getElementById("nav-profile-dropdown");
console.log(navDropdown)


if(navDropdown) {
    navDropdown.style.visibility = "hidden";
    document.getElementById("nav-profile").addEventListener("click", () => {
        hideNav(navDropdown);
    });
}