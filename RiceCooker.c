#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void afficherMenu() {
    printf("X--------X-------X\n");
    printf("Que souhaitez-vous faire?\n");
    printf("X--------X-------X\n");
    printf("1. Cuire du riz\n");
    printf("2. Cuisson à la vapeur\n");
    printf("3. Cuisson des céréales\n");
    printf("4. Cuisson de la soupe\n");
    printf("5. Bouillir de l'eau\n");
    printf("6. Cuisson du dessert\n");
    printf("7. Maintenir au chaud\n");
    printf("8. Quitter\n");
}

int choisirOption() {
    int option;
    printf("Choisissez une option : ");
    scanf("%d", &option);
    if (option < 1 || option > 8) {
        printf("Option invalide. Veuillez choisir un nombre entre 1 et 8.\n");
        exit(1);
    }
    return option;
}

void attendre(int ms) {
    usleep(ms * 1000); // Attendre en millisecondes
}

int main() {
    int option;
    while (1) {
        afficherMenu();
        option = choisirOption();
        switch (option) {
            case 1:
                printf("Cuisson du riz en cours...\n");
                attendre(5000); 
                printf("Le riz est cuit\n");
                attendre(5000); 
                printf("Cuisson terminée\n");
                break;
            case 2:
                printf("Cuisson à la vapeur\n");
                attendre(5000); 
                printf("Veuillez Patientez SVP\n");
                attendre(5000); 
                printf("Cuisson terminée\n");
                break;
            case 3:
                printf("Cuisson des céréales\n");
                attendre(5000); 
                printf("Cuisson terminée\n");
                attendre(5000); 
                printf("Ca y est c'est prêt\n");
                break;
            case 4:
                printf("Cuisson de la soupe\n");
                attendre(5000); 
                printf("Cuisson terminée\n");
                attendre(5000); 
                printf("La soupe est prête\n");
                break;
            case 5:
                printf("Bouillir de l'eau\n");
                attendre(5000); 
                printf("tic tic tic tic\n");
                attendre(5000); 
                printf("L'eau est chaude\n");
                break;
            case 6:
                printf("Cuisson du dessert...\n");
                attendre(5000); 
                printf("Cuisson terminée\n");
                attendre(5000); 
                printf("C'est prêt\n");
                break;
            case 7:
                printf("Maintenir au chaud\n");
                attendre(5000); 
                break;
            case 8:
                printf("Au revoir et bon appétit !!!\n");
                return 0;
            default:
                printf("Option non reconnue\n");
                break;
        }
    }
    return 0;
}