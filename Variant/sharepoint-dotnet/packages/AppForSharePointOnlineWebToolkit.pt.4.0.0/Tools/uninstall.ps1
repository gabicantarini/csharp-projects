param($installPath, $toolsPath, $package, $project)

Import-Module (Join-Path $toolsPath common.psm1) -Force

try {

    # Indicates if current project is a VB project
    $IsVbProject = ($project.CodeModel.Language -eq [EnvDTE.CodeModelLanguageConstants]::vsCMLanguageVB)
    
    if ($IsVbProject) {

        # Remove added Imports for VB project
        $VbImports | ForEach-Object {
            if ($project.Object.Imports -contains $_) {
                $project.Object.Imports.Remove($_)
            }
        }
    }

} catch {

    Write-Host "Error uninstalling package: " + $_.Exception -ForegroundColor Red
    exit
}
# SIG # Begin signature block
# MIIlhAYJKoZIhvcNAQcCoIIldTCCJXECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAIjTxMJ3NRXfi2
# wAwr/77TW3W28zkWqvGcbIkjUG8OKqCCC2cwggTvMIID16ADAgECAhMzAAAFACfW
# Mm9Dc3uHAAAAAAUAMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjMwMjE2MjAxMTExWhcNMjQwMTMxMjAxMTExWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDFkbktTPAJwujWqeAF9Ei9qjEcHHhgDOcCGXKPZFsect6P72/fGD6iv9vq96xQ
# LkSI0PhfXnBwBGLUltZwi5PJaA7IFyaQPjLb5TB9EG0R78McIuMgyRweI3jDce54
# WPOaJCFdfi3hBvH/AoW7tQH0Ua+2QycxbHZgg8/EplcBaLWM/PrXIT3N0ZmDbSCW
# x/mZu/zJEDTS7Z37Sc5avkBdObK4H1XVNLh74iop34yBziFNXhQ8fR2usy6B2uf3
# jckPogHwykdvh0PibY8Lgq55IltjvV9KlHd6QHxeRJ6M0EZKgIUfcAF0w5XWFJZz
# eOHWB6E5NmdyU5sE6nQuGpGhAgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUnQrZdzAcYTWhzLarYgjDOio1KSMw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzUwMDIzMTAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQDh0kPUjUYtzlPEvMoFNXHo4aX5
# RPpdZ4rbyrU3Ur4LK4hXLXoMinXxgSnSxusJylXdemovg38RlxiZlgYYc0Yc7Ygd
# BWRl9zmeA+rgQ0srfR6F1ztgobrYxtHOjoThiWvBeLmZOjUVtrmvJgGu2ehfFeD2
# rmDz9CgLOkw2eG492vJ0poAFRIRZ8BtpgCDwzZgmuhAp7hKowwRyMk/pEROCtA04
# RLMShlIkT4NJBDE2OVD5TP0/DzNr3I8jEGBVzqb/QAlJf1MMBStHzYxTQ/UeH9PL
# /gr2iyLUER3m48izBli14+xyviBVC7cCKXAAv17c8+QR3NKfL5x5Ajo18YdFMIIG
# cDCCBFigAwIBAgIKYQxSTAAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0
# IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzA2MjA0MDE3
# WhcNMjUwNzA2MjA1MDE3WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDEw
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6Q5kUHlntcTj/QkATJ6U
# rPdWaOpE2M/FWE+ppXZ8bUW60zmStKQe+fllguQX0o/9RJwI6GWTzixVhL99COMu
# K6hBKxi3oktuSUxrFQfe0dLCiR5xlM21f0u0rwjYzIjWaxeUOpPOJj/s5v40mFfV
# HV1J9rIqLtWFu1k/+JC0K4N0yiuzO0bj8EZJwRdmVMkcvR3EVWJXcvhnuSUgNN5d
# pqWVXqsogM3Vsp7lA7Vj07IUyMHIiiYKWX8H7P8O7YASNUwSpr5SW/Wm2uCLC0h3
# 1oVH1RC5xuiq7otqLQVcYMa0KlucIxxfReMaFB5vN8sZM4BqiU2jamZjeJPVMM+V
# HwIDAQABo4IB4zCCAd8wEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFOb8X3u7
# IgBY5HJOtfQhdCMy5u+sMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjR
# PZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNy
# bDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MIGd
# BgNVHSAEgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9BggrBgEFBQcCARYxaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9kZWZhdWx0Lmh0bTBABggr
# BgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8AbABpAGMAeQBfAFMAdABhAHQA
# ZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEAGnTvV08pe8QWhXi4UNMi
# /AmdrIKX+DT/KiyXlRLl5L/Pv5PI4zSp24G43B4AvtI1b6/lf3mVd+UC1PHr2M1O
# HhthosJaIxrwjKhiUUVnCOM/PB6T+DCFF8g5QKbXDrMhKeWloWmMIpPMdJjnoUdD
# 8lOswA8waX/+0iUgbW9h098H1dlyACxphnY9UdumOUjJN2FtB91TGcun1mHCv+KD
# qw/ga5uV1n0oUbCJSlGkmmzItx9KGg5pqdfcwX7RSXCqtq27ckdjF/qm1qKmhuyo
# EESbY7ayaYkGx0aGehg/6MUdIdV7+QIjLcVBy78dTMgW77Gcf/wiS0mKbhXjpn92
# W9FTeZGFndXS2z1zNfM8rlSyUkdqwKoTldKOEdqZZ14yjPs3hdHcdYWch8ZaV4XC
# v90Nj4ybLeu07s8n07VeafqkFgQBpyRnc89NT7beBVaXevfpUk30dwVPhcbYC/GO
# 7UIJ0Q124yNWeCImNr7KsYxuqh3khdpHM2KPpMmRM19xHkCvmGXJIuhCISWKHC1g
# 2TeJQYkqFg/XYTyUaGBS79ZHmaCAQO4VgXc+nOBTGBpQHTiVmx5mMxMnORd4hzbO
# TsNfsvU9R1O24OXbC2E9KteSLM43Wj5AQjGkHxAIwlacvyRdUQKdannSF9PawZSO
# B3slcUSrBmrm1MbfI5qWdcUxghlzMIIZbwIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAFACfWMm9Dc3uHAAAAAAUAMA0GCWCGSAFlAwQC
# AQUAoIGuMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsx
# DjAMBgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCAZHKV8X0fCo2OnAlAkbrI5
# lAvuBfaCvHD2deCAfXhnFTBCBgorBgEEAYI3AgEMMTQwMqAUgBIATQBpAGMAcgBv
# AHMAbwBmAHShGoAYaHR0cDovL3d3dy5taWNyb3NvZnQuY29tMA0GCSqGSIb3DQEB
# AQUABIIBAC2HasJoBo0JfT+nDjK5jkcf2+Wb6CWEYWoI49oKS9VK+cQxdT9ugiV7
# F2GABgxaS7eSSW8ucAnMgjB/lJrcWogvRddy7uKI5wHLw+Z9u/btw28bdCEhdE/C
# ezM2vu/qY58/HTFNajrLpNwdAT5sPSUXqqvOe6YCQY2Nm2MRp6fmjWNQDyKYw5QH
# fRt1cntsLxmavDDDpIf7E/tmTPCpMvWFBWGICIaL3fQJCkIWKvfsEG8GMQk2iIJQ
# tB6bt2HyL6Oory0dmGU4t8DRYy2OwQlrrqoZxTwnDtykhFoGkZGRBtRUmeftvp1U
# ef8uOdy2jZANEhj5VrEBKtgjECKrIQChghb9MIIW+QYKKwYBBAGCNwMDATGCFukw
# ghblBgkqhkiG9w0BBwKgghbWMIIW0gIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBUQYL
# KoZIhvcNAQkQAQSgggFABIIBPDCCATgCAQEGCisGAQQBhFkKAwEwMTANBglghkgB
# ZQMEAgEFAAQg7/pM4UYBJ3OLXeNJ+SUagSc+5jGh1Jksn5mVDMnrZroCBmSwEKnH
# nBgTMjAyMzA3MjExODQyMDMuMDM4WjAEgAIB9KCB0KSBzTCByjELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFt
# ZXJpY2EgT3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046M0U3QS1F
# MzU5LUEyNUQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghFUMIIHDDCCBPSgAwIBAgITMwAAAcn61Y4lIHQCXgABAAAByTANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMjExMDQxOTAx
# MzhaFw0yNDAyMDIxOTAxMzhaMIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjozRTdBLUUzNTktQTI1RDElMCMGA1UE
# AxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBANZy4uWOb8/CvlqMYZO6hlv7wsYuXrkzNNU4hGxThvIO
# 0hQdFTI2IKOk4kc4DkPgjedzgTipcjB1s0S+Mb2ktN2ZSIHrSCC2IgEqILBLZY8x
# JURzu3wxgxVnHc/pQjWJiaM7WxtzzK58W5VBx1JK+AuxAR29mNOxneRiQYD/PuQG
# TbE5bBxnMx7OOZpj+61IHDJ//3PEPxmEqnU+DlxC6ed4ffRJ8heM3LHdmRY8XY9Z
# T/EBsGWUuBfNiQRntqQq0mpMhY08cxSlDsHEHq8AUf2GkJcu5rQq2uDzXMhEJvp/
# yw3Hv1VYkGvDjNpwWRysOgsjKhMxSScuR4s8/Gesa6qiyrYvL4iVENBbapE10kd/
# /8PDwCsgZbyGExRfy8tyYd3G1XjoEprmzlcL/JzHoXEG9gLcXFP5XchFKsvP7YRB
# yFjWm8x18eTvQ+G7UuqCXYC5h8a0wbRrHFUKsdM+f31CJCxO7W8H6KvOHBf1ESxM
# sN6ueyldlOIDoXN+el2BFUHSV6OlRVgUA2G82p0Nuc2NtVApI/NtQsg/dIKqzt60
# D5XEKOnq8Ftgxdn7JoAG1as0LM+kZJmn8+K3te5Ju6ntPT7sB8OXt8eWSBhKFZXz
# Zyb+vvOdbsCl+gKWRcT83kKO1v+QbWk5pGRIcGOQHQj4D79GmiBEJ9qhezLxcAnL
# AgMBAAGjggE2MIIBMjAdBgNVHQ4EFgQUBW+dZ0bCPKG+eDoUxXlRe0QuMsswHwYD
# VR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgwVjBUoFKgUIZO
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0JTIw
# VGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUFBwEBBGAwXjBc
# BggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcnQwDAYD
# VR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG9w0BAQsFAAOC
# AgEANqi6nGbfR4pCB3I+wJZx4Y6LsUozngWkxPhCvGl3FS5vXAPA9v2WNjlKWLzn
# YbgxFfYRJVZs6KYibpP8QWIenViU0YZku4VY6xras0hVtC337EcrI8ZKbqsoR4gQ
# 8TFzBmehnc1H6lT9mXdjvifwWECYLPTR2M/wjOF2kT/k9lTNyRNZkjtai2vpnweN
# u0Ii4/yQu01GIIeEWPqCzBVbkCWb12Jf4yExX1KaSaAGpAa9FXNq9ZD+Q4iWjb2V
# if3LmGolkOJPcacOsBs96qu8QFp5Rs7GsMBYY7cKuRB/7N+ywn3ocrgsPGUSfVt7
# YEhXqQFTO7FBPj691Lvoj7wVeE7EwzRS9AlSD1/tVziemERmCdpBxqaBnP+bIANi
# CkHJfe2Q2CSKosYMCjX7cje9DtAE26U1YbGzdNRVZYtB/r4HBocs5Oo6QMsBzw0k
# P8aBHhlOPujxU1zETv3zMxnFHH9GR6mTJtFIaB/LTrZNfJOge+SiV07WN2TO6U37
# q0r9kK7+c8wgYssrLTj8PyCSPpPaKU4Grawt/S+vfysMrQ9Me7dI5k17ZS2Whr6E
# pY3csq+kA0VZKrAmi1EkrAIlnmr+aoOuFN5i5nnpKNBPUyecs7Tf43Is5R8dF7ID
# rjerLm9wj1ewADDIiqKXUGKoj17vSMb6l0+whP0jAtqXDckwggdxMIIFWaADAgEC
# AhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQg
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVa
# Fw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7V
# gtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeF
# RiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3X
# D9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoP
# z130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+
# tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5Jas
# AUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/b
# fV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuv
# XsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg
# 8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzF
# a/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqP
# nhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEw
# IwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSf
# pxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBB
# MD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0Rv
# Y3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGC
# NxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8w
# HwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmg
# R4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWlj
# Um9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEF
# BQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29D
# ZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEs
# H2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHk
# wo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinL
# btg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCg
# vxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsId
# w2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2
# zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23K
# jgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beu
# yOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/
# tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjm
# jJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBj
# U02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYICyzCCAjQCAQEwgfihgdCkgc0wgcox
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1p
# Y3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjNFN0EtRTM1OS1BMjVEMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQB96YvL/h4Bm41ULOBt+nUcVgbdDqCB
# gzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAk
# BgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEB
# BQUAAgUA6GUa6DAiGA8yMDIzMDcyMTIyNTUzNloYDzIwMjMwNzIyMjI1NTM2WjB0
# MDoGCisGAQQBhFkKBAExLDAqMAoCBQDoZRroAgEAMAcCAQACAgFCMAcCAQACAhHK
# MAoCBQDoZmxoAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAI
# AgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAbktYHjT0v2qQ
# fSTBzBJh6uLKxaByCInnJ1UKZ+0icseHDWkd0f/bVmMtjXhyNgVdYkuAWKVXVHXO
# 9tbGF0nhU/4T0gEkAL6z2ULDpL4WVHI6eWC2Z+AqBHzIO3MGtMr+ybNZZtb2Vk51
# 0AaPYRlxvOfhflfhAe5uYWUSGX3naMExggQNMIIECQIBATCBkzB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAcn61Y4lIHQCXgABAAAByTANBglghkgB
# ZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3
# DQEJBDEiBCCkbUxjskKiKCm/ogM+lY9+N535SUGhdWJHKiN/XtmBjzCB+gYLKoZI
# hvcNAQkQAi8xgeowgecwgeQwgb0EIIF1zn9S3VFLECd4Kdh/YA0jIYkA/8194V18
# 4dk5dv2BMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMA
# AAHJ+tWOJSB0Al4AAQAAAckwIgQg2fV1hrMC3xqy/CiisjswzAKAxU9DyQJFJwQH
# 7e27p1owDQYJKoZIhvcNAQELBQAEggIAwIcZzsQTVrOdjlIN3XsrjDRBIJ7OnyFd
# fg4Tg+vnU1Ng/QyU4Xv2URYFEHqdWydxXENYrTyrOxtBQ0qb6yWqYghQUoaujAbu
# H59Rm8pl2Cl09jmSaRiB5LI6AdU93+9P5fJ8DEyPLeYs6PBITJCrgK2iOl0YU9Dv
# TpRnII+Ap3Djzc9GzECvAr/Th3jkZJqs0bRybDoIQCu4ivhbDKVRmrdLYPVLV9fe
# +Bmv4ziTqzRjwpJvOTAPCzwGh2Z8NpXh8u+k1kJgZlpIePJDPPKG9Xti9juUWQ5H
# WAY0gQ2lkwM6B0qphM/2Rep0Y5Xmfo1OMBS28Yt18yK3Hiw1TyApQgRS+GlfSxAh
# HIKNtnPAUUySEKEb61TZgcnIvNQzB2hrtiIhimr1/Q6LM9euznLO0j/ZrBaNZtmC
# I1uCtOQOS5jLTvR7WvmUFvAM7JEC2SSYqfsf9u099p02xoOz9d0L1Ma19mQioqaI
# 5hwoK8vRTlCgCOx8CnacGKB46B/yY4vre04QuVeP0OOabPzwmpLr88J7FdU1uut+
# QnwLbEHiFZvZZuijSoX6Cij1FCrSxoqtzXfhudyxJK8jCDefOh3NxkrlEDSmq45d
# cmQPuXRZVFJ9gTN+qNk57Jjrxs/VCG8pjWSYlsVvZ5FSbj3aCS0s+oaLhldMPXN0
# ro0NMz5HcCY=
# SIG # End signature block
