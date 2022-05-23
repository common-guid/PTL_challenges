import OpenSSL
import base64
import json
import hashlib
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding

key = OpenSSL.crypto.PKey()
key.generate_key(type=OpenSSL.crypto.TYPE_RSA, bits=2048)
priv = key.to_cryptography_key()
pub = priv.public_key()

header = {
      "alg": "RS256",
      "jwk": {
        "kty": "RSA",
        "kid": "bilbo.baggins@hobbiton.example",
        "use": "sig"
      }
 }
e = pub.public_numbers().e
n = pub.public_numbers().n

header["jwk"]["e"] = base64.urlsafe_b64encode((e).to_bytes((e).bit_length()//8+1, byteorder='big')).decode('utf8').rstrip("=")
header["jwk"]["n"] = base64.urlsafe_b64encode((n).to_bytes((n).bit_length()//8+1, byteorder='big')).decode('utf8').rstrip("=")

payload = "YWRtaW4"

str = base64.urlsafe_b64encode(bytes(json.dumps(header), encoding='utf8')).decode('utf8').rstrip("=")+"."+payload

sig = priv.sign(bytes(str, encoding='utf8'), algorithm=hashes.SHA256(), padding=padding.PKCS1v15())

print(str+"."+base64.urlsafe_b64encode(sig).decode('utf8').rstrip("="))
