const TIMEOUT_MS = 400;

function addClass(id) {
    document.getElementById(id).classList.add("fade_in");
}

const removeClass = (id) => 
    () => {
        document.getElementById(id).classList.remove("fade_in");
    }

const FadeInHook = {
    mounted() {
        const id = this.el.id;
        addClass(id);
        setTimeout(removeClass(id), TIMEOUT_MS);
    },
    updated() {
        const id = this.el.id;
        addClass(id);
        setTimeout(removeClass(id), TIMEOUT_MS);
    }
}

export default FadeInHook;
