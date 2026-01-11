# PS1
- PS1 signifie « Prompt String 1 »
  - Et est une variable d'environnement sous Linux qui définit le format de l'invite de commande principale affichée dans le terminal
- Il détermine l'apparence et le comportement de l'invite, permettant aux utilisateurs de la personnaliser avec des informations telles que le nom d'utilisateur, le nom d'hôte, le répertoire de travail actuel, l'heure, etc
- La variable prend en charge diverses séquences d'échappement telles que :
  - \u pour le nom d'utilisateur,
  - \h pour le nom d'hôte,
  - \w pour le répertoire de travail actuel
  - et \$ pour afficher $ pour les utilisateurs réguliers ou # pour root
## PS1 bash prompt generator
- [bash-prompt-generator.org](https://bash-prompt-generator.org/)
## PS1 exemple
### PS1 exemple commande
```
echo "PS1='\n\[\e[1m\]\[\e[0m\] \[\e[1;2;4m\]\D{%a %H %b %Y}\[\e[0m\]    \[\e[1m\]󰅐\[\e[0m\] \[\e[1m\]\t\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[2m\]\u\[\e[0m\]@\[\e[2m\]\H\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[1m\]\w\n\[\e[0m\] \[\e[1;2;4m\]History\[\e[0m\] \[\e[2m\]n°\[\e[1m\]\!\[\e[0m\] \[\e[1;2m\]=[\[\e[0;1;5m\]\$\[\e[25;2m\]]>\[\e[0m\] '" >> /root/.bashrc
```
### PS1 exemple result
```
📅 jeu. 1 janv. 2026    🕐️ 12:34:56    🧑 admin@arch    📂 ~
📋️ History n°1 =[$]> 
```
