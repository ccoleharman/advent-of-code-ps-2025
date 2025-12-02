$input = (Get-Content input.txt).split(',')

$sum = 0
foreach ($item in $input) {
    $item = $item.split('-')
    $start = [int64]$item[0]
    $end = [int64]$item[1]
    for ($num = $start; $num -le $end; $num++){
        $snum = [string]$num
        $size = 1
        while ($snum.Length -ge $size * 2) {
            if ($snum.Length % $size -ne 0) {
                $size += 1
                continue
            }
            if ($snum -eq ($snum.Substring(0, $size) * ($snum.Length / $size))){
                $sum += $num
                break
            }
            $size += 1
        } 
    }
}

write $sum