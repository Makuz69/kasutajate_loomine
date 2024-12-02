# Kasutaja sisestab ees- ja perenime
$firstName = Read-Host "Sisesta oma eesnimi"
$lastName = Read-Host "Sisesta oma perenimi"

# Kontonime loob ees- ja perenime ja vahele paneb punkti
$username = $firstname.ToLower() + "." + $lastname.ToLower()

Write-Host 'Kustutatav kasutaja on:' $username

# Proovib kustutada kasutaja
try {
    # Möödub erroritest -ErrorAction SilentlyContinue
    Remove-LocalUser -Name $username -ErrorAction Stop
    
    # Kui kõik läks hästi, siis tuleb teade
    Write-Host "Kasutaja $username on edukalt kustutatud."
} catch {
    # Kui peaks tulema mingi error, siis tuleb veateade
    Write-Host "Tekkinud probleem $username kustutamisega. Veateade: $_"
}
