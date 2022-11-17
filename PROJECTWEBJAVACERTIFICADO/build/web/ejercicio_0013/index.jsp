<%-- 
    Document   : index
    Created on : 08-oct-2022, 23:37:37
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>005</title>
        <link href="estilo.css" rel="stylesheet" type="text/css">


    </head>
    <body bgcolor='#CCCC99'>
        <div class='div_titulo'>COMPONENTES DE UN FORMULARIO HTML</div><br/>

        <form action='procesar.jsp' target="_blank">
            <p class='p-subtitulo1'>01. INPUT TYPE='TEXT'</p>
            <p class='p-subtitulo2'>INGRESE SU NOMBRE: <input type="text" name="txtNombre" placeholder='Escriba aquí' required /></p>

            <p class='p-subtitulo1'>02. INPUT TYPE='PASSWORD'</p>
            <p class='p-subtitulo2'>INGRESE SU PASSWORD: <input type="password" name="txtPassword" placeholder='Escriba aquí' required /></p>

            <p class='p-subtitulo1'>03. INPUT TYPE='HIDDEN'</p>
            <p class='p-subtitulo2'>CAJA DE TEXTO OCULTO: <input type="hidden" name="txtOculto" value="Texto Oculto" /> </p> 

            <p class='p-subtitulo1'>04. INPUT TYPE='RADIO' (SELECCION SIMPLE)</p>
            <p class='p-subtitulo2'>CONTINENTE DONDE NACIO:</p>
            <p>
                <input type="radio" name="radContinente" value="América" required /> América
                <input type="radio" name="radContinente" value="Asia"/> Asia 
                <input type="radio" name="radContinente" value="Europa"/> Europa
                <input type="radio" name="radContinente" value="Oceanía"/> Oceanía
                <input type="radio" name="radContinente" value="Antartida"/> Antártida
            </p>

            <p class='p-subtitulo1'>05. INPUT TYPE'=CHECKBOX (SELECCION MULTIPLE)</p>
            <p class='p-subtitulo2'>A. CUALES SON SUS JOBIS:</p>
            <p>
                <input type="checkbox" name="chkJobi" value="Ajedrez" /> Ajedrez
                <input type="checkbox" name="chkJobi" value="Lectura"/> Lectura 
                <input type="checkbox" name="chkJobi" value="Paseo"/> Paseo
                <input type="checkbox" name="chkJobi" value="Película"/> Película 
                <input type="checkbox" name="chkJobi" value="Futbol"/> Futbol
            </p>

            <p class='p-subtitulo2'>B. AUTORIZACION:</p>
            <p>
                <input type="checkbox" name="chkAceptar" />Autoriza acceder a sus datos personales
            </p>

            <p class='p-subtitulo1'>06. SELECT-OPTION (LISTA DESPLEGABLE DE SELECCION SIMPLE)</p>
            <p class='p-subtitulo2'>CODIGO DE PAIS:
            <p>
                <select name="cboCodigoPais" size="1">
                    <option value="CL">Chile</option>  
                    <option value="PE">Perú</option> 
                    <option value="ES">España</option> 
                    <option value="MX">Mexico</option> 
                    <option value="UK">Inglaterra</option> 
                </select>
            </p>

            <p class='p-subtitulo1'>07. SELECT-OPTION (LISTA DESPLEGABLE DE SELECCION MULTIPLE)</p>

            <p class='p-subtitulo2'>SELECCIONE ANIMALES QUE LE GUSTARÍA TENER:</p>
            <p>
                <select name="lstMascota" multiple="true" size="4">
                    <a href="procesar.jsp"></a>
                    <option value="Gato">Gato</option>
                    <option value="Perro">Perro</option>
                    <option value="Cobaya">Cobaya</option>
                    <option value="Hamster">Hamster</option>
                    <option value="Cerdo">Cerdo</option>
                    <option value="Loro">Loro</option>
                    <option value="Rata">Rata</option>
                    <option value="Tortuga">Tortuga</option>
                </select>
            </p>

            <p class='p-subtitulo1'>08. INPUT TYPE='RANGE'</p>

            <p class='p-subtitulo2'>A. SELECCIONE UN COLOR EN DECIMAL 0...255:</p>            

            <div>  
                <div>
                    <p id="cajaNumero1">128</p>
                </div>
                <span>
                    <input type="range" id="ranColor1" name="ranColor1" value="128" min="0" max="255" step="1" /> 
                </span>
            </div>

            <p class='p-subtitulo2'>B. SELECCIONE UN COLOR EN DECIMAL 0...255:</p>            

            <div>  
                <div>
                    <input style='text-align: center;' id="cajaNumero2" name='txtNumero2' value='128' size='1'/>
                </div>
                <span>
                    <input type="range" id="ranColor2" name="ranColor2" value="128" min="0" max="255" step="1" /> 
                </span>
            </div>

            <p class='p-subtitulo2'>C. SELECCIONE UN COLOR EN DECIMAL 0...255:</p>            

            <div>  
                <div>
                    <input style='text-align: center;' id="cajaNumero3" name='txtNumero3' value='128' size='1'/>
                </div>

                <p id="cajaNumero3">
                    <span id='inicio'>0</span>
                    <input type='range' id='ranColor3' name='ranColor3' value='128' min="0" max='255' step='1' /> 
                    <span id='fin'>128</span>
                </p>
                </span>
            </div>

            <p class='p-subtitulo2'>D. NIVEL ACTUAL DE CAFEINA EN SANGRE:</p>  
            <p>
                <input type="range" name="ranCafeina" list="listNivelesCafeina">  
            </p>
            <datalist id="listNivelesCafeina">
                <option value="0" value="Alerta!">
                <option value="50" value="Bajo">
                <option value="100" value="Normal">
            </datalist>

            <p class='p-subtitulo2'>E. SELECCIONES UN NÚMERO ENTRE 0...100:</p> 
            <p>
                <input type="range" name='ranNumero' value="0" min="0" max="100" list="listNumeros" />
            </p> 
            <datalist id="listNumeros">
                <option>10</option>
                <option>15</option>
                <option>30</option>
                <option>50</option>
                <option>90</option>
            </datalist>

            <p class='p-subtitulo1'>09. INPUT TYPE='NUMBER'</p>
            <p class='p-subtitulo2'>A. INDIQUE SU EDAD:</p>
            <p>
                <input style='text-align: center; width : 100px' type="number" name='numEdad' value='40' min='0' max='120' step='1' />
            </p>

            <p class='p-subtitulo2'>B. SELECCIONE UN NÚMERO ENTERO (- 0 +):</p>
            <p>
                <input style='text-align: center; width : 100px' type='number' name='numNumeroEntero' value='0' step='1' /> 
            </p>

            <p class='p-subtitulo2'>C. SELECCIONE UN NÚMERO REAL:</p>
            <p>
                <input style='text-align: center; width : 100px' type="number" name="numNumeroReal" value='0' step="0.001"> 
            </p>

            <p class='p-subtitulo2'>D. LIMONES USADOS PARA EL JUGO:</p>
            <p>
                <input style='text-align: center; width : 100px' type="number" name="numLimonesUsados" min="1" max="5" step="0.5" value='1'>
            </p>

            <p class='p-subtitulo1'>10. TEXTAREA</p>
            <p class='p-subtitulo2'>COMENTARIO:</p>
            <p>
                <textarea name="txaComentario" rows="10" cols="40">Escribe aquí tus comentarios</textarea>
            </p>

            <p class='p-subtitulo1'>11. INPUT TYPE='FILE' (SELECCIONAR UN ARCHIVO)</p>
            <p class='p-subtitulo2'>ADJUNTAR FICHERO:</p>
            <p>
                <input type="file" name="filAdjuntar" />
            </p>  
            
            <p class='p-subtitulo1'>12. INPUT TYPE='IMAGE' (ENVIAR EL FORMULARIO)</p>
            <p class='p-subtitulo2'>ADJUNTAR FICHERO:</p>
            <p>
                <input type="image" name="imaEnviar" src="descarga.jfif"  />
            </p>              

            <p class='p-subtitulo1'>13. INPUT TYPE='SUBMIT' (ENVIAR EL FORMULARIO</p>
            <p>Enviar: <input type='submit' name='subEnviar' value='Enviar' />

            <p class='p-subtitulo1'>14. INPUT TYPE='RESET' (RESETEAR EL FORMULARIO</p>
            <p>Enviar: <input type='reset' name='resResetear' value='Resetear' />                
        </form>


        <script>
            let ranColor1 = document.getElementById('ranColor1');
            let cajaNumero1 = document.getElementById('cajaNumero1')
            ranColor1.addEventListener('input', mostrar);
            function mostrar() {
                cajaNumero1.innerHTML = ranColor1.value;
            }
        </script>

        <script>
            let ranColor2 = document.getElementById('ranColor2');
            let cajaNumero2 = document.getElementById('cajaNumero2')
            ranColor2.addEventListener('input', mostrar);
            function mostrar() {
                cajaNumero2.value = ranColor2.value;
            }
        </script>

        <script>
            let inicio = document.getElementById('inicio')
            let fin = document.getElementById('fin')

            let ranColor3 = document.getElementById('ranColor3');
            let cajaNumero3 = document.getElementById('cajaNumero3')

            inicio.innerHTML = ranColor3.min;
            fin.innerHTML = ranColor3.max;

            ranColor3.addEventListener('input', mostrar);
            function mostrar() {
                cajaNumero3.value = ranColor3.value;
            }
        </script>
    </body>
</html>


