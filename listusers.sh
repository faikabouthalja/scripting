#on place dans le fichier utilisateurs les processus en cours
ps aux --sort -user > utilisateurs.txt
# on crée un fichier dans lequel on ajoute les utilisateurs slmnt
awk 'BEGIN { FS = " " }
    { print  $1 }             
' utilisateurs.txt  > users
# on compte les processus pour chaque user et on ajoute le resultat dans fichier processes
cat users | uniq -c > processes
#pour avoir un affichage lisible qui affiche le nbr de processus pr chaque user
awk 'BEGIN { FS = " " }
    { print $2 " a " $1 " processus en cours" }             
' processes
# on efface les fichiers qu'on a crée
rm utilisateurs.txt users processes
