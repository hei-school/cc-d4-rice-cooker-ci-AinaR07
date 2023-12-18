import 'dart:async';
import 'dart:convert';
import 'dart:io';

final rl = stdin;
final input = rl.transform(utf8.decoder);

void afficherMenu() {
  print('X--------X-------X');
  print('Que souhaitez-vous faire?');
  print('X--------X-------X');
  print('1. Cuire du riz');
  print('2. Cuisson à la vapeur');
  print('3. Cuisson des céréales');
  print('4. Cuisson de la soupe');
  print("5. Bouillir de l'eau");
  print('6. Cuisson du dessert');
  print('7. Maintenir au chaud');
  print('8. Quitter');
}

Future<int> choisirOption() async {
  stdout.write('Choisissez une option : ');
  final choix = int.tryParse(await input.first);
  if (choix == null || choix < 1 || choix > 8) {
    throw "Option invalide. Veuillez choisir un nombre entre 1 et 8.";
  } else {
    return choix;
  }
}

Future<void> main() async {
  afficherMenu();
  try {
    final option = await choisirOption();
    switch (option) {
      case 1:
        print('Cuisson du riz en cours...');
        await attendre(5000); // Attendre 5 secondes
        print('Le riz est cuit');
        await attendre(5000); // Attendre 5 secondes
        print('Cuisson terminée');
        break;
      case 2:
        print('Cuisson à la vapeur');
        await attendre(5000); // Attendre 5 secondes
        print('Veuillez Patientez SVP');
        await attendre(5000); // Attendre 5 secondes
        print('Cuisson terminée');
        break;
      case 3:
        print('Cuisson des céréales');
        await attendre(5000); // Attendre 5 secondes
        print('Cuisson terminée');
        await attendre(5000); // Attendre 5 secondes
        print('Ca y est c\'est prêt');
        break;
      case 4:
        print('Cuisson de la soupe');
        await attendre(5000); // Attendre 5 secondes
        print('Cuisson terminée');
        await attendre(5000); // Attendre 5 secondes
        print('La soupe est prête');
        break;
      case 5:
        print("Bouillir de l'eau");
        await attendre(5000); // Attendre 5 secondes
        print('tic tic tic tic');
        await attendre(5000); // Attendre 5 secondes
        print('L eau est chaude');
        break;
      case 6:
        print('Cuisson du dessert...');
        await attendre(5000); // Attendre 5 secondes
        print('Cuisson terminée');
        await attendre(5000); // Attendre 5 secondes
        print('C\'est prêt');
        break;
      case 7:
        print('Maintenir au chaud');
        await attendre(5000); // Attendre 5 secondes
        break;
      case 8:
        print('Au revoir et bon appétit !!!');
        return;
    }
  } catch (error) {
    print(error);
  }
}

Future<void> attendre(int ms) async {
  await Future.delayed(Duration(milliseconds: ms));
}

void startProgram() {
  main();
}