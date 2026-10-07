  #include <stdio.h>

  // 1. Die Funktion wird definiert
  void gruesseDich() {
      printf("Hallo! Die Funktion wurde erfolgreich aufgerufen.\n");
      int i = 123;
      printf("Ein Integer %d", i);

      if (i > 5) {  // <-- Das hier ist AUCH ein CXCursor_CompoundStmt!
        printf("Wert if 1");

        if (i > 3) {
          printf("Wert if i>2");
        }

        printf("Wert if 2");
        printf("Wert if 3");
      } else {
        printf("Wert else 1");
        printf("Wert else 2");
        printf("Wert else 3");
      }
      printf("Wert 4");
      printf("Ein Integer %d", i);
  }

  int main() {
      printf("Start des Programms.\n");

      // 2. Die Funktion wird hier aufgerufen
      gruesseDich();

      printf("Ende des Programms.\n");
      return 0;
  }

