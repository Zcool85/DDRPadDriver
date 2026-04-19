# Introduction

Projet de création d'un tapis de dance pour le jeu Dance Dance Revolution.

Ce tapis est utilisable sur un PC pour des jeux comme `Stepmania` ou `Outfox`, mais également sur
console Playstation (1 et 2).

Le firmware est à base de microcontroller AVR ©.

Les touches du tapis peuvent être illuminées. Dans ce cas, il convient d'ajouter une alimentation externe pour les LED (CAO `Power_Supply`). Cette alimentation est inutile si le tapis est utilisé sans éclairage.

## Licence

Le présent projet est sous licence MIT (Cf. [License](LICENSE.md)).

ATTENTION : Le Firmware utilise une librairie tierce V-USB pour la connexion USB vers un PC.
Cette librairie est soumie à une licnece GNU General Public License Version 2 (GPL). Merci
de consulter a license de cette bibliothèque en cas de modification.

Cf. [Librairie V-USB](https://obdev.at/products/vusb/index.html).

## Organisation du repo

Le répertoire `CAD` contient les fichiers de CAO des diférents composants :
- `Power_Supply` : Fichier CAO utilisé pour le bloc d'alimentation des tapis
- `For_Childrens` : Fichier CAO utilisé pour créer un tapis à la taille d'un enfant (~6ans)
- `For_Adults` : Fichier CAO utilisé pour créer un tapis pour adulte
- `Fonts` : Répertoire contenant les fonts utilisées par les fichiers de CAO

Le répertoire `Schematics` contient le shéma du circuit électronique du tapis.

Le répertoire `Datasheets` contient tous les datasheets des composants utilisés par le circuit électronique.

Le répertoire `Firmware` contient le code complet du firmware du microcontroller présent dans le circtui électronique.

Le répertoire `Documentation` Contient un peu de documentation permettant de comprendre comment fonctionne les trames d'une manette PS2.
