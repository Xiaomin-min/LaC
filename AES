# Importa las librerías necesarias para cifrado
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from os import urandom

# Función para generar clave y vector de inicialización
def generar_clave_y_iv():
    # Genera una clave aleatoria de 32 bytes (256 bits) para AES-256
    key = urandom(32)
    # Genera un vector de inicialización aleatorio de 16 bytes (128 bits)
    iv = urandom(16)
    # Retorna ambos valores para usarlos en el cifrado
    return key, iv

# Función para encriptar texto plano
def encriptar(texto_plano, key, iv):
    # Crea un objeto Cipher con algoritmo AES en modo CBC
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    # Crea un encriptador a partir del objeto Cipher
    encryptor = cipher.encryptor()
    
    # Convierte el texto de string a bytes usando UTF-8
    texto_plano_bytes = texto_plano.encode('utf-8')
    
    # Calcula cuántos bytes de padding se necesitan para múltiplo de 16
    padding_length = 16 - (len(texto_plano_bytes) % 16)
    # Si ya es múltiplo de 16, añade un bloque completo de padding
    if padding_length == 0:
        padding_length = 16
    
    # Crea el padding: bytes repetidos con el valor de la longitud
    pading = bytes([padding_length] * padding_length)
    
    # Añade el padding al texto original
    texto_a_cifrar = texto_plano_bytes + pading
    
    # Encripta el texto y retorna el resultado
    texto_cifrado = encryptor.update(texto_a_cifrar) + encryptor.finalize()
    return texto_cifrado

# Función para desencriptar texto cifrado
def desencriptar(texto_cifrado, key, iv):
    # Crea un objeto Cipher con algoritmo AES en modo CBC
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    # Crea un desencriptador a partir del objeto Cipher
    decryptor = cipher.decryptor()
    
    # Desencripta el texto cifrado (aún tiene padding)
    texto_desencriptado_con_padding = decryptor.update(texto_cifrado) + decryptor.finalize()
    
    # Obtiene la longitud del padding del último byte
    padding_length = texto_desencriptado_con_padding[-1]
    
    # Remueve el padding del final del texto
    texto_desencriptado = texto_desencriptado_con_padding[:-padding_length]
    
    # Convierte los bytes de vuelta a string y retorna
    return texto_desencriptado.decode('utf-8')

# Ejemplo de uso del código
# Genera una nueva clave y IV para el cifrado
key, iv = generar_clave_y_iv()

# Texto que queremos encriptar
texto_original = "Daniela"

# Encripta el texto original
texto_encriptado = encriptar(texto_original, key, iv)
print(f"Texto encriptado (bytes): {texto_encriptado}")

# Desencripta el texto cifrado
texto_desencriptado = desencriptar(texto_encriptado, key, iv)
print(f"Texto desencriptado: {texto_desencriptado}")
