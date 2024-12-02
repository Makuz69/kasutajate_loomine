# defineerime vajaliku käsurea parameetrid

param(
$Kasutajanimi,
$TaisNimi,
$KontoKirjeldus
)

# Loome kasutajale parooli 
$KasutajaParool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

# Lisame kasutaja vastavate andmetega
New-LocalUser "$Kasutajanimi" -Password $KasutajaParool -FullName "$TaisNimi" -Description "$KontoKirjeldus"