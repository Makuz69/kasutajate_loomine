# Kasutaja sisestab ees- ja perenime
$firstName = Read-Host "Enter your fistname"
$lastName = Read-Host "Enter your lastname"

# Kontonime loob ees- ja perenime ja vahele paneb punkti
$username = $firstname.ToLower() + "." + $lastname.ToLower()

# Proovib kustutada kasutaja
try {
    # Möödub erroritest -ErrorAction SilentlyContinue
    Remove-LocalUser -Name $username -ErrorAction Stop
    
    # Kui kõik läks hästi, siis tuleb teade
    Write-Host "Kasutaja $username on edukalt kustutatud."
} catch {
    # Kui peaks tulema mingi error, siis tuleb veateade
    Write-Host "Kasutaja $username ei saanud kustutada. Veateade: $_"
}
