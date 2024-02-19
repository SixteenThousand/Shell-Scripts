Param(
	$depth = 7,
	[switch]$cwd
)

$toplevel = "~"
if($cwd) {
	$toplevel = $(Get-Location)
}

Get-ChildItem $toplevel -Recurse -Directory -Depth $depth `
| Select-Object -ExpandProperty FullName `
| fzf `
| cd
