# CPS Arduino Project: Temperaturregelung mit NTC und Luefter

## Projektziel
Ein einfacher CPS-Aufbau mit Sensor, Verarbeitung und Aktor:
- NTC misst die Temperatur
- Arduino berechnet `tempC`
- Luefter und LED werden ueber eine Zweipunktregelung mit Hysterese gesteuert

## Komponenten
- Arduino Uno
- NTC-Sensor
- LED
- DC-Luefter
- Widerstaende
- Breadboard und Jumper-Kabel

## Pins
- `A0`: NTC-Spannungsteiler
- `6`: LED
- `10`: Luefter

## Regelidee
- Solltemperatur: `20.0 C`
- Hysterese: `0.5 C`
- Oberhalb des oberen Grenzwerts wird der Luefter eingeschaltet
- Unterhalb des unteren Grenzwerts wird der Luefter ausgeschaltet

## Lernfokus
- Sensorwert einlesen
- Messwert in Temperatur umrechnen
- Zustandsvariable sauber fuehren
- Automatisierte Aktoransteuerung umsetzen

## Verknuepfung
- Notiz: `Notes/2026-04-20_CPS_Temperaturregelung.md`
- Lernfeld: `courses/lernfeld-07/README.md`
