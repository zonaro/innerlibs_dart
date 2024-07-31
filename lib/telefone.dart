import 'package:innerlibs/innerlibs.dart';

/// Classe que representa um número de telefone.
class Telefone {
  late String ddd;
  late String prefixo;
  late String sufixo;

  /// Construtor da classe Telefone.
  ///
  /// [numero] é um parâmetro (int ou string) que representa o número de telefone.
  /// Se [numero] for fornecido e for válido, o número será formatado e
  /// atribuído às propriedades [ddd], [prefixo] e [sufixo].
  Telefone([dynamic numero]) {
    ddd = "";
    prefixo = "";
    sufixo = "";
    if (Brasil.validarTelefone(numero)) {
      String t = "$numero".onlyNumbers;
      if (t.length > 11) {
        t = t.substring(0, 11);
      }

      if (t.length == 11) {
        ddd = t.substring(0, 2);
        prefixo = t.substring(2, 7);
        sufixo = t.substring(7, 11);
      } else if (t.length == 10) {
        ddd = t.substring(0, 2);
        prefixo = t.substring(2, 6);
        sufixo = t.substring(6, 10);
      } else if (t.length == 9) {
        prefixo = t.substring(0, 5);
        sufixo = t.substring(5, 9);
      } else if (t.length == 8) {
        prefixo = t.substring(0, 4);
        sufixo = t.substring(4, 8);
      }
    }
  }

  /// Retorna o número de telefone.
  String get numero => "$prefixo$sufixo";

  /// Retorna o número de telefone formatado com máscara.
  String get numeroMascara => "$prefixo-$sufixo".nullIf((s) => s == "-").blankIfNull;

  /// Retorna o número de telefone completo, incluindo o DDD.
  String get completo => "$ddd$numero";

  /// Retorna o número de telefone completo, incluindo o DDD, formatado com máscara.
  String get completoMascara => "${ddd.isNotBlank ? "($ddd) " : ""}$numeroMascara".nullIf((s) => s == "-").blankIfNull;

  @override
  int get hashCode => Object.hash(ddd, prefixo, sufixo);

  /// Retorna uma representação em string do número de telefone.
  @override
  String toString() => completoMascara;

  /// Compara se dois números de telefone são iguais.
  @override
  bool operator ==(Object other) {
    if (other is Telefone) {
      return hashCode == other.hashCode;
    }
    if (other is string) {
      return completo == other;
    }
    if (other is num) {
      return completo == "$other";
    }

    return false;
  }
}
