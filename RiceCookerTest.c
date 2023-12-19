#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include "RiceCooker.c"

void testChoisirOption() {
    // Tester le choix d'une option valide
    int optionValide = 3;
    int resultat = choisirOption(&optionValide);
    assert(resultat == 3);

    // Tester le choix d'une option invalide
    int optionInvalide = 10;
    assert(!"Le test d'option invalide a échoué : l'option 10 n'est pas valide");
}

void testAttendre() {
    int duree = 5000;
    attendre(duree);
}

int main() {
    printf("Lancement des tests pour RiceCooker...\n");

    // Exécuter les tests
    testChoisirOption();
    testAttendre();

    // Si aucun assert n'a échoué, les tests sont réussis
    printf("Tous les tests ont été exécutés avec succès pour RiceCooker.\n");

    return 0;
}
