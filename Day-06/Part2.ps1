$input = Get-Content input.txt

$sum = 0
$nums = @()
$mult = $true
$AllSpace = $false
for ($j = 0; $j -lt $input[0].Length; $j += 1){
    if ($AllSpace) {
        if ($mult){
            $product = 1
            $nums | ForEach-Object { $product *= $_ }
            $sum += $product
        }
        else {
            $nums | ForEach-Object { $sum += $_ }
        }
        $AllSpace = $false
        if ($input[$input.Length - 1][$j] -eq "*"){
            $mult = $true
        }
        else {
            $mult = $false
        }
        $nums = @()
    }

    $AllSpace = $true
    $num = ""
    for ($i = 0; $i -lt $input.Length - 1; $i += 1){
        if ($input[$i][$j] -eq " "){
            continue
        }
        else {
            $AllSpace = $false
            $num += $input[$i][$j]
        }
    }
    if ($num -ne ""){
        $nums += ,[int]$num
    }
}
if ($mult){
    $product = 1
    $nums | ForEach-Object { $product *= $_ }
    $sum += $product
}
else {
    $nums | ForEach-Object { $sum += $_ }
}

write $sum