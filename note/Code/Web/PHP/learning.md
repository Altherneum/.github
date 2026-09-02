- Je me suis arrêté à https://www.w3schools.com/php/php_string.asp
- Faire un review AI, et manuel
- Compléter la doc et l'host en ligne
- Faire un test via apache et le doc
- Also : https://www.w3schools.com/php/php_examples.asp : seem good AF
  - https://www.w3schools.com/php/php_ref_overview.asp

# PHP
- PHP: Hypertext Preprocessor
- Les scripts PHP sont lancés sur le serveur
  - Contrairement à JavaScript qui se lance sur le navigateur client

## Intoduction à PHP
### Installer PHP
- [php.net/downloads](https://www.php.net/downloads.php?os=linux&osvariant=linux-ubuntu&version=default)
- `sudo apt update && apt install -y php`

### Créer le premier fichier
- Créer un fichier `hello.php`
- Ajouter le contenu suivant
```
<?php

echo "Hello World string !";
echo "<h1>PHP !</h1>";
echo '<p>Hello World HTML !</p>';

echo phpversion();

echo phpinfo();
echo ini_get();
echo get_loaded_extensions();

echo "$GLOBALS"
echo "$_SERVER"
echo "$_GET"
echo "$_POST"
echo "$_FILES"
echo "$_COOKIE"
echo "$_SESSION"
echo "$_REQUEST"
echo "$_ENV"

?>
```
- Lancer via ;
  - Lancer la commande `php -S localhost:8000`
  - Puis naviguer sur [localhost:8000/hello.php](http://localhost:8000/hello.php)

## Syntaxe PHP
### Echo
```
echo "<h2>PHP is Fun!</h2>";

echo "Hello world!<br>";

echo "I'm about to learn PHP!<br>";

echo "This ", "string ", "was ", "made ", "with multiple parameters.";

$txt1 = "Learn PHP";
echo "<p>$txt1</p>";
//When using double quotes, variables can be inserted to the string as in the example above.

$txt2 = "Learn PHP";
echo '<p>' . $txt2 . '</p>';
//When using single quotes, variables have to be inserted using the `.` operator, like this
```
### print
```
print "Hello";

print("Hello");

print "<h2>PHP is Fun!</h2>";

print "Hello world!<br>";

print "I'm about to learn PHP!";
```
### Commenter du code
```
<?php

// Un commentaire

# Aussi un commentaire

/* Commentaire
Sur plusieurs
lignes */

$x = 5 /* + 15 */ + 5;
echo $x; //Sera 10 car le `+ 15` est commenté

?>
```

### Variables
#### Nomenclature d'une variable
- Une variable commence par `$` suivis du nom de la variable
- Les variables sont sensibles à la case (`$var` n'est pas identique à `$VAR`)
- Une variable ne peut pas commencer par des chiffres
- Et est constitué de alpha-numeric et d'underscores
  - (A-z, 0-9, and _ )
#### Exemple d'utilisation d'une variable
```
<?php

$color = "red"; //Créer une variable

echo "Color is $color"; //Afficher la variable avec du text

?>
```
#### Types de variables
```
$x = 5;
$y = "John";
```
- `string` (text values)
  - `$x = "Abc";`
- `int` (whole numbers)
  - `$x = 5;`
- `float` (decimal numbers)
  - `$x = 3.14;`
- `bool` (true or false)
  - `$x = false;`
- `array` (multiple values)
  - `$x = [2, 3, 56]`
- `null` (empty variable)
  - `$x = NULL`
  - A variable of data type NULL is a variable that has no value assigned to it.
##### Autres types de variables
- `object` (stores data as objects)
```
class Car {
  public $color;
  public $model;
  public function __construct($color, $model) {
    $this->color = $color;
    $this->model = $model;
  }
  public function message() {
    return "My car is a " . $this->color . " " . $this->model . "!";
  }
}

$myCar = new Car("red", "Volvo");
var_dump($myCar);
```
- `resource` (references external resources)
  - The special resource data type is not an actual data type. It holds a reference to an external resource, such as a database connection or a file handler
- `mixed` (any value)
```
var_dump(5); //int(5)
var_dump("John"); //string(4) "John"
```
#### Caster une variable
```
$x = 5;

$x = (string) $x;
```
#### Concaténer une variable
```
$wrld = "World";

echo 'Hello ' . $wrld . ' !'; 

//Hello World !
```
#### Addition de variables
```
$x = 5;
$y = 4;

echo $x + $y; // 9
```
#### Assigner plusieurs variables
```
$a = $b = $another_var = "ABC123";
```
#### Portée d'une variable
##### Global scope
```
$x = 5; // global scope

function myTest() {
  // using x inside this function will not work
  echo "Variable x inside function is: $x";
}
myTest();

echo "Variable x outside function is: $x";
```
##### Local scope
```
function myTest() {
  $x = 5; // local scope
  echo "Variable x inside function is: $x";
}
myTest();

// using x outside the function will not work
echo "Variable x outside function is: $x";
```
##### Static scope
- Normalement, lorsqu'une fonction termine son exécution, toutes ses variables sont supprimées
- Cependant, il arrive que l'on souhaite qu'une variable locale ne soit pas supprimée, car on en a besoin pour une opération ultérieure
- Pour ce faire, utilisez le mot-clé `static` lors de la déclaration initiale de la variable
- Ainsi, à chaque appel de la fonction, la variable conservera la valeur qu'elle avait lors de l'appel précédent
- Remarque : la variable reste locale à la fonction

```
function myTest() {
  static $x = 0; // static scope
  echo $x;
  $x++;
}

myTest();
myTest();
myTest();
```
##### Global scope forcée
- Le mot-clé `global` est utilisé pour accéder à une variable globale depuis une fonction
  - Le mot-clé `global` importe des variables de la portée globale dans la portée locale d'une fonction
- Pour ce faire, utilisez le mot-clé `global` devant les variables (à l'intérieur de la fonction)
```
$x = 5;
$y = 10;

function myTest() {
  global $x, $y;
  $y = $x + $y;
}

myTest();
echo $y; // outputs 15
```
#### Forcer le typage
```
<?php declare(strict_types=1); // strict requirement

function addNumbers(int $a, int $b) {
  return $a + $b;
}

echo addNumbers(5, "5 days");
// since "5 days" is not an integer, an error will be thrown

?>
```
#### Forcer le typage d'un return
Placez `: <TYPE>` après une fonction et ses paramètres pour spécifier le type de return
##### Forcer le typage sans cast
```
<?php declare(strict_types=1); // strict requirement

function addNumbers(float $a, float $b) : float {
  return $a + $b;
}

echo addNumbers(1.2, 5.2);

?>
```
##### Forcer le typage avec un cast
```
<?php declare(strict_types=1); // strict requirement

function addNumbers(float $a, float $b) : int {
  return (int)($a + $b);
}

echo addNumbers(1.2, 5.2);
```

### Les fonctions
#### Fonction classique
```
function myTest() {
  echo "Hello world !";
}

myTest();
```
#### Fonction avec paramètres
```
function hello($name, $name2) {
  echo 'hello $name, i'm $name2';
}

hello("sam", "arthur");
```
#### Fonction avec return
```
function sum($x, $y) {
  return $x + $y;
}

echo "5 + 10 = " . sum(5, 10);
```
#### Passer un argument dans une fonction
- Les arguments sont généralement passés par valeur
  - ce qui signifie qu'une copie de la valeur est utilisée dans la fonction et que la variable transmise à la fonction ne peut pas être modifiée
- Lorsqu'un argument de fonction est passé par référence, les modifications apportées à l'argument modifient également la variable transmise
- Pour transformer un argument de fonction en référence, utilisez l'opérateur `&` devant l'argument (ou le paramètre)

```
function add_five(&$value) {
  $value += 5;
}

$num = 2;

add_five($num);

echo $num;
```

Sans cela, le code ressemblerait à ça

```
function add_five($value) {
  return $value + 5;
}


$num = 2;

$num = add_five($num)

echo $num
```

#### Fonction avec un nombre d'argument inconnus
```
function sumMyNumbers(...$x) {
  $somme = 0;
  $len = count($x);

  for($i = 0; $i < $len; $i++) {
    $somme += $x[$i];
  }

  return $somme;
}

$a = sumMyNumbers(5, 2, 6, 2, 7, 7);

echo $a;
```