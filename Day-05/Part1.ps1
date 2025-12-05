$input = Get-Content input.txt

$ranges = @()
$i = 0
while ($input[$i] -ne ""){
    $ranges += ,@([int64]$input[$i].split("-")[0], [int64]$input[$i].split("-")[1])
    $i += 1
}
$ranges = $ranges | Sort-Object { $_[0] }

$count = 0
$i += 1
while ($i -lt $input.Length){
    for ($j = 0; $j -lt $ranges.Length -and [int64]$input[$i] -ge $ranges[$j][0]; $j += 1){
        if ([int64]$input[$i] -le $ranges[$j][1]) {
            $count += 1
            break  
        }
    }
    $i += 1
}

write $count