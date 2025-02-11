# Exemples d'scripts en Bash

## Scripts per fer Bckups

Idea: fer servir el cron per fer els diferents tipus de backup:

* Total
* Diferencial
* Incremental

El backend serà la comanda `tar` amb les opcions `--list-incremental` i `--label`. Un dels arguments serà el tipus de còpia (0 per total, 1 per diferencial i 2 per incremental, com amb l'opció `--label` de `tar`).

En el mateix script puc fer el manteniment de les còpies de stat (rotació).

Faré un altre script per la restauració de les dades.

