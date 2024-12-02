$KasutajaParool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

New-LocalUser "kasutaja2" -Password $KasutajaParool -FullName "Esimene Kasutaja" -Description "Local Account - kasutaja2"