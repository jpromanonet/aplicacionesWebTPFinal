<?php
defined('BASEPATH') or exit('No se permite acceso directo');
session_start();

/**Flash Mensaje Helper
 * Ejemplo flash('mensaje_usuario','Te has Registrado')
 * Para Mostrar en la Vista - <?php echo flash('mensaje_usuario'); ?>
 * @param string $name nombre del mensaje
 * @param string $message mensaje a mostrar
 * @param string $class clase del alert usando bootstrap por 
 **/
function flash($name = null, $message = null, $class = 'success')
{
    /** Entramos Solo si el Nombre No esta vacío es decir que
     * se le esta pasando parámetros.
     */
    if (!empty($name)) {
        /** Comprobamos si el mensaje No esta vacío es decir que le estamos
         * pasando parámetros ya sesión con ese nombre esta vaciá
         * si asi entramos y creamos el mensaje caso contrario estamos queriendo
         * mostrar un mensaje y lo mostramos y limpiamos las sesiones.
         **/
        if (!empty($message) && empty($_SESSION[$name])) {
            /**Si la sesión con ese nombre mo esta vacía la limpiamos */
            if (!empty($_SESSION[$name])) {
                unset($_SESSION[$name]);
            }
            /**Si la sesión con ese nombre mo esta vacía la limpiamos */
            if (!empty($_SESSION[$name . '_class'])) {
                unset($_SESSION[$name . '_class']);
            }
            /**Creamos y Guardamos el mensaje en la
             * sesión con el nombre pasado por parámetros.
             **/
            $_SESSION[$name] = $message;
            /**Creamos y Guardamos en la sesión con el nombre
             * pasado por parámetros y le concatenamos _class para
             * la clase del mensaje.
             * */
            $_SESSION[$name . '_class'] = $class;
        } elseif (empty($message) && !empty($_SESSION[$name])) {
            /**Guardamos en $class "$name . '_class'" cuando es no esta vaciá la 
             * sesión "$name . '_class'" sino la dejamos vaciá.
             **/
            $class = !empty($_SESSION[$name . '_class']) ? $_SESSION[$name . '_class'] : '';
            /**Mostramos el mensaje con la clase por defecto o con 
             * la que se le pase por parámetros.
             **/
            echo '<div class="alert alert-' . $class . ' alert-dismissible fade show" id="msg-flash" role="alert">'
                . $_SESSION[$name] . '
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            </div>';
            /**Limpiamos todas la sesiones usadas */
            unset($_SESSION[$name]);
            unset($_SESSION[$name . '_class']);
        }
    }
}
/**Comprueba si el usuario esta logueado
 *@param no necesita
 *@return bolean True si esta logueado False sino lo esta
 */
function isLoggedIn()
{
    if (isset($_SESSION['user_id']) && isset($_SESSION['user_name']) && isset($_SESSION['user_email'])) {
        return true;
    } else {
        return false;
    }
}
/**
 * Genera un INPUT con Token para evitar los ataques CSRF
 *
 * @return $token 
 */
function generateInputCsrf()
{
    echo "<input type='hidden' name='csrf_token' value='" . getCsrf() . "'>";
}
/**
 * Genera un Token para evitar los ataques CSRF
 *
 * @return $csrfToken 
 */
function generateCsrf()
{
    if (empty($_POST)) {
        $csrfToken = bin2hex(random_bytes(16));
        $_SESSION[CSRF_TOKEN_NAME] = $csrfToken;
        $_SESSION["csrf_token_expire"] = time() + intval(CSRF_TOKEN_EXPIRE);
        return $csrfToken;
    }
}
/**
 * Comprueba si exite un csrfToken si eciste
 * Retorna el csrfToken caso contrario lo genera
 * Mantener el identificador de "csrf_token" al enviar por ajax.
 *
 * @return $csrfToken 
 */
function getCsrf()
{
    /**Verificamos si hay un token para la sesión actual. sino lo hay lo generamos,
     * caso contrario seteamos el valor actual del token en $token.
     */
    if (isset($_SESSION[CSRF_TOKEN_NAME])) {
        $csrfToken = $_SESSION[CSRF_TOKEN_NAME];
    } else {
        $csrfToken = generateCsrf();
    }
    return $csrfToken;
}
/**
 * Valida el token que pasemos contra la sesión csrf_token
 * para evitar los ataques con Cross-site request forgery o 
 * falsificación de petición en sitios cruzados.
 * Se puede agrear la validacion para el metodo GET
 *
 * @param [string] $token token a validar
 * @return boolean 
 */
function verifyCsrf()
{
    $request = $_SERVER["REQUEST_METHOD"];
    $methods = ["POST" => $_POST];
    $verify = false;
    if(!empty($methods[$request])){
        if (!isset($methods[$request][CSRF_TOKEN_NAME])) {
            $verify = true;
        }
        if ($_SESSION["csrf_token_expire"] < time()) {
            if ($methods[$request][CSRF_TOKEN_NAME] !== $_SESSION[CSRF_TOKEN_NAME]) {
                $verify = true;
            }
        }
    }
    return $verify;
}
