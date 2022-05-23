s = "qwertyuiopasdfghjklzxcvbnm123456789"

for item in s:
    h = int(item, 16)
    hh = hex(h)

print(hh + ".a." + "hackycorp.com")