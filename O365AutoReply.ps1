# Credential
$credentials = Get-Credential

# Connect to Exhange Online
connect-exchangeonline -Credential $credentials

# This has to be run from the exchange mgmt console
$mailbox = "yourmailbox@domain.com"
$config = Get-MailboxAutoReplyConfiguration -Identity $mailbox 

# print current mailbox auto reply status
$config | select *

$start = "04/14/2022 05:21:00 PM" 
$end = "06/01/2022 11:00:00 PM"

$internalmessage = "`nThank you for reaching out to the team! We apologize if you experience a delay in response.`n`nThe rest of your message here. Thanks!"  

Set-MailboxAutoReplyConfiguration -Identity $mailbox -AutoReplyState Scheduled -StartTime $start -EndTime $end -InternalMessage $internalmessage -ExternalAudience None -ExternalMessage $null

#If things go south, you can try to run this as a test:
Set-MailboxAutoReplyConfiguration -Identity $mailbox -AutoReplyState Enabled -InternalMessage $internalmessage -ExternalAudience None -ExternalMessage $null -StartTime $null -EndTime $null


# If you want to see the changes run the next two lines of code.
$config = Get-MailboxAutoReplyConfiguration -Identity $mailbox 
$config | select *