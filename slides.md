---
title: Die Programmiersprache Gleam
sub_title: Konzepte des funktionalen Programmierparadigma
author: Linus Ziegler
---

Inhalt
========

<!--incremental_lists: true-->
1. Imperativ vs Deklarativ
2. Funktionale Programmierung
3. Die Programmiersprache Gleam
<!--incremental_lists: false-->


<!-- end_slide -->


<!--jump_to_middle-->
Funktionale Programmierung
=====================

<!--end_slide-->

Die verschiedenen Programmierparadigmen
=====================
* Imperative
  - Procedural
  - Object Oriented (OOP)

<!--new_line-->
<!--pause-->
* Declarative
  - Logic Programming
  - **Functional** (FP)

<!--end_slide-->


Imperative Programmierung
========================
# Grundlegende Eigenschaften
- lat. imperare = "anordnen" / "befehlen"
<!--new_line-->
- Das Programm besteht aus einer *Folge von Anweisungen/Befehlen*, die den *State*
  des Programmes **ändern**
<!--new_line-->
- Quellcode legt fest, *was* in *welcher Reihenfolge*, *wie* zu tun ist
<!--new_line-->
- Abstraktes Ausführungsmodell eng an die Ausführung des eigentlichen
  Maschinencodes angelehnt
<!--pause-->
## Zusammenfassend:
> Fokus auf Beschreibung *wie* das gewünschte Ergebnis erreicht werden soll


<!--end_slide-->


Deklarative Programmierung
==========================
# Grundlegende Eigenschaften
- Trennung von *Arbeits- und Steuermechanismen*
<!--new_line-->
- Man beschreibt **was** das Programm mit einer Eingabe macht, aber nicht *wie*
<!--new_line-->
<!--new_line-->
- Geschriebene Programme können als Theorien formaler, mathematischer
  Logik betrachtet werden

<!--pause-->
## Zusammenfassend
> Fokus auf der Beschreibung *was* das Programm erreichen soll, nicht *wie*.


<!--end_slide-->


Bespiel: Imperativ und Deklarativ
=========
# Imperativ
```java {0-100|3-8|9-11|9|10} +exec +line_numbers 
public class Main {
  public static void main(String[] args) {
    String[] names = new String[] {
      "Thomas",
      "Anika", 
      "Marcel", 
      "Laura"
    };
    for (int i = 0; i < names.length; i++) {
      System.out.println(names[i]);
    }
  }
}
```

<!--end_slide-->


Bespiel: Imperativ und Deklarativ
=========
# Deklarativ
```rust {0-12|5-10|12} +exec +line_numbers
import gleam/io
import gleam/list

pub fn main() {
  let names = [
    "Thomas",
    "Anika",
    "Marcel",
    "Laura"
  ]

  list.each(names, io.println)
}
```

<!--end_slide-->
<!--jump_to_middle-->
Funktionale Programmierung
==========================
<!--end_slide-->



Grundkonzepte der funktionalen Programmierung
============================================
# Funktionen
- sind "first-class citizen"
  - sie können..
    - ..Variablen zugewiesen werden
    - ..als Parameter an andere Funktionen übergeben werden
    - ..als Rückgabewert einer Funktion auftreten
<!--new_line-->
<!--pause-->
> Sie werden behandelt wie andere Datentypen (String, int, bool, ..) auch

<!--pause-->

# State
- (Möglichst) kein veränderlicher State (-> "Immutable State")
  - Änderungen des Wertes einer Variable nicht möglich
<!--end_slide-->

Side Effect
============
# Definition
- Wirkung einer Funktion außerhalb von Auswerten und Zurückgeben eines ihrer Parameter
  
=> Veränderung des Programmzustandes
<!--pause-->
```java {1-8|2,5} +line_numbers
public class Counter {
  private int count = 0;

  public void incrementCount() {
    count = count + 1; // <== Side Effect
  }
}
```

<!--end_slide-->

Reine Funktionen
===============
```latex +render
f(x) = x²
```
<!--new_line-->
<!--incremental_lists: true-->
- sind Funktionen im mathematischem Sinne
- deterministisch => bei gleichem Input: **immer** derselbe Output!!
- wesentlich einfacher nachzuvollziehen
- können mathematisch auf Korrekheit überprüft werden
<!--incremental_lists: false-->
<!--new_line-->
<!--pause-->
# **Unreine Funktion**
> Funktionen/Methoden ohne diese Eigenschaften nennt man unrein

