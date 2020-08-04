# encoding: UTF-8
#
include_controls 'microsoft-windows-server-2019-stig-baseline' do
  control "V-93457" do
    desc  "check", "Open \"Windows PowerShell\".

      Domain Controllers:
      Enter \"Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 30.00:00:00\"
      This will return accounts that have not been logged on to for 30 days, along with various attributes such as the Enabled status and LastLogonDate.

      Member servers and standalone systems:
      Copy or enter the lines below to the PowerShell window and enter. (Entering twice may be required. Do not include the quotes at the beginning and end of the query.)
      \"([ADSI]('WinNT://{0}' -f $env:COMPUTERNAME)).Children | Where { $_.SchemaClassName -eq 'user' } | ForEach {
      $user = ([ADSI]$_.Path)
      $lastLogin = $user.Properties.LastLogin.Value
      $enabled = ($user.Properties.UserFlags.Value -band 0x2) -ne 0x2
      if ($lastLogin -eq $null) {
      $lastLogin = 'Never'
      }
      Write-Host $user.Name $lastLogin $enabled
      }\"
      This will return a list of local accounts with the account name, last logon, and if the account is enabled (True/False).
      For example: User1 10/31/2015 5:49:56 AM True
      Review the list of accounts returned by the above queries to determine the finding validity for each account reported.

      Exclude the following accounts:
      - Built-in administrator account (Renamed, SID ending in 500)
      - Built-in guest account (Renamed, Disabled, SID ending in 501)
      - Application accounts

      If any enabled accounts have not been logged on to within the past 30 days, this is a finding.

      Inactive accounts that have been reviewed and deemed to be required must be documented with the ISSO."
    desc  "fix", "Regularly review accounts to determine if they are still active. Remove or disable accounts that have not been used in the last 30 days."
  end
end