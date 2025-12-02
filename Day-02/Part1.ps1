$input = (Get-Content input.txt).split(',')

$sum = 0
foreach ($item in $input) {
    $item = $item.split('-')
    $start = [int64]$item[0]
    $end = [int64]$item[1]
    for ($num = $start; $num -le $end; $num++){
        $snum = [string]$num
        if ($snum.Length % 2 -eq 0 -and $snum -eq $snum.Substring(0, $snum.Length / 2) * 2){
            $sum += $num
        }
    }
}

write $sum