<!--end_slide-->
Reine Funktionen - Beispiele
============================
# Beispiel
```java
public int pureMethod(int x) {
  return x * x;
}

public String otherPureMethod(String s) {
  return s.toUpperCase();
}
```

<!--end_slide-->
<!--new_line-->

![image:width:25%](lucy.png)
<!--jump_to_middle-->
<!--new_line-->
Die Programmiersprache Gleam
============================
<!--end_slide-->

Was ist Gleam?
==============
- *funktionale* Sprache
- bietet eine simple Syntax 
- ist einfach zu lernen / nutzen
- sehr ausdrucksstark und expressiv
- Compiler hilft stark bei der Entwicklung

<!--end_slide-->
Syntax
======
# Zuweisungen
<!--column_layout: [1,1]-->
<!--column: 0-->
## Gleam
- durch das Keyword `let`
```rust +line_numbers
let intValue: Int = 69

let floatValue: Float = 4.20

let boolValue: Bool = True

let stringValue: String = "Hello"
```

<!--column: 1-->
## Java
- kein spezielles Keyword
```java
int intValue = 69;

float intValue = 4.20f;

boolean boolValue = true;

String stringValue = "Hello";
```

<!--end_slide-->
Syntax
======
# Zuweisung
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam
- Angabe des Typs **optional** ("type inference")
```rust +line_numbers
let intValue = 420
let stringValue = "Hello"
```
<!--column: 1-->
<!--pause-->
## Java
- seit Java 10
<!--new_line-->
```rust +line_numbers
var intValue = 420;
var stringValue = "Hello";
```

<!--end_slide-->


Syntax
======
# Funktionsdefinition
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam
- mit dem Keyword `fn`
- kein `return` Keyword -> letzter Ausdruck ist Rückgabewert
```rust +line_numbers
import gleam/io

fn add(a: Int, b: Int) -> Int {
  a + b
}
```

<!--column: 1-->

## Java
- Rückgabe durch `return` Keyword
<!--new_line-->
```java {2-9|1-10} +line_numbers
public class SomeClass {
  // private method
  private int add(int a, int b) {
    return a + b;
  }
}
```

<!--end_slide-->

Syntax
================
# Controlflow

<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam (Boolean)
- mit dem `case` Keyword
- ist selbst ein *Ausdruck*
```rust {1-9|3-6|4|5|2|8} +line_numbers
fn negate(value: Bool) {
  let negated = 
    case value {
      True -> False
      False -> True
    }

  negated
}
```

<!--column: 1-->
## Java (Boolean)
- mit dem `if` Keyword
- ist kein *Ausdruck*
```java {1-9|1|2|3|4|6|8} +line_numbers
public boolean negate(boolean value) {
  boolean negated;
  if (value) {
    negated = false;
  } else {
    negated = true;
  }
  return negated;
}
```

<!--end_slide-->

Syntax
================
# Controlflow
- mit dem `case` Keyword
- ist selbst ein *Ausdruck*

```rust +line_numbers
fn negate(value: Bool) {
  case value {
    True -> False
    False -> True
  }
}
```

<!--end_slide-->

Syntax
================

# Controlflow
<!--column_layout: [1,1]-->
<!--column: 0-->
## Gleam (case)
- mit dem `case` Keyword
- ähnlich wie switch-case in Java
- im Gegensatz zu switch-case "exhaustive"
- ist selbst ein *Ausdruck*
```js {1-11|3|4|5|6|9|2|11|3-10} +line_numbers 
fn number_to_string(x: Int) -> String {
  let text = 
    case x {
      0 -> "Null"
      1 -> "Eins"
      2 -> "Zwei"

      // zwingend nötig!
      _ -> "Andere Zahl"
    }
  text
}
```
<!--column: 1-->
## Java
- mit `if`, `switch-case`
- `if` und `switch-case` sind *kein Ausdruck*
- `switch-case` ist nicht *exhaustive*

<!--new_line-->

```java {1-11|2|3|4|5|6|8|10|3-9} +line_numbers
public String numberToString(int x) {
  String text;
  switch(x) {
    case 0: text = "Null"; break;
    case 1: text = "Eins"; break;
    case 2: text = "Zwei"; break;
    // nicht zwingend nötig
    default: text = "Andere Zahl"; break;
  }
  return text;
}
```

