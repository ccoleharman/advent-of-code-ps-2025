$input = Get-Content input.txt

$count = 0
$num = 50

foreach ($item in $input) {
    $change = [int]($item[1..($item.Length - 1)] -join '')
    while ($change -ge 100 ) {
        $change -= 100
        $count += 1
    }
    if ($item[0] -eq "R") {
        if ($num -eq 100) {
            $num = 0
        }
        $num += $change
    } else {
        if ($num -eq 0) {
            $num = 100
        }        
        $num -= $change
    }
    if ($num -le 0) {
        $num += 100
        $count += 1
    }
    elseif ($num -gt 99) {
        $num -= 100
        $count += 1
    }
}

write $count