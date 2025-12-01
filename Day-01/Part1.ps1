$input = Get-Content input.txt

$count = 0
$num = 50

foreach ($item in $input) {
    if ($item[0] -eq "R") {
        $num += ($item[1..($item.Length - 1)] -join '')
    } else {
        $num -= ($item[1..($item.Length - 1)] -join '')
    }
    while ($num -lt 0) {
        $num += 100
    }
    while ($num -ge 100) {
        $num -= 100
    }
    if ($num -eq 0) {
        $count += 1
    }
}

write $count