<!--end_slide-->

Aufgabe - Funktionsdefinition und Case-Expression
=======
# Übersetze die folgende Java Methode in Gleam
```java
public int factorial(int x) {
  if (x <= 1) {
    return 1;
  } else {
    return x * factorial(x - 1);
  }
}
```

## Hilfe
<!--column_layout: [1, 1]-->
<!--column: 0-->
- "if" Abfragen
```zig
case some_bool {
  True -> // ...
  False -> // ...
}
```
<!--column: 1-->
- Funktionen definieren
```rust
fn name(value: Int) -> Int {
  // ...
}
```

<!--end_slide-->
Aufgabe
# Lösung
```rust {1-6|1|2|3|4|2-5} +line_numbers
fn factorial(x: Int) -> Int {
  case x <= 1 {
    True -> 1
    False -> x * factorial(x - 1)
  }
}
```

<!--end_slide-->
Syntax
======
# Listen
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam
- mit eckigen Klammern `[]`
```rust +line_numbers
let names = [
  "Thomas",
  "Alex",
  "Maurice",
  "Johanna"
]
```

<!--column: 1-->

## Java
- Mit der Klasse `ArrayList`

```java +line_numbers
ArrayList<String> names 
  = new ArrayList<>();
names.add("Thomas");
names.add("Alex");
names.add("Maurice");
names.add("Johanna");
```

<!--end_slide-->
Syntax
======

# Schleifen
## Gleam
<!--pause-->
- es gibt keine For-/While-Schleifen
  -> traditionelle Schleifen setzen veränderbare Variablen voraus

<!--new_line-->
- man nutzt Rekursion

<!--end_slide-->

Syntax
======

# Schleifen
## Beispiel
- eine Funktion `print_list`, die uns alle Elemente einer Liste auf die Konsole ausgibt.
```rust
pub fn main() {
  let names = [
    "Thomas",
    "Alicia",
    "Bob",
    "Johanna"
  ]
  print_list(names)
}
```

<!--end_slide-->

Syntax
======

# Rekursion + *Pattern Matching*
## Gleam
```rust {1-210|3|4|6|6-9|8|11|1-21} +line_numbers
import gleam/io

fn print_list(name_list: List(String)) -> Nil {
  case name_list { // Pattern Match

    [name, ..rest] -> {
      io.println(name)
      print_list(rest) // Rekursiver Aufruf
    }

    [] -> Nil // Abbruchbedingung

  }
}
```
<!--end_slide-->
Aufgabe
=======

# Rekursion
## Gleam

```rust
pub fn main() {
  let names = [
    "Thomas",
    "Alicia",
    "Bob",
    "Johanna"
  ]
  print_list(names)
}
```

<!--end_slide-->
Aufgabe
=======

1. Erweitere die Funktion `print_list` um einen weiteren Parameter `f` vom Typen
`fn(String) -> Nil`.
2. Tausche `io.println` mit `f` aus

```rust
fn print_list(name_list: List(String)) {
  case name_list {

    [name, ..rest] -> {
      io.println(name)
      print_list(rest)
    }

    [] -> Nil // Abbruchbedingung

  }
}
```
<!--end_slide-->
Aufgabe
=======
# Lösung
```rust
fn print_list(name_list: List(String), f: fn(String) -> Nil) {
  case name_list {

    [name, ..rest] -> {
      f(name)
      print_list(rest, f)
    }

    [] -> Nil // Abbruchbedingung
  }
}
```

<!--end_slide-->
Aufgabe
=======

```rust
pub fn main() {
  let names = [
    "Thomas",
    "Anika", 
    "Marcel", 
    "Laura"
  ]
  print_list(names, io.println)
}
```
<!--pause-->
- Dieselbe Funktion wie zu Beginn: `list.each`

<!--end_slide-->
Aufgabe
=======

```rust
import gleam/list

pub fn main() {
  let names = [
    "Thomas",
    "Anika", 
    "Marcel", 
    "Laura"
  ]
  list.each(names, io.println)
}
```

