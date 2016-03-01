#This tool will only update submodules in local workspace.

param(
    [string]$credential,
    [switch]$remote=$False
    )

$WorkingFolder = (Split-Path $script:MyInvocation.MyCommand.Path -Parent)
$submoduleMetaFile = (Join-Path -Path $WorkingFolder -ChildPath ".gitmodules")

function Add-Credential {
    param ([string]$gitUrl, [string]$credential)
    
    $blocks = $gitUrl -split "/|\\"
    $protocol = "https:"
    $outItems = New-Object System.Collections.Generic.List[System.Object]
    if (($blocks[0] -eq "https:") -Or ($blocks[0] -eq "http:") -Or ($blocks[0] -eq "git:")) {
        $protocol = $blocks[0]
    }
    for ($i=1; $i -lt $blocks.Length; $i++) {
        if ($blocks[$i]) {
            $outItems.Add($blocks[$i])
        }
    }
    return ("{0}{1}{2}" -f $protocol,"//$credential@",($outItems -join "/"))
}

if (!$credential) {
    Write-Host "Please specify a credential info (-credential username:password or -credential username:token) to access git."
    Write-Host "Terminated."
    Exit 1
}

#Update Repository
Write-Host "************************************************"
#Set current working director
Set-Location $WorkingFolder

if (!(Test-Path $submoduleMetaFile)) {
    Write-Host "Error: The submodule metadata file $submoduleMetaFile doesn't exists, please add submodule first."
    Write-Host "Terminated."
    Exit 1
}

Write-Host "git submodule init"
git submodule init
$content = [IO.File]::ReadAllText("$submoduleMetaFile")
$contents = $content -split "\[|\]"
for ($i=1; $i -lt $contents.Length; $i=$i+2) {
    $submoduleName = ($contents[$i] -split '"')[1]
    $properties = ($contents[$i+1].Trim() -split '["\r\n?"|"\n\r?"]')
    $items = New-Object System.Collections.Generic.List[System.Object]
    foreach ($property in $properties) {
        $property = $property.Trim()
        if ($property) {
            $items.Add($property)
        }
    }
    $items = $items.toArray()
    $submoduleUrl = ($items[1] -split "=")[1].Trim()
    $submoduleUrl = Add-Credential -gitUrl $submoduleUrl -credential $credential
    git config submodule."$submoduleName".url $submoduleUrl
}
Write-Host "git submodule update"
git submodule update
if ($remote) {
    Write-Host "git submodule update --remote"
    git submodule update --remote
}
Write-Host "************************************************"
