
function solonumeros(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    letras = "1234567890";
    especiales = "8-37-38-46-164";
    tecladoespecial = false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecladoespecial = true;
            break;
        }
    }
    if (letras.indexOf(teclado) === -1 && !tecladoespecial) {
        return false;
    }
}

function sololetras(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key).toLowerCase();
    letras = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnñopqrstuvwxyz ";
    especiales = "8-37-38-46-164";
    tecladoespecial = false;
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecladoespecial = true;
            break;
        }
    }
    if (letras.indexOf(teclado) == -1 && !tecladoespecial) {
        return false;
    }
}

//function sololetrasynumeros(e) {
//    key = e.keyCode || e.which;
//    teclado = String.fromCharCode(key).toLowerCase();
//    letras = "abcdefghijklmnñopqrstuvwxyz ";
//    numeros = "0123456789";
//    especiales = "8-37-38-46-164";
//    if (letras.indexOf(teclado) === -1 && numeros.indexOf(teclado) === -1) {
//        return false;
//    }    
//    return true;
//}
function soloLetrasYNumeros(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key).toLowerCase();
    letras = "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijklmnñopqrstuvwxyz ";
    
    numeros = "0123456789";
    especiales = "8-37-38-46-164";
    tecladoespecial = false;
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecladoespecial = true;
            break;
        }
    }
    if (letras.indexOf(teclado) === -1 && !tecladoespecial && numeros.indexOf(teclado) === -1) {
        return false;
    }

}

function confirma() {
    uno = document.getElementById("contra").value;
    dos = document.getElementById("confircontra").value;
    if (dos !== uno) {
        alert("La contraseña no esta coincidiendo");
    }

}


function enviar() {
    nombre = document.getElementById("nameUser").value;
    correo = document.getElementById("emailUser").value;
    apat = document.getElementById("lastNameUser").value;
    phone = document.getElementById("phoneUser").value;
    contra = document.getElementById("passwordUser").value;
    confircontra = document.getElementById("confirmPasswordUser").value;
    edad = document.getElementById("ageUser").value;



    if (contra === confircontra) {
        if (nombre !== "" && apat !== "" && edad !== "" && contra !== "" && confircontra !== "" && correo !== "" && phone != "") {
            console.log('Si se envia');
            return true;
        } else {
            alert("Faltan datos por rellenar");
            return false;
        }
    } else {
        alert("La contraseña no esta coincidiendo");
        return false;
    }


}












 