<!--end_slide-->
Listenoperationen
=================
# Higher-order Function
- Funktionen, die andere Funktionen als Parameter nehmen
- Essentieller Part der funktionellen Programmierung
- Funktionen für Listen liegen im Modul `gleam/list`

<!--pause-->
## Map Funktion
```rust
import gleam/list

fn multiply_by_two(x: Int) {
  x * 2
}

pub fn main() {
  let nums = [ 1, 2, 3, 4 ]
  let transformed_list = list.map(nums, multiply_by_two)
  io.debug(transformed_list) // -> [ 2, 4, 6, 8 ]
}
```

<!--end_slide-->

Listenoperationen
=================
# Higher-order Function
## Reduce Funktion
- "reduziert" eine Liste zu einem Wert einzigen Wert
```rust
import gleam/list

fn add(a: Int, b: Int) {
  a + b
}

pub fn main() {
  let nums = [ 1, 2, 3, 4 ]
  let reduced = list.reduce(nums, add)
  io.debug(reduced) // -> Ok(10)
}
```

<!--end_slide-->

Eigene Datentypen
=================
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam (Record)
- sog. *Algebraische Datentypen*
```rust +line_numbers
type SomeType {
  // Constructor
  SomeType(field: Int)
}
// Typ instanziieren
fn some_function() {
  let some_type = SomeType(24)
}
```

<!--column: 1-->
## Java (Class)
<!--new_line-->
<!--new_line-->

```java +line_numbers
public class SomeType {
  int field;

  // Constructor
  public SomeType(int value) {
    this.field = value;
  }
}
```

<!--end_slide-->
Eigene Datentypen
=================
# Ziel: Die Person Erik um ein Jahr altern lassen
## Gleam (Record)
```rust +line_numbers
type Person {
  Person(name: String, age: Int)
}

pub fn main() {
  let erik: Person = Person("Erik", 24)

  io.debug(erik.age) // 24
}
```
<!--end_slide-->
Eigene Datentypen
=================

## Gleam (Record)
```rust {8} +line_numbers
type Person {
  Person(name: String, age: Int)
}

pub fn main() {
  let erik: Person = Person("Erik", 24)

  erik.age = erik.age + 1

  io.debug(erik.age) // 25?
}
```
<!--pause-->
> Funktioniert nicht! Variablen sowie Felder von Records sind unveränderlich

<!--end_slide-->

Eigene Datentypen
=================
## Gleam (Record) 
```rust {8-11} +line_numbers
type Person {
  Person(name: String, age: Int)
}

pub fn main() {
  let erik: Person = Person("Erik", 24)

  let erik: Person = Person(
    erik.name,
    erik.age + 1
  )

  io.debug(erik.age) // -> 25
}
```
- Es muss ein neuer Wert vom Typ `Person` mit den veränderten Feldern erstellt
  werden
<!--pause-->
- Nachteil: Gerade bei komplexen Datenstrukturen kann dies negative Folgen haben

<!--end_slide-->

Eigene Datentypen
=================
# Sum Types | Variant Types
## Gleam
<!--column_layout: [1, 1]-->
<!--column: 0-->
```rust +line_numbers
type Person {
  Teacher(name: String)
  Student(name: String, grade: Int)
}
```
<!--pause-->

```rust +line_numbers
fn new_teacher() -> Person {
  Teacher("Hr. Urner")
}

fn new_student() -> Person {
  Student("Vincent", 12)
}
```
<!--column: 1-->
- der Typ `Person` kann in **einer** von 2 *Varianten* auftreten
  1. Teacher mit einem Namen
  2. Student mit Namen und Jahrgang

<!--end_slide-->

# Sum Types | Variant Types
## Gleam 
```rust +line_numbers
type Person {
  Teacher(name: String)
  Student(name: String, grade: Int)
}

pub fn main() {
  let person = Student("Vincent", 12)

  io.println(person.name)

  // 🚨🚨
  io.debug(person.grade) // <== 💥Fehler!!💥
  // 🚨🚨
}
```
<!--pause-->
- Geht nicht, da das Feld "grade" **nur in einer Variante** von Person vorhanden ist
<!--pause-->

> Ein Feld muss in allen Varianten vorhanden sein, um "direkt darauf zugreifen" zu können

<!--end_slide-->

Eigene Datentypen
=================

# Sum Types + Pattern Matching
## Gleam

