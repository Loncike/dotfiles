import requests
import json

with open("icons.json", "r") as f:
    icons = json.load(f)

r = requests.get("https://api.open-meteo.com/v1/forecast?latitude=46.870574094674296&longitude=16.824296167753666&current=temperature_2m,apparent_temperature,rain,weather_code,is_day")
if r.status_code == 200:
    data = r.json()
else:
    print("something went wrong")

isDay = data["current"]["is_day"]
tempI = data["current"]["temperature_2m"]
temp = str(data["current"]["temperature_2m"]) + data["current_units"]["apparent_temperature"]
weatherCode = data["current"]["weather_code"]

out = temp + " "
    
if weatherCode <= 2:
    if isDay == 1:
        out += (icons["sunny"]["day"])
    else:
        out += (icons["sunny"]["night"])
elif weatherCode <= 20:
    if isDay == 1:
        out += (icons["cloudy"]["day"])
    else:
        out += (icons["cloudy"]["night"])        
elif weatherCode <= 29:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["rain"])
    pass #Esés (hó, eső) látás viszonokat nem zavar
elif weatherCode <= 39:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["fog"])
    pass # ho/homok vihar. sza látási viszonok
elif weatherCode <= 49:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["fog"])
    pass #köd
elif weatherCode <= 59:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["rain"])
    pass # szitálás
elif weatherCode <= 69:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["rain"])
    pass # átlag esés
elif weatherCode <= 79:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["rain"])
    pass # erős esés nem szakad
elif weatherCode <= 99:
    if isDay == 1:
        out += " "
    else:
        out += " "
    out += (icons["storm"])
    pass # szakadás

print(out)