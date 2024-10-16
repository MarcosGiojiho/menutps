const abrirMenu = () => {
    document.querySelector('.menu').style.display = 'block'; 
}

const enviarA = (e) => {
    fetch(`https://${GetParentResourceName()}/tp`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({ location: e.target.id })
    }).then(() => cerrarMenu());
}

const cerrarMenu = () => {
    document.querySelector('.menu').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/cerrarMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        }
    });
}

window.addEventListener('message', function(event) {
    if (event.data.action === 'abrirMenu') {
        abrirMenu()
    }
});

document.querySelectorAll("button.button").forEach(boton => boton.addEventListener('click', enviarA))
document.querySelector("#cerrar").addEventListener('click', cerrarMenu)