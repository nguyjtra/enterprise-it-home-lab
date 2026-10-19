<#
.SYNOPSIS
    Automated Active Directory Bulk User Provisioning Script.
.DESCRIPTION
    Reads user onboarding data from a CSV file and creates Active Directory accounts 
    in their respective Organizational Units (OUs) with pre-set security policies.
.ENVIRONMENT
    Windows Server 2022 / Active Directory Domain Services (cdcr.local)
#>

Import-Module ActiveDirectory

$csvPath = "C:\users.csv"
$users = Import-Csv -Path $csvPath

foreach ($U in $users) {
    # Convert plaintext password into SecureString
    $securePassword = ConvertTo-SecureString "TempPass2026!" -AsPlainText -Force
    $targetOU = "OU=$($U.Department),OU=HQ-departments,DC=cdcr,DC=local"
    
    # Provision new user account
    New-ADUser `
        -Name "$($U.Firstname) $($U.Lastname)" `
        -GivenName $U.Firstname `
        -Surname $U.Lastname `
        -SamAccountName $U.Username `
        -UserPrincipalName "$($U.Username)@cdcr.local" `
        -Path $targetOU `
        -AccountPassword $securePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true
        
    Write-Host "[+] Successfully created account: $($U.Username)" -ForegroundColor Green
}