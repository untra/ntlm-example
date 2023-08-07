$CertName = "site_cert.pfx" # todo is this right name?
$fqdn = "" # ipaddr of runner?
$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName $fqdn

Export-Certificate -Cert $Cert -FilePath C:\temp\$CertName

Enable-PSRemoting -SkipNetworkProfileCheck -Force

# Check for HTTP listeners
dir wsman:\localhost\listener

# If HTTP Listeners exist, remove them
Get-ChildItem WSMan:\Localhost\listener | Where -Property Keys -eq "Transport=HTTP" | Remove-Item -Recurse

# If HTTPs Listeners don't exist, add one
New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint –Force

# This allows old WinRm hosts to use port 443
Set-Item WSMan:\localhost\Service\EnableCompatibilityHttpsListener -Value true

# Make sure an HTTPs inbound rule is allowed
New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP

# For security reasons, you might want to disable the firewall rule for HTTP that *Enable-PSRemoting* added:
Disable-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-In)"

# Enable Windows NTLM Auth

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
appcmd set config /section:windowsAuthentication /-providers.[value='Negotiate']






