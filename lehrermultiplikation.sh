echo "Lehrer-Multiplikation ab 20"
echo "---------------------------"
echo "Alpha-Version:" 
echo "- Nur gleiche Zahlen"
echo "- Nur Zahlen mit den gleichen Zehnerstellen"
echo "- Nur Zahlen bis 100"
echo "---------------------------"
echo "Geschrieben am 09.05.2019 von derberg (matrix.org-Nickname)"

#0. Schritt
read -p "Zahl eingeben: "  zahl
zahl_zehner="${zahl:0:1}" #variable:offset:länge
zahl_einer="${zahl:1:1}"
echo "1. Test" $zahl "*" $zahl

#1. Schritt
zahl_links=$(expr $zahl + $zahl_einer)
zahl_rechts=$(expr $zahl_einer \* $zahl_einer) 
echo "1.1" $zahl_links $zahl_rechts

#2. Schritt
if [[ $(expr length $zahl_rechts) = "1" ]]; then #Nur eine Stelle?
 zahl_rechts=0$zahl_rechts #Man könnte auch immer 0en hinzufügen und dann von hinten gehen..
fi
zahl_kombiniert=$(expr $zahl_links + "${zahl_rechts:0:1}")
zahl_kombiniert=$zahl_kombiniert"${zahl_rechts:1:1}" #Zeichen hinzufügen
echo "1.2" $zahl_kombiniert

#3. Schritt
zahl_malzehner=$(expr $zahl_kombiniert \* $zahl_zehner) 
echo "1.3" $zahl_kombiniert"*"$zahl_zehner"="$zahl_malzehner

##4. Schritt
#zahl_ohne_einerabweichung=$(expr $zahl_malzehner - $zahl_rechts)
#echo $zahl_ohne_einerabweichung "(Erwartet:" $(expr $zahl \* $zahl)")"

#4. Schritt
zahl_zehner_minus1=$(expr $zahl_zehner - 1)
zahl_abweichung=$(expr $zahl_rechts \* $zahl_zehner_minus1)
zahl_endergebnis=$(expr $zahl_malzehner - $zahl_abweichung)
echo $zahl_endergebnis "(Erwartet:" $(expr $zahl \* $zahl)")"