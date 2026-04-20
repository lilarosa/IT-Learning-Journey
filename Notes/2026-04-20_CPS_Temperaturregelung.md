# 2026-04-20 CPS Lernnotiz: Temperaturregelung mit Arduino, NTC und Luefter

## Kontext
Heute haben wir im Unterricht ein einfaches CPS-/Arduino-Projekt aufgebaut: Ein Temperatursensor misst die aktuelle Temperatur, der Arduino berechnet daraus `tempC` und schaltet bei Ueberschreiten eines Sollwerts einen Luefter ein. Eine LED zeigt den Schaltzustand an.

## Ziel der Uebung
- Analoge Messwerte mit `analogRead()` einlesen
- Temperatur ueber einen NTC-Widerstand berechnen
- Aktoren mit einer Zweipunktregelung ansteuern
- Hysterese verstehen, damit der Luefter nicht staendig an/aus springt

## Aufbau
- Arduino Uno
- NTC-Sensor an `A0`
- LED an `Pin 6`
- Luefter an `Pin 10`
- Vorwiderstaende auf dem Breadboard
- USB-Stromversorgung und serielle Ausgabe ueber `Serial`

## Foto des Aufbaus
![CPS-Aufbau](assets/2026-04-20-cps-aufbau.jpg)

## Steuerlogik
- `SollT = 20` Grad Celsius
- `Hysterese = 0.5`
- Wenn `tempC > 20.5`, dann Luefter EIN
- Wenn `tempC < 19.5`, dann Luefter AUS
- Die Temperatur wird im seriellen Monitor ausgegeben

## Mein Codeansatz
Der heutige Code verwendet:
- `analogRead(A0)` fuer den Sensorwert
- die Beta-Gleichung fuer die Temperaturberechnung
- `millis()` fuer eine Ausgabe alle 2 Sekunden
- `digitalWrite()` fuer Luefter und LED

## Wichtige Lernpunkte aus dem Code
Beim Durchsehen meines Codes sind ein paar typische Lernfehler aufgefallen:

### 1. `ledPin` wurde nicht als Output gesetzt
`pinMode(ledPin, OUTPUT);` fehlt in `setup()`. Ohne diese Zeile arbeitet die LED-Ansteuerung nicht sauber.

### 2. `LeufterAn` wird nie aktualisiert
Die Variable wird zwar in den `if`-Bedingungen abgefragt, aber nach dem Schalten nicht auf `true` oder `false` gesetzt. Dadurch funktioniert die Hysterese logisch nicht korrekt.

### 3. Doppelte serielle Ausgabe
`Serial.println(tempC);` steht einmal im Zeitintervall-Block und danach noch einmal direkt darunter. Dadurch wird die Temperatur doppelt ausgegeben.

### 4. Schutz gegen ungueltige Messwerte fehlt
Wenn `raw == 0`, fuehrt die Rechnung `1023.0 / raw` zu einem Fehler. Solche Randfaelle muessen abgefangen werden.

## Bereinigte Beispielversion
```cpp
const int analogPin = A0;
const int ledPin = 6;
const int luefterPin = 10;

const float sollT = 20.0;
const float hysterese = 0.5;

bool luefterAn = false;
unsigned long lastTime = 0;
const unsigned long intervall = 2000;

const int rFest = 10000;
const int bWert = 3950;
const int r0 = 10000;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(luefterPin, OUTPUT);
}

void loop() {
  int raw = analogRead(analogPin);
  if (raw <= 0) {
    delay(500);
    return;
  }

  float rNtc = rFest * (1023.0 / raw - 1.0);
  float tempK = 1.0 / (1.0 / 298.15 + (1.0 / bWert) * log(rNtc / r0));
  float tempC = tempK - 273.15;

  if (millis() - lastTime >= intervall) {
    Serial.println(tempC);
    lastTime = millis();
  }

  if (!luefterAn && tempC > sollT + hysterese) {
    digitalWrite(luefterPin, HIGH);
    digitalWrite(ledPin, HIGH);
    luefterAn = true;
  } else if (luefterAn && tempC < sollT - hysterese) {
    digitalWrite(luefterPin, LOW);
    digitalWrite(ledPin, LOW);
    luefterAn = false;
  }

  delay(200);
}
```

## Was ich fachlich verstanden habe
- Ein CPS verbindet Sensorik, Verarbeitung und Aktorik.
- Der Sensor liefert keine Temperatur direkt, sondern einen Messwert, der umgerechnet werden muss.
- Eine Hysterese ist wichtig, um instabiles Schalten zu vermeiden.
- Auch bei kleinen Arduino-Projekten muss man Zustandsvariablen sauber pflegen.

## Bezug zu Lernfeld 07
Dieses Beispiel passt gut zu Lernfeld 07, weil hier Betrieb, Ueberwachung und einfache Automatisierung zusammenkommen:
- Messwerte erfassen
- Systemzustand auswerten
- Aktor automatisch schalten
- Verhalten ueber serielle Ausgabe beobachten

## Naechste Schritte
- Schaltplan sauber dokumentieren
- LED/Luefter-Zustand im seriellen Monitor mitloggen
- Grenzwerte ueber Potentiometer oder Taster veraenderbar machen
- spaeter Alarmfunktion oder Display ergaenzen
