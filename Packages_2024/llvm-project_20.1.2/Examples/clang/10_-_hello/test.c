  #include <stdio.h>

  // 1. Die Funktion wird definiert
  void gruesseDich() {
      printf("Hallo! Die Funktion wurde erfolgreich aufgerufen.\n");
      int i = 123;
      printf("Ein Integer %d", i);
  }

  int main() {
      printf("Start des Programms.\n");

      // 2. Die Funktion wird hier aufgerufen
      gruesseDich();

      printf("Ende des Programms.\n");
      return 0;
  }

