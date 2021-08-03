Scriptname AlwaysRainyInSkyrimEffectScript extends activemagiceffect  

AlwaysRainyInSkyrimPlayerScript property PlayerScript auto

Event OnEffectStart(Actor target, Actor caster)
    Weather rainyWeather = PlayerScript.MakeItRain(rainNow = true)
    Debug.Notification("Set current weather to: " + rainyWeather.GetFormID())
EndEvent