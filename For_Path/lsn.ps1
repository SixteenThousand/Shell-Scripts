Param(
	[switch]$files=$false,
	[switch]$directories=$false,
	[switch]$brief=$false,
	$property = "FullName",
	[switch]$oneLine = $false
)

$objectType = ""

if($files) {
	$objectType = "-File"
}
if($directories) {
	$objectType = "-Directory"
}
if($brief) {
	$property = "Name"
}

$cmd = -join( `
	"Get-ChildItem -Recurse $objectType", `
	"| Select-Object -ExpandProperty $property" `
)

if($oneLine) {
} else {
	Invoke-Expression $cmd
}