```rust {1-16|6|7|8|9|10|11|12|7-14} +line_numbers
type Person {
  Teacher(name: String)
  Student(name: String, grade: Int)
}

fn print_person(person: Person) {
  case person {
    Teacher(name) -> io.println(name)
    Student(name, grade) -> {
      io.println(name)
      let grade = int.to_string(grade)
      io.println(name)
    }
  }
}
```

<!--end_slide-->
Sum Types in action
===================
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam
```rust
fn divide(x: Int, y: Int) -> Int {
  x / y
}
```
<!--column: 1-->
## Java
```java
public int divide(int x, int y) {
  return x / y;
}
```
<!--reset_layout-->

### Welche Probleme könnten auftreten?
<!--pause-->
- kein Schutz gegen den Fall `y = 0`
  - Java: `ArithmeticPointerException` 💥 -> `int -> int` gelogen
  - Gleam: Division mit 0 ist definiert als 0

<!--end_slide-->

Sum Types in action
===================
# Mögliche Lösungen

```rust +line_numbers
fn divide(x: Int, y: Int) -> Int {
  x / y
}
```

## Gleam
- Datentyp des Funktionsparameters `y` ändern
```rust
fn divide(x: Int, y: NonZeroInt) -> Int {
  // ...
}
```
<!--end_slide-->

# Mögliche Lösung
## Gleam
```rust
fn divide(x: Int, y: Int) -> MagicType {
  // ...
}

```
<!--pause-->
<!--new_line-->
- Ein Datentyp, der entweder einen Wert hat (Division erfolgreich)
  **oder** `Undefiniert` ist

<!--column_layout: [1, 1]-->
<!--column: 0-->
```rust +line_numbers
type MaybeNumber {
  SomeNumber(Int) // Es gibt ein Ergebnis
  Undefined       // Es gibt kein Ergebnis
}
```
<!--column: 1-->
<!--new_line-->
- der Typ `MaybeNumber` ist entweder `SomeNumber` **oder** Undefiniert

<!--reset_layout-->
<!--end_slide-->
# Lösung
## Gleam
```rust {1-11|7|8|9} +line_numbers
type MaybeNumber {
  SomeNumber(Int) // Es gibt ein Ergebnis
  Undefined       // Es gibt kein Ergebnis
}

fn divide(x: Int, y: Int) -> MaybeNumber {
  case y {
    0 -> Undefined // 👎
    y -> SomeNumber(x / y) // 👍
  }
}
```
<!--end_slide-->
# Lösung
## Gleam

```rust {1-15|5|7|8|9-10|13|1-15} +line_numbers
import gleam/int
import gleam/io

pub fn main() {
  let result: MaybeNumber = divide(42, 0)

  case result {
    SomeNumber(value) -> {
      let value = int.to_string(value)
      io.println(value)
    }

    Undefined -> io.println("💥")
  }
}
```

<!--end_slide-->
Option-Type
===========
```rust
pub type Option(a) {
  Some(a)
  None
} 
```
----
<!--column_layout: [1, 1]-->
<!--column: 0-->
- nahezu in jeder funktionalen Sprache vorhanden
- wird teils auch von imperativen Sprachen umgesetzt
- keine `NullpointerException`

<!--column: 1-->
<!--pause-->

# Haskell (whitepaper language)
```haskell
data Maybe a = Nothing | Just a
```
<!--pause-->
# Rust
```rust
pub enum Option<T> {
  Some(T),
  None,
}
```
<!--reset_layout-->

<!--end_slide-->

Result-Type
===========
<!--column_layout: [1, 1]-->
<!--column: 0-->
## Gleam
```rust {9|10-17}
import gleam/io

pub type Result(a, b) {
  Ok(a)
  Error(b)
}

pub fn main() {
  let res: Result(Int, String) = Ok(2)
  case res {
    Ok(value) -> {
      // ..
    }
    Error(message) -> {
      // ..
    }
  }
}
```
<!--column: 1-->
**Varianten**
1. `Ok`    -> Erfolgreiches Ergebnis: Variante beinhaltet Ergebnis
2. `Error` -> Ein Fehler ist aufgetreten: Variante beinhaltet `Fehlernachricht`

<!--reset_layout-->

<!--end_slide-->
<!--jump_to_middle-->
Danke fürs zuhören
==================
