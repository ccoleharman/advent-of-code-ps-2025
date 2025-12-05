$input = Get-Content input.txt

$ranges = @()
$i = 0
while ($input[$i] -ne ""){
    $ranges += ,@([int64]$input[$i].split("-")[0], [int64]$input[$i].split("-")[1])
    $i += 1
}
$ranges = $ranges | Sort-Object { $_[0] }

$count = 0
$last = 0
foreach ($range in $ranges){
    if ($range[0] -le $last -and $range[1] -gt $last){
        $count += $range[1] - $last
        $last = $range[1]
    }
    elseif ($range[0] -gt $last){
        $count += $range[1] - $range[0]
        $count += 1
        $last = $range[1]
    }
}

write $count