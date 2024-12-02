# määrame, kus on asumas fail, mille sees on kasutajate andmed
$Fail = "C:\Users\Markus\kasutajate_loomine\kasutajad.csv"

# loeme failist sisu, info jaotatakse ";" järgi
$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"

#Failis iga kasutaja andmestik on eraldi reas
# Vaatame faili sisu ridade kaupa
# selleks salvestame iga rida $kasutaja muutuja sisse
foreach ($kasutaja in $Kasutajad)
{
    #kuna reas on mitu väärtust, siis iga element on kätte saadav veeru
    #nimetuse järgi, mis me paneme $muutuja.VeeruNimetus kujul kirja
    $Kasutajanimi = $kasutaja.Kasutajanimi
    $Taisnimi = $kasutaja.Taisnimi
    $KontoKirjeldus = $kasutaja.KontoKirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    
    #kasutades saadud info lisame kasutaja
    New-LocalUser -Name $Kasutajanimi -Password $Parool -FullName "$Taisnimi" -Description "$KontoKirjeldus"

}