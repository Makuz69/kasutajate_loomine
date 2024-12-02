# Kasutaja saab sisestada oma ees- ja perenime
$firstname = Read-Host 'Enter your firstname'
$lastname = Read-Host 'Enter your lastname'

# Kontonime lisab ees- ja perenime väikeste tähtedega ja keskel on "."
$username = $firstname.ToLower() + "." + $lastname.ToLower()
# Lisame parooli automaatselt 
$userPassword = ConvertTo-SecureString 'Parool1!' -AsPlainText -Force
# Konto täisnime lisab ees- ja perenimi, mille vahel on tühik
$fullname = $firstname + " " + $lastname
# Lisame automaatse konto kirjelduse
$description = "Local Account"

Write-Host 'Creating new user:' $username

$userExists = Get-LocalUser $username -ErrorAction SilentlyContinue

if([bool]$userExists){
    Write-Host 'Problem to create user - user already exists'
    Exit
} else {
    New-LocalUser $username -Password $userPassword -FullName $fullname -Description $description
}