Function Get-DadJoke {
     Invoke-WebRequest -Uri "https://icanhazdadjoke.com" -Headers @{accept="application/json"} | Select-Object -ExpandProperty Content | ConvertFrom-Json | Select-Object -ExpandProperty Joke
}

Function Get-NextJoke {
     $joke = Get-DadJoke
     Write-host "joke: " $joke
     $speak.Speak($joke)
}

[parameter(Mandatory = $false)]
[int]$numberOfJokes=1

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

$count=0
do {
     Get-NextJoke
     $count++
} while ($count -lt $numberOfJokes)


