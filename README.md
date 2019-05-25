# Ergänzungen, Skripte und Gedanken zu Videos von Lehrerschmidt  
-------------------------------------------------------------
## Skripte ausführen:  
### Online: 
**[Online-Bash-Compiler](https://repl.it/languages/bash)**  
Skript in das mittlere Fenster reinkopieren und auf "`run`" klicken  
**Optionen:** Im rechten Fenster z.B. `source main.sh gleich 31 36` oder `source main.sh beginnend 7`
### Offline:  
**Bash-Shell bekommen:**  
  * **a) Windows: [WSL](https://docs.microsoft.com/de-de/windows/wsl/install-win10) installieren** 
  * **b) Windows: [Cygwin](https://www.cygwin.com/) oder Ähnliches nutzen**   
  * **c) GNU/Linux-Distribution nutzen** | Beliebte Distros: [Ubuntu](https://www.heise.de/tipps-tricks/Wie-installiert-man-Ubuntu-auf-seinem-PC-3877156.html) [Manjaro](https://www.heise.de/newsticker/meldung/Manjaro-18-0-Topaktuelles-Arch-Linux-aber-leicht-zu-konfigurieren-4212116.html) [Arch Linux](https://wiki.archlinux.de/title/Anleitung_f%C3%BCr_Einsteiger) | [Videos](http://unicks.eu)  
  * **d) Android: Terminal-Emulator wie z.B. [Termux](https://termux.com/) installieren**  
  
**Skripte ausführbar machen:** sudo chmod +x `skriptname.sh`   
**Skripte ausführen:** ./skriptname.sh  


## Videos  
[GEHEIM!! Multiplizieren - Die Lehrervariante - geniales Kopfrechnen - superschnell | Mathematik](https://www.youtube.com/watch?v=CqFApSTSMRM):  
**Behauptung von Lehrerschmidt:** Das im Video gezeigte Verfahren funktioniert nur mit Zahlen von 10 bis inklusive 19.   
**Beobachtung:** [Mit Modifikationen ist es wohl doch skalierbar.](https://www.youtube.com/watch?v=CqFApSTSMRM&lc=UgxHFN6B_lyU1hF15lZ4AaABAg)  
**Beweis-Skript:** [lehrermultiplikation.sh](https://github.com/schrmh/lehrerschmidt/blob/master/lehrermultiplikation.sh)  

