iv = "YZTd6tSThz8%3D"
auth = "YmRtaW5pc3RyYXRvci0tgrKQIf4IftU%3D"

require 'uri'
require 'base64'

decoded_iv = Base64.decode64("YZTd6tSThz8=")
decoded_auth = Base64.decode64("YmRtaW5pc3RyYXRvci0tgrKQIf4IftU=")

decoded_iv[0]=('a'.ord^'b'.ord^decoded_iv[0].ord).chr
decoded_auth[0]='a'

new_iv = Base64.strict_encode64(decoded_iv)
new_auth = Base64.strict_encode64(decoded_auth)

puts new_iv
puts new_auth
