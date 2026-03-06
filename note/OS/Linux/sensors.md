# Sensors
## Intruduction à la commande sensors
- `sensors`
    - afficher les informations des capteurs

## Exemples
- `sensors [ options ] [ chips ]`
- `sensors -s [ chips ]`
- `sensors --bus-list`

## Informations
- `sensors` est utilisé pour afficher les lectures actuelles de tous les puces capteur
  - `sensors -s` est utilisé pour définir toutes les limites telles que spécifiées dans le fichier de configuration
  - `sensors --bus-list` est utilisé pour générer des énoncés de bus adaptés au fichier de configuration

## Exemple de la commande sensors
```
 ven. 09 mars 2026    󰅐 09:18:30     admin@arch     ~
 History n°501 =[$]> sensors
k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +46.9°C  

amdgpu-pci-0a00
Adapter: PCI adapter
vddgfx:      692.00 mV 
fan1:           0 RPM  (min =    0 RPM, max = 3500 RPM)
edge:         +47.0°C  (crit = +100.0°C, hyst = -273.1°C)
                       (emerg = +105.0°C)
junction:     +48.0°C  (crit = +110.0°C, hyst = -273.1°C)
                       (emerg = +115.0°C)
mem:          +66.0°C  (crit = +108.0°C, hyst = -273.1°C)
                       (emerg = +113.0°C)
PPT:          26.00 W  (cap = 182.00 W)
pwm1:              0%
sclk:           1 GHz 
mclk:         456 MHz 

nvme-pci-0100
Adapter: PCI adapter
Composite:    +40.9°C  (low  =  -0.1°C, high = +82.8°C)
                       (crit = +84.8°C)
Sensor 1:     +40.9°C  (low  = -273.1°C, high = +65261.8°C)
```

## Options
- `-c` ou `--config-file config-file`
  - Spécifier un fichier de configuration
  - Si aucun fichier n'est spécifié, le fichier de configuration par défaut de libsensors est utilisé
  - Utilisez ‘-c /dev/null’ pour désactiver temporairement ce fichier de configuration par défaut

- `-h` ou `--help`
  - Afficher du texte d'aide et quitter

- `-s` ou `--set`
  - Évaluer toutes les instructions `set` dans le fichier de configuration et quitter
  - Vous devez être ‘root’ pour cela
  - Si ce paramètre n'est pas spécifié, aucune instruction `set` n'est évaluée

- `-A` ou `--no-adapter`
  - Ne pas afficher l'adaptateur pour chaque puce

- `-u`
  - Sortie brute
  - Ce mode est adapté au débogage et au traitement ultérieur de la sortie par des scripts
  - Il est également utile lors de la création d’un fichier de configuration car il montre les noms d’entrée bruts qui doivent être référencés dans le fichier de configuration

- `-j`
  - Sortie JSON

- `-J`
  - Nouvelle sortie JSON
  - Ce mode est adapté au traitement ultérieur de la sortie par des scripts

- `-v` ou `--version`
  - Afficher la version du programme et quitter

- `-f` ou `--fahrenheit`
  - Afficher les températures en degrés Fahrenheit au lieu de Celsius

- `--bus-list`
  - Générer des énoncés de bus adaptés à l’utilisation dans `sensors.conf`
  De tels énoncés de bus ne sont nécessaires que si vous avez plusieurs puces partageant la même adresse sur différents bus du même type
  - Étant donné que les numéros de bus ne sont généralement pas garantis d'être stables au redémarrage, ces énoncés vous permettent de référencer chaque bus par son nom plutôt que par des numéros

- `-n` ou `--allow-no-sensors`
  - Ne pas échouer si aucun capteur n’est trouvé
  - Le message d'erreur sera imprimé dans le journal

## Fichiers
- `/etc/sensors3.conf`
- `/etc/sensors.conf`
  - Le fichier de configuration système
  - Voir `man sensors.conf` pour plus de détails

## Voire aussi
`sensors.conf`, `sensors-detect`

## Auteur
`Frodo Looijaard` et le groupe `lm_sensors` [hwmon.wiki.kernel.org/lm_sensors]