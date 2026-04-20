# Lernfeld 07: Administration und Betrieb (AWE)

DE
## Lernziele
- Betrieb und Wartung von Anwendungen verstehen
- Monitoring und Logging einsetzen
- Einfache Automatisierung nutzen

## Muss koennen
- Logs lesen und relevante Werte erkennen
- Einfaches Backup/Restore erklaeren
- Skripte fuer Routineaufgaben schreiben

## AP1 Bezug (AWE)
- Grundlagen zu Betrieb und Wartung

## AP2 Bezug (AWE)
- Betriebskonzepte, Verfuegbarkeit, Automatisierung

## Uebungen
- Erstelle ein Log-Analyse-Beispiel
- Schreibe ein kleines Backup-Skript (Pseudo)
- Beschreibe Monitoring-Kennzahlen
- Baue eine einfache CPS-Regelung mit Sensor, LED und Luefter

## Checkliste
- Logs verstanden
- Backup-Plan vorhanden
- Automatisierungsidee dokumentiert
- Sensorwerte erfassen und Aktoren regelbasiert schalten koennen

## CPS / Arduino Praxisbezug
### Beispiel: Temperaturregelung mit NTC, LED und Luefter
- Sensor: NTC an `A0`
- Aktoren: LED an `Pin 6`, Luefter an `Pin 10`
- Logik: Zweipunktregelung mit Hysterese
- Ziel: Temperatur messen, auswerten und den Luefter automatisch schalten

### Fachlicher Bezug zu LF7
- Messwerte ueberwachen
- Systemzustaende protokollieren
- Einfache Automatisierung praktisch umsetzen
- Fehlerquellen im Betrieb erkennen und beheben

### Wichtige Punkte fuer AP1/AP2
- Unterschied zwischen Sensor, Verarbeitung und Aktor verstehen
- Ablauf einer einfachen Steuerung erklaeren koennen
- Schwellwert und Hysterese fachlich begruenden
- Typische Fehler in Programmlogik und Verdrahtung erkennen

### Verknuepfte Notiz
- Siehe `Notes/2026-04-20_CPS_Temperaturregelung.md`

EN
## Learning goals
- Operate applications with logging and backups

## Must know
- Logs, backups, simple automation

## AP1/AP2 linkage
- Ops basics and availability concepts
