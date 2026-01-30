# PowerShell Skript für parallele AD-Struktur
$standorte = "Berlin", "Muenchen", "Hamburg"
$abteilungen = "IT", "HR", "Finance", "Vertrieb", "Produktion", "Archiv"
$gruppenSub = "Distribution", "Security", "Administration"

# Erstellung der Standorte
foreach ($ort in $standorte) {
    New-ADOrganizationalUnit -Name $ort -Path "DC=lilarosa,DC=local"
    foreach ($abt in $abteilungen) {
        New-ADOrganizationalUnit -Name $abt -Path "OU=$ort,DC=lilarosa,DC=local"
    }
}

# Erstellung der Gruppen-OU
New-ADOrganizationalUnit -Name "Gruppen" -Path "DC=lilarosa,DC=local"
foreach ($sub in $gruppenSub) {
    New-ADOrganizationalUnit -Name $sub -Path "OU=Gruppen,DC=lilarosa,DC=local"
}
