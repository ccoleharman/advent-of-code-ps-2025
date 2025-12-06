$input = Get-Content input.txt | ForEach-Object { ,(($_ -replace '\s+', ' ').Trim().Split(" ")) }

$sum = 0
for ($j = 0; $j -lt $input[0].Length; $j += 1){
    $nums = @()
    for ($i = 0; $i -lt $input.Length - 1; $i += 1){
        $nums += ,[int]$input[$i][$j]
    }
    if ($input[$input.Length - 1][$j] -eq "*"){
        $product = 1
        $nums | ForEach-Object { $product *= $_ }
        $sum += $product
    }
    else {
        $nums | ForEach-Object { $sum += $_ }
    }
}

write $sum