$b="$args"; 
(Get-ADDomain).ReplicaDirectoryServers |
% {write-host "$_" -ForegroundColor green; 
trap {"No such user in AD"; continue} get-aduser -Server $_ -identity $b -Properties * | 
fl name, displayname, enabled, passwordexpired, passwordlastset, Modified, lockedout, AccountLockoutTime, badlogoncount, badpwdcount, LastBadPasswordAttempt, LastLogonDate, AccountExpirationDate -GroupBy lockedout;
}