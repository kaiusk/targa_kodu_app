# TargaKodu äpp

### Vaated:
1. sisse logimine (test@tlu.ee ja test123)
2. ülevaate leht (dashboard)
3. detailne vaade
4. kaamera
5. teavitused

Sisselogimine toimub FirebaseAuth'i kasutades
Ülevaate lehel laetakse sisu FirebaseFirestore'st. Kasutasin StreamBuilder'it, mis laeb vaate 
uuesti kui FirebaseFirestore's peaksid andmed muutuma. 
Detailse vaate leht on staatiliste andmetega ja tegilikult midagi ei tee.
Ka kaamera vaade näitab test videot.
Teavituste lehel on andmed samuti staatilised. Sellele lehele panin ka "pull to refresh"
loogika - see lisab lihtsalt uue demo teavituse.


### Kasutatud materjalid:
 - [navigatsioon](https://www.woolha.com/tutorials/flutter-using-navigationbar-widget-examples)
 - [ikoonid](https://fonts.google.com/icons?icon.query=list)
 - [pull to refresh](https://www.geeksforgeeks.org/flutter-implementing-pull-to-refresh/)
