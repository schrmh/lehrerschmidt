#!/bin/bash
main() {
    echo "Lehrer-Multiplikation ab 20"
    echo "---------------------------"
    echo "Beta-Version++ (mit Optionen): "
    echo " - Nur gleiche Zahlen"
    echo " - Nur Zahlen mit den gleichen Zehnerstellen"
    echo " - Nur Zahlen bis inklusive 99"
    echo "---------------------------"
    echo "Links und rechts gleiche Zahl:"
    echo "./lehrermultiplikation.sh gleich"
    echo " Testen von gleichen Zahlen innerhalb eines Bereiches:"
    echo "./lehrermultiplikation.sh gleich 31 36"
    echo " Testen von Zahlen mit gleichen Zehnern:"
    echo "./lehrermultiplikation.sh beginnend"
    echo "Alle Zahlen, die mit x beginnen (z.B. 5 für 50 bis 59):"
    echo "./lehrermultiplikation.sh beginnend 50"
    echo "Manuelle Eingabe:"
    echo "./lehrermultiplikation.sh manuell"
    echo "---------------------------"
    echo "Geschrieben am 09.05.2019 von derberg (matrix.org-Nickname)"

    if [ "$1" = "regeln" ]
    then
    echo "1. Schritt: "
    echo	 "Links: Zahl addieren mit Einer der anderen Zahl"
    echo	 "Rechts: Einer beider Zahlen multiplizieren"
    echo "2. Schritt: Die Zahlen \"zusammenschieben\":"
    echo	 "2. Zahl mit nur einer Stelle einfach anhängen"
    echo	 "2. Zahl mit zwei Stellen: Zehner mit Einer von 1. Zahl addieren"
    echo "3. Schritt: Ergebnis mit den Zehnern multiplizieren"
    echo "4. Schritt: Das rechte Ergebnis aus Einern aus Schritt 1"
    echo "            abziehen mal der Zehnerstelle der Ursprungszahl-1"

    else
    if [ "$1" = "manuell" ] #WIP
    then
    read -p "Zahl eingeben: " start
    ende=$start
    #Fragen ob gleiche Zahlen oder jede Zahl
    #Abfragen der Range
    #Vielleicht auch jede x.Zahl oder jede Zahl endend auf x, enthaltend x oder beginnend mit x..
    elif [ "$1" = "gleich" ]
    then
    if [ "$2" = "" ]; then start=20; else start=$2; fi
    if [ "$3" = "" ]; then ende=99; else ende=$3; fi
    elif [ "$1" = "beginnend" ] #wird unten nochmal abgefragt.
    then
        echo ""
    else
    #Hmmm
        read -p "Linke Zahl eingeben: " links
        read -p "Rechte Zahl eingeben: " rechts
        start=0
        ende=0
    fi

    
    #beginnend
    if [ "$1" = "beginnend" ]
    then
        ende=99
        if [ "$2" = "" ]; then start=20; 
        else start=$2; ende=$(expr $start + 9); fi
        if [ "$3" = "" ]; then ende=$ende; else ende=$3; fi
        
        for (( j=$start; j<=$ende; j++ ))
        do
            b="${j:0:1}0" #Beginnt mit Zehner
            for (( i=$b; i<=$(expr $b + 9); i++ ))
            do
                rechnen $i $j
            done
        done
    else
        for (( i=$start; i<=$ende; i++ ))
        do
            #Eine Zahl
            if [ "$1" != ""]
            then
                links=$i
                rechts=$i
            fi
            
            rechnen $links $rechts
        done
    fi

    fi
}



rechnen() {
    #Funktions-Parameter:
    links=$1
    rechts=$2

    
    ((c++))
    #0. Schritt
    links_zehner="${links:0:1}" #variable:offset:länge
    links_einer="${links:1:1}"
    rechts_zehner="${rechts:0:1}" #variable:offset:länge
    rechts_einer="${rechts:1:1}"
    echo $c". Test" $links "*" $rechts

    #1. Schritt
    zahl_links=$(expr $links + $rechts_einer)
    zahl_rechts=$(expr $links_einer \* $rechts_einer) 
    echo $c".1" $zahl_links $zahl_rechts
    
    #2. Schritt
    if [[ $(expr length $zahl_rechts) = "1" ]]; then #Nur eine Stelle?
    zahl_rechts=0$zahl_rechts #Man könnte auch immer 0en hinzufügen und dann von hinten gehen..
    fi
    zahl_kombiniert=$(expr $zahl_links + "${zahl_rechts:0:1}")
    zahl_kombiniert=$zahl_kombiniert"${zahl_rechts:1:1}" #Zeichen hinzufügen
    echo $c".2" $zahl_kombiniert
    
    #3. Schritt
    zahl_malzehner=$(expr $zahl_kombiniert \* $links_zehner) #links_zehner und rechts_zehner sind allerdings wohl auch gleich
    echo $c".3" $zahl_kombiniert"*"$links_zehner"="$zahl_malzehner
    
    ##4. Schritt
    #zahl_ohne_einerabweichung=$(expr $zahl_malzehner - $zahl_rechts)
    #echo $zahl_ohne_einerabweichung "(Erwartet:" $(expr $zahl \* $zahl)")"

    #4. Schritt
    zahl_zehner_minus1=$(expr $links_zehner - 1)
    zahl_abweichung=$(expr $zahl_rechts \* $zahl_zehner_minus1)
    zahl_endergebnis=$(expr $zahl_malzehner - $zahl_abweichung)
    echo $c".4" $zahl_malzehner"-"$zahl_zehner_minus1"*"$zahl_rechts"="$zahl_endergebnis "(Erwartet:" $(expr $links \* $rechts)")"

    #5. Schritt
    if [[ $zahl_endergebnis = $(expr $links \* $rechts) ]]; then #Stimmt das Endergebnis?
    echo $c".5 Stimmt!"
    else
    echo $c".5 Stimmt nicht!"
    echo $links "*" $rechts >> error.txt
    fi
    echo " "
}

main "$@"
