param(
    [string]$Title,
    [string]$Message
)
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.ToastNotification]::new() | Out-Null  # Dummy line; not used for MessageBox
[System.Windows.Forms.MessageBox]::Show($Message, $Title)
