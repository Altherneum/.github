<?php

echo "<h1>PHP !</h1>";
$php_version = PHP_VERSION_ID;
echo "PHP v°$php_version !";
echo phpinfo();
echo '<p>Hello World HTML !</p>';

echo shell_exec('ping google.com -c 1 -W 1 &');
echo "<br><hr>";

exec('ls -la &', $output, $return_var);
print_r($output);
echo "<br><hr>";

print_r($GLOBALS);
echo "<br><hr>";

print_r($_SERVER);
echo "<br><hr>";

echo phpversion();
echo "<br><hr>";

print_r(get_loaded_extensions());

?>