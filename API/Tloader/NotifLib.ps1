function Show-CustomMessageBox {
    param (
        [string]$Message,
        [string]$Title = "Notification",
        [string]$BackgroundColor = "#FFFFFF", # Default to white
        [string]$TextColor = "#000000"       # Default to black
    )

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.StartPosition = "CenterScreen"
    $form.Size = New-Object System.Drawing.Size(300, 150)
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    # Convert hex color codes to System.Drawing.Color
    $bgColor = [System.Drawing.ColorTranslator]::FromHtml($BackgroundColor)
    $txtColor = [System.Drawing.ColorTranslator]::FromHtml($TextColor)

    $form.BackColor = $bgColor

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Message
    $label.AutoSize = $true
    $label.BackColor = $bgColor
    $label.ForeColor = $txtColor
    $label.Font = New-Object System.Drawing.Font("Arial", 12)
    $label.TextAlign = "MiddleCenter"
    $label.Dock = "Fill"

    $form.Controls.Add($label)
    $form.Topmost = $true

    $null = $form.ShowDialog()
}
