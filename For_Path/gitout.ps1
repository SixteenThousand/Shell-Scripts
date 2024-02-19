Param(
	[Parameter(Position=0)]$pattern,
	[Parameter(Position=1)]$replacement,
	[switch]$dryrun,
	[switch]$help
)

if($help) {
	$msg = -join (`
		"This is a simple wrapper around git mv ", `
		"which does regex find & replace on filenames in the current ", `
		"working directory.`r`n`r`n", `
		"OPTIONS`r`n---`r`n", `
		"-pattern: (can be 1st unnamed option) regex to match current ", `
		"files to`r`n", `
		"-replacement: (can be 2nd unnamed option) regex to replace ", `
		"current  filenames with. Can have captures from -pattern.`r`n", `
		"-dryrun: if present, just show what gitout would do with the ", `
		"given -pattern & -replacement options.`r`n", `
		"-help: show this help`r`n", `
		"`r`n", `
		"PITFALLS`r`n---`r`n", `
		"- gitout is a pwsh script. It uses pwsh regexes!`r`n", `
		"- Single quotes (') MUST be used to quote the regexes.`r`n", `
		"- Double escapes (\\) are not needed.`r`n", `
		"- Captures are denoted by dollar signs (`$). ", `
		"Literal dollar signs are escaped with backticks (``).`r`n", `
		"Hopefully that's it, and you'll never make a regex mistake with ", `
		"git out!", `
		"Now git out!" `
	)
	echo $msg
	return
}

if($dryrun) {
	ForEach($oldname in Get-Childitem -File -Name) {
		if($oldname -cmatch $pattern) {
			$newname = $oldname -creplace $pattern,$replacement
			echo "$oldname -> $newname"
		}
	}
} else {
	ForEach($oldname in Get-Childitem -File -Name) {
		if($oldname -cmatch $pattern) {
			$newname = $oldname -creplace $pattern,$replacement
			git mv $oldname $newname
		}
	}
}
