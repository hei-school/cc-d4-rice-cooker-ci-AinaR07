import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  group('RiceCooker tests', () {
    test('Test afficherMenu()', () {
      var output = '';

      void captureOutput() {
        var oldPrint = print;
        print = (Object? x) {
          output += x.toString() + '\n';
        };
        afficherMenu();
        print = oldPrint;
      }

      captureOutput();

      expect(output, contains('Que souhaitez-vous faire?'));
      expect(output, contains('1. Cuire du riz'));
  
    });

    test('Test choisirOption() avec une option valide', () async {
      final fakeInput = StreamController<String>();
      final lines = Stream<String>.fromIterable(['2']); // Simule une entrée utilisateur

      final oldInput = input;
      rl.transform(utf8.decoder).listen(fakeInput.add);
      fakeInput.stream.listen((event) {
        rl = lines;
      });

      final option = await choisirOption();

      rl = oldInput;
      fakeInput.close();

      expect(option, equals(2));
    });

    test('Test choisirOption() avec une option invalide', () async {
      final fakeInput = StreamController<String>();
      final lines = Stream<String>.fromIterable(['9']); // Simule une entrée utilisateur invalide

      final oldInput = input;
      rl.transform(utf8.decoder).listen(fakeInput.add);
      fakeInput.stream.listen((event) {
        rl = lines;
      });

      // Le test est censé échouer car 9 est une option invalide
      expect(() async => await choisirOption(), throwsA(isA<String>()));

      rl = oldInput;
      fakeInput.close();
    });

    test('Test fonction attendre()', () async {
      // Arrange
      var start = DateTime.now().millisecondsSinceEpoch;

      // Act
      await attendre(3000);

      // Assert
      var end = DateTime.now().millisecondsSinceEpoch;
      var elapsed = end - start;
      expect(elapsed >= 3000, isTrue);
    });

  });
}
