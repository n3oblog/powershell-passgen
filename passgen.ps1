function Get-RandomSegment($length) {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    $randomSegment = -join ((1..$length) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
    return $randomSegment
}

$segment1 = Get-RandomSegment 3
$segment2 = Get-RandomSegment 3
$segment3 = Get-RandomSegment 3
$segment4 = Get-RandomSegment 3

$password = "$segment1-$segment2-$segment3-$segment4"

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.Clipboard]::SetText($password)
[System.Windows.MessageBox]::Show("Generated Password: $password", "Password")
