require 'oauth2'

callback = "http://34.118.32.95"
app_id = "d6e5575308a3dc52b83e1d533b45edf0cea1afca541b432f9fb529d3d9191f2e"

secret = "a547e69a9b22b3a664f1aada5af292b24234f9f41a5aca1ba65e1ca4bb7e6df3"
client = OAuth2::Client.new(app_id, secret, site: "http://authorization-ptl-df6521cb-867e48b1.libcurl.so")
puts client.auth_code.authorize_url(redirect_uri: callback)
exit

code="[CODE]"
access = client.auth_code.get_token( code, redirect_uri: callback)
access.get("/api/user").parsed

puts access.token 
