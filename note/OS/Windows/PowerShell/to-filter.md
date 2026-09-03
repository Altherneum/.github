# PowerShell
```
$i = 0                # $i = 0
$i++                  # $i is incremented by 1
$j = $i--             # $j takes on the value of $i before the decrement

$a = 1,2,3
$b = 9,8,7
$i = 0
$j = 1
$b[$j--] = $a[$i++]   # $b[1] takes on the value of $a[0], then $j is
                      # decremented, $i incremented

$i = 2147483647       # $i holds a value of type int
$i++                  # $i now holds a value of type double because
                      # 2147483648 is too big to fit in type int

[int]$k = 0           # $k is constrained to int
$k = [int]::MaxValue  # $k is set to 2147483647
$k++                  # 2147483648 is too big to fit, imp-def behavior

$x = $null            # target is unconstrained, $null goes to [int]0
$x++                  # value treated as int, 0->1
```

## Unary
```
# Unary plus
Description:
An expression of the form + unary-expression is treated as if it were written as 0 + unary-expression (§7.7). The integer literal 0 has type int.

This operator is right associative.

Examples:
+123L         # type long, value 123
+0.12340D     # type decimal, value 0.12340
+"0xabc"      # type int, value 2748

# Unary minus
Description:
An expression of the form - unary-expression is treated as if it were written as 0 - unary-expression (§7.7). The integer literal 0 has type int. The minus operator can be any one of the dash characters listed in §7.2.

This operator is right associative.

Examples:
-$true     # type int, value -1
-123L      # type long, value -123
-0.12340D  # type decimal, value -0.12340

# The unary -join operator
Description:
The unary -join operator produces a string that is the concatenation of the value of one or more objects designated by unary-expression. (A separator can be inserted by using the binary version of this operator (§7.8.4.4).)

unary-expression can be a scalar value or a collection.
```

## Variable env
Permet de créer des commandes auto

## Vérifier si l'éxecution de scripts est active
- `Get-ExecutionPolicy` Politique sur l'exécution de scripte à distance
- `Set-ExecutionPolicy [POLICY]`

## Ouvrir une session
- `Enter-PSSession -ComputerName CORE01 -Credential "DomaineName\UserName"`

## Invoke command
`Invoke-Command -ComputerName <Computer> -ScriptBlock {Commande ; Commande 2}`

`Invoke-Commannd -ComputerName PC1,PC2,PC3 -ScriptBlock { dir C:\ }`

`Invoke-command -computername "PC1,DC1" -scriptblock { Start-process chrome.exe }`

## Get-Help operators
get-help about_Comparison_Operators
update-help