Param(
	$path = $(throw "error")
)

Invoke-Expression "New-Item $path -ItemType File -Force"
