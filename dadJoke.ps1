Function Get-DadJoke {
     Invoke-WebRequest -Uri "https://icanhazdadjoke.com" -Headers @{accept="application/json"} | Select-Object -ExpandProperty Content | ConvertFrom-Json | Select-Object -ExpandProperty Joke
}
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

$joke = Get-DadJoke
Write-host "joke: " $joke
$speak.Speak($joke)

