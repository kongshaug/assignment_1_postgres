
#### Joint-Table Strategy:
Superklassens tabeller indeholder alle de delte værdier

### Pros:
- Der er færre kolonner end i table per class
- Man kan implimentere not null på alle tabeller og derigennem sikre data integritet.
### Cons:
- Alle quieries kræver joins – gær statments lidt langsommere 
-det er den mest komplekse at sætte op


#### Table-Per-Class Strategy 

### Pros:
- Du kan lave queries generelt på tværs af klasse
- queries for at hente entiteter er nemme 
- metoden giver logisk mening og er nem at forstå 

### Cons:
- Denne metode bliver nemt meget kompleks
- Du har kolonner der går igen i flere klasser 
- sql statements bliver komplekse og kan have lav performance 

#### Single-table strategy

### Pros:
- Hurtigst at sætte op
- Simpel at sætte op at implimentere 
- Det er mere effetivt at lave queries generelt på tværs af klasse 
- Queries behøver ikke nogen join statments 

### Cons:
- Svært at opdatere med nye kolonner 
- Du kan ikke sætte værdier der ikke er delt af klasserne til not null da værdierne ikke bruges i alle klasserne 

På baggrund af de fordele og ulemper vi har fundet på de tre strategier, har vi valgt at udarbejde databasen med en Joint-Table Strategy. 

#### Opgaven-delen med Java kode
Vi har ikke lavet den sidste del af opgaven, der indbefatter en Java applikation med en forbindelse til databasen. 
