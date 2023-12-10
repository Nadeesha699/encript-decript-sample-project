from flask import Flask, render_template, request
import mysql.connector
import hashlib
import random
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from cryptography.hazmat.primitives import hashes

#for password sdfrW!23 

app = Flask(__name__)

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="udata"
)
cursor = db.cursor()

@app.route('/')
def login():
    return render_template('Signup.html')

@app.route('/dashboard', methods=['POST'])
def dashboard():
    try:
        username = request.form['username']
        password = request.form['password']
        role = request.form['role']

        hashed_password = hashlib.sha512(password.encode('utf-8')).hexdigest()

        cursor.execute("INSERT INTO users (username, password, role) VALUES (%s, %s, %s)", (username, hashed_password, role))
        db.commit()

        cursor.execute('SELECT UID FROM users ORDER BY UID DESC LIMIT 1')
        UID =cursor.fetchone()
        global global_uid 
        global_uid = int(UID[0])

        return render_template('dashboard.html')
    except Exception as e:
        return f"An error occurred: {str(e)}"

@app.route('/encrypt', methods=['POST'])
def encrypt():
    try:
        message = request.form['original-message']
        role= request.form['role']
        #key exchange
        shared_secret = (public_key_DH ** private_key_DH) % a

        #Convert the shared secret to bytes
        shared_secret_bytes = shared_secret.to_bytes((shared_secret.bit_length() + 7) // 8, byteorder='big')

        encrypted_message = encrypt_with_shared_key(message.encode('utf-8'), shared_secret_bytes)

        cursor.execute('SELECT * FROM users WHERE role= %s AND UID= %s',(role,global_uid))
        valid = cursor.fetchone()
        
        if valid:
        
           cursor.execute('INSERT INTO message (sendMessage,UID) VALUES(%s,%s)',(encrypted_message,global_uid))
           db.commit()

           return render_template('dashboard.html',encrypted_message=encrypted_message)
        else:
           return render_template('dashboard.html',encrypted_message="no data send") 
    except Exception as e:
        return f"An error occurred: {str(e)}"

def encrypt_with_shared_key(message, key):
    #Derive a secure key from the shared secret using HKDF
    kdf = HKDF(
        algorithm=hashes.SHA256(),
        length=32,  
        salt=None,
        info=b'diffie-hellman-encryption',
        backend=default_backend()
    )
    derived_key = kdf.derive(key)

    #Generate a random nonce
    nonce = b'\x00' * 12  

    #Use AES in GCM mode for authenticated encryption
    cipher = Cipher(algorithms.AES(derived_key), modes.GCM(nonce), backend=default_backend())
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(message) + encryptor.finalize()

    #Get the authentication tag
    tag = encryptor.tag

    return ciphertext + tag

@app.route('/decrypt', methods=['POST'])
def decrypt():
    try:
        dusername = request.form['decryption-username']
        dpassword = request.form['decryption-password'].encode('utf-8')

        cursor.execute("SELECT password FROM users WHERE username=%s AND UID = %s", (dusername,global_uid))
        valid = cursor.fetchone()

        if valid and valid[0] == hashlib.sha512(dpassword).hexdigest():
            #key exchange
            shared_secret = (public_key_DH ** private_key_DH) % a

            #Convert the shared secret to bytes
            shared_secret_bytes = shared_secret.to_bytes((shared_secret.bit_length() + 7) // 8, byteorder='big')

            
            cursor.execute('SELECT sendMessage FROM message WHERE UID=%s',(global_uid,))
            encrypted_message = cursor.fetchone()

            decrypted_message = decrypt_with_shared_key(encrypted_message[0], shared_secret_bytes)

            return render_template('dashboard.html', message=decrypted_message.decode())
        else:
            return render_template('dashboard.html', message="wrong user")
    except Exception as e:
        return f"An error occurred: {str(e)}"

def decrypt_with_shared_key(encrypted_data, key):
    #Derive a secure key from the shared secret using HKDF
    kdf = HKDF(
        algorithm=hashes.SHA256(),
        length=32,  
        salt=None,
        info=b'diffie-hellman-encryption',
        backend=default_backend()
    )
    derived_key = kdf.derive(key)

    #Split the data into ciphertext and tag
    ciphertext = encrypted_data[:-16]
    tag = encrypted_data[-16:]

    #Generate a random nonce (use same nonce like encryption :))
    nonce = b'\x00' * 12  

    #Use AES in GCM mode for authenticated decryption
    cipher = Cipher(algorithms.AES(derived_key), modes.GCM(nonce, tag), backend=default_backend())
    decryptor = cipher.decryptor()
    decrypted_message = decryptor.update(ciphertext) + decryptor.finalize()

    return decrypted_message


a = 23
b = 5  

#Generate a random private key 
private_key_DH = random.randint(1, a-1)

#Calculate the public key 
public_key_DH = (b ** private_key_DH) % a

if __name__ == '__main__':
    app.run(debug=True)
