Param(
	$alg = $(throw "Please specify checksum type"),
	$file = $(throw "Please specify a file!"),
	$hash = $(throw "Please specify a checksum")
)

$tmpDH = Get-FileHash $file $alg
$downloadHash = $tmpDH.Hash

echo "Download Hash: $downloadHash"
echo "Given Hash: $hash"

If($downloadHash -eq $hash.ToUpper()) {
	echo "The hash matches! Another day of PERFECT cybersecurity!!"
} else {
	echo "You just downloaded malware, buddy."
}
