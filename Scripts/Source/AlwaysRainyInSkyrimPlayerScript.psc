Scriptname AlwaysRainyInSkyrimPlayerScript extends ReferenceAlias  

int rainyWeather1  = 0xd4886
int rainyWeather2  = 0xc821f
int rainyWeather3  = 0x10a23d
int rainyWeather4  = 0x10a231
int rainyWeather5  = 0x10a238
int rainyWeather6  = 0x10a242
int rainyWeather7  = 0x10a7a6
int rainyWeather8  = 0xc8220
int rainyWeather9  = 0x10a23c
int rainyWeather10 = 0x10a241

int[] RainyWeathers

Event OnInit()
    Setup()
EndEvent

Event OnPlayerLoadGame()
    Setup()
EndEvent

Function Setup()
    SetupRainyWeathersArray()
    MakeItRain(rainNow = true)
    int minute = 60
    RegisterForUpdate(300)
EndFunction

Function SetupRainyWeathersArray()
    RainyWeathers = new int[10]
    RainyWeathers[0] = rainyWeather1
    RainyWeathers[1] = rainyWeather2
    RainyWeathers[2] = rainyWeather3
    RainyWeathers[3] = rainyWeather4
    RainyWeathers[4] = rainyWeather5
    RainyWeathers[5] = rainyWeather6
    RainyWeathers[6] = rainyWeather7
    RainyWeathers[7] = rainyWeather8
    RainyWeathers[8] = rainyWeather9
    RainyWeathers[9] = rainyWeather10
EndFunction

Weather Function MakeItRain(bool rainNow = false)
    int randomWeatherIndex = Utility.RandomInt(0, RainyWeathers.Length - 1)
    int rainyWeatherID = RainyWeathers[randomWeatherIndex]
    Weather rainyWeather = Game.GetForm(rainyWeatherID) as Weather
    if rainNow
        rainyWeather.ForceActive(abOverride = true)
    else
        rainyWeather.SetActive(abOverride = true)
    endIf
    return rainyWeather
EndFunction

Event OnUpdate()
    MakeItRain()
EndEvent