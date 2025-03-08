Param(
    [string]$Title = "Notification",
    [string]$Message = "Message"
)

try {
    Add-Type -AssemblyName System.Runtime.WindowsRuntime -ErrorAction Stop
} catch {
    Write-Host "Error loading Windows Runtime assembly."
}

# Get the toast template (ToastText02 provides two text elements)
$templateType = [Windows.UI.Notifications.ToastTemplateType]::ToastText02
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($templateType)

# Set the title and message in the template
$textNodes = $template.GetElementsByTagName("text")
$textNodes.Item(0).AppendChild($template.CreateTextNode($Title)) | Out-Null
$textNodes.Item(1).AppendChild($template.CreateTextNode($Message)) | Out-Null

# Create and show the toast notification
$toast = [Windows.UI.Notifications.ToastNotification]::new($template)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("CARBON X ASSIST")
$notifier.Show($toast)
