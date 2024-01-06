
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
    letras = "abcdefghijklmnñopqrstuvwxyz ";
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
    var key = e.keyCode || e.which;
    var tecla = String.fromCharCode(key);
    var regex = /^[0-9a-zA-Z\s]+$/;  // Expresión regular que permite letras y números

    if (!regex.test(tecla)) {
        e.preventDefault();  // Evita que se ingrese la tecla no permitida
    }
}

function confirma() {
    uno = document.getElementById("contra").value;
    dos = document.getElementById("confircontra").value;
    if (dos !== uno) {
        alert("La contraseña no esta coincidiendo");
    }

}


function enviar(){

    nombre = document.getElementById("nameUser").value;
    apat = document.getElementById("lastNameUser").value;
//    amat = document.getElementById("amat").value;
    edad = document.getElementById("ageUser").value;
//    genero= document.getElementsByName("genero").value;
//    fecha_nac= document.getElementById("fecha_nac").value;
//    nom_usu = document.getElementById("nom_usu").value;
    contra = document.getElementById("passwordUser").value;
    confircontra = document.getElementById("confirmPasswordUser").value;
    correo = document.getElementById("emailUser").value;

    if (contra===confircontra) {
        if (nombre !== "" && apat !== ""  && edad !== "" &&  contra !== "" && confircontra !== "" && correo !== "") {
            console.log('SI se envia');
            return true;
            
            
        }else {
            alert("Los datos no cuncuerdan con el formato requerido");
            return false;
        }
    }else{
        alert("La contraseña no esta coincidiendo");
        return false;
    }


}












 