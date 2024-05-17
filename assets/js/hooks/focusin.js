function removeClass() {
    console.log("removing class");
    document.getElementById("the_photo").classList.remove("blur_in");
}

const FocusInHook = {
    mounted() {
        console.log("mounted");
        setTimeout(removeClass, 500);
    },
    updated() {
        console.log("updated...");
        setTimeout(removeClass, 500);
    }
}

export default FocusInHook;
