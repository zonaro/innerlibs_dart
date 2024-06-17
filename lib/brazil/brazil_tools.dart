import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:innerlibs/innerlibs.dart';

/// Contém métodos uteis para varias operações relacionadas com o Brasil
abstract interface class Brasil {
  /// Lista contendo os nomes mais comuns no Brasil
  static List<String> get nomesComuns => [
        "Miguel",
        "Arthur",
        "Davi",
        "Gabriel",
        "Pedro",
        "Alice",
        "Sophia",
        "Sofia",
        "Manuela",
        "Isabella",
        "Laura",
        "Heitor",
        "Enzo",
        "Lorenzo",
        "Valentina",
        "Giovanna",
        "Giovana",
        "Maria Eduarda",
        "Beatriz",
        "Maria Clara",
        "Vinícius",
        "Rafael",
        "Lara",
        "Mariana",
        "Helena",
        "Mariana",
        "Isadora",
        "Lívia",
        "Luana",
        "Maria Luíza",
        "Luiza",
        "Ana Luiza",
        "Eduarda",
        "Letícia",
        "Lara",
        "Melissa",
        "Maria Fernanda",
        "Cecília",
        "Lorena",
        "Clara",
        "Gustavo",
        "Matheus",
        "João Pedro",
        "Breno",
        "Felipe",
        "Júlia",
        "Carolina",
        "Caroline",
        "Joaquim",
        "Enzo Gabriel",
        "Thiago",
        "Lucas",
        "Giovanni",
        "Bianca",
        "Sophie",
        "Antônio",
        "Benjamin",
        "Vitória",
        "Isabelly",
        "Amanda",
        "Emilly",
        "Maria Cecília",
        "Marina",
        "Analu",
        "Nina",
        "Júlia",
        "Gustavo Henrique",
        "Miguel",
        "Catarina",
        "Stella",
        "Miguel Henrique",
        "Guilherme",
        "Caio",
        "Maria Vitória",
        "Isis",
        "Heloísa",
        "Gabriela",
        "Eloá",
        "Agatha",
        "Arthur Miguel",
        "Luiza",
        "Pedro Henrique",
        "Ana Beatriz",
        "Ruan",
        "Sophia",
        "Lara",
        "Luana",
        "Bárbara",
        "Kaique",
        "Raissa",
        "Rafaela",
        "Maria Valentina",
        "Bernardo",
        "Mirella",
        "Leonardo",
        "Davi Lucas",
        "Luiz Felipe",
        "Emanuel",
        "Maria Alice",
        "Luana",
        "Luna",
        "Enrico"
      ];

  /// Lista contendo os sobrenomes mais comuns no Brasil
  static List<String> get sobrenomesComuns => [
        "Silva",
        "Santos",
        "Souza",
        "Oliveira",
        "Pereira",
        "Ferreira",
        "Alves",
        "Pinto",
        "Ribeiro",
        "Rodrigues",
        "Costa",
        "Carvalho",
        "Gomes",
        "Martins",
        "Araújo",
        "Melo",
        "Barbosa",
        "Cardoso",
        "Nascimento",
        "Lima",
        "Moura",
        "Cavalcanti",
        "Monteiro",
        "Moreira",
        "Nunes",
        "Sales",
        "Ramos",
        "Montenegro",
        "Siqueira",
        "Borges",
        "Teixeira",
        "Amaral",
        "Sampaio",
        "Correa",
        "Fernandes",
        "Batista",
        "Miranda",
        "Leal",
        "Xavier",
        "Marques",
        "Andrade",
        "Freitas",
        "Paiva",
        "Vieira",
        "Aguiar",
        "Macedo",
        "Garcia",
        "Lacerda",
        "Lopes"
      ];

  /// Gera um nome aleatório
  static String gerarNomeAleatorio({bool sobrenomeUnico = false}) {
    var random = Random();
    var s1 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    var s2 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    if (random.nextBool() || s1 == s2 || sobrenomeUnico) s2 = "";
    return "${nomesComuns[random.nextInt(nomesComuns.length)]} $s1 $s2".trim();
  }

  static string gerarEAN(List<dynamic> partes) {
    var n = partes.join("");
    if (n.length == 7 || n.length == 12) {
      n += n.generateBarcodeCheckSum;
    }
    if (n.isValidEAN) {
      return n;
    }
    return "";
  }

  static string formataEAN(dynamic numero) {
    var cleanedEAN = "$numero".onlyNumbers;

    // Verifique se o código EAN é válido (você pode usar sua função validarEAN aqui)
    if (!validarEAN(cleanedEAN)) {
      cleanedEAN = "";
    } else {
      // Formate o código EAN com hífens
      if (cleanedEAN.length == 8) {
        cleanedEAN = '${cleanedEAN.substring(0, 4)}-${cleanedEAN.substring(4)}';
      } else if (cleanedEAN.length == 13) {
        cleanedEAN = '${cleanedEAN.substring(0, 1)}-${cleanedEAN.substring(1, 7)}-${cleanedEAN.substring(7)}';
      }
    }
    return cleanedEAN;
  }

  static bool validarEAN(dynamic input) => "$input".isValidEAN;

  static bool validarCEP(String cep) {
    // Remover espaços e traços (se existirem)
    final cleanedCEP = cep.replaceAll(RegExp(r'[-\s]'), '');

    // Verificar se o CEP possui o tamanho correto
    if (cleanedCEP.length != 8) {
      return false;
    }

    // Verificar se todos os caracteres são dígitos
    if (!cleanedCEP.contains(RegExp(r'^\d{8}$'))) {
      return false;
    }

    // Se chegou até aqui, o CEP é válido
    return true;
  }

  /// Lista com todos os Estados do Brasil
  static Future<List<Estado>> get estados async {
    final data = await rootBundle.loadString('packages/innerlibs/lib/brazil/brazil.json', cache: true);
    final jsonResult = jsonDecode(data);
    var br = List.from(jsonResult);
    final List<Estado> estados = [];
    for (var v in br) {
      var e = Estado._fromJson(v);
      estados.add(e);
    }
    estados.sort();

    return estados;
  }

  /// Lista com todas as cidades do Brasil
  static Future<List<Cidade>> get cidades async => (await estados).expand((e) => e.cidades).toList()..sort();

  /// pega um estado a partir do nome, UF ou IBGE
  static Future<Estado?> pegarEstado(dynamic nomeOuUFOuIBGE) async => (await pesquisarEstado(nomeOuUFOuIBGE)).singleOrNull;

  /// Pesquisa um estado
  static Future<List<Estado>> pesquisarEstado(dynamic nomeOuUFOuIBGE) async {
    try {
      nomeOuUFOuIBGE = "$nomeOuUFOuIBGE".toLowerCase().trim();
      var est = await estados;
      var l = est.where((e) => e.nome.flatContains(nomeOuUFOuIBGE) || e.uf.flatEqual(nomeOuUFOuIBGE) || e.ibge.toString() == nomeOuUFOuIBGE.trim().substring(0, 2)).toList(growable: false);
      if (l.isEmpty) {
        l = est.where((e) => e.cidades.any((c) => c.nome.flatEqual(nomeOuUFOuIBGE))).toList(growable: false);
      }
      return l;
    } catch (e) {
      return [];
    }
  }

  static bool validarCodigoUF(int uf) => [12, 27, 16, 13, 29, 23, 53, 32, 52, 21, 51, 50, 31, 15, 25, 41, 26, 22, 24, 43, 33, 11, 14, 42, 35, 28, 17].contains(uf);

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Future<Cidade?> pegarCidade(dynamic nomeCidadeOuIBGE, [dynamic nomeOuUFOuIBGE]) async => (await pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE)).singleOrNull;

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static Future<Iterable<Cidade>> pesquisarCidade(dynamic nomeCidadeOuIBGE, [dynamic nomeOuUFOuIBGE]) async {
    try {
      nomeCidadeOuIBGE = "$nomeCidadeOuIBGE".toLowerCase().removeDiacritics.trim();
      Estado? est = await pegarEstado(nomeCidadeOuIBGE);
      if (est == null && "${nomeOuUFOuIBGE ?? ""}".isNotBlank) {
        est = await pegarEstado(nomeOuUFOuIBGE);
      }
      return (est?.cidades ?? (await cidades)).where((c) => c.nome.flatContains(nomeCidadeOuIBGE) || c.ibge.toString().startsWith(nomeCidadeOuIBGE));
    } catch (e) {
      return [];
    }
  }

  static Future<Endereco?> pesquisarCEP(String cep, [String numero = "", String complemento = ""]) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    if (validarCEP(cep)) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          return Endereco.fromJson(data)
            ..numero = numero
            ..complemento = complemento;
        } else {
          consoleLog('Erro ao buscar endereço: ${response.statusCode} ${response.reasonPhrase}');
        }
      } catch (e) {
        consoleLog('Erro ao buscar endereço: $e');
      }
    }
    return null;
  }

  // Função para validar CNPJ
  static bool validarCNPJ(dynamic numero) {
    try {
      var text = "$numero".removeAny(["-", "/", "."]);

      if (text.isNotNumber || text.length != 14) {
        return false;
      }

      // Calcula o primeiro dígito verificador do CNPJ
      List<int> multiplicadores = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
      int soma = 0;
      for (int i = 0; i < 12; i++) {
        soma += int.parse(text[i]) * multiplicadores[i];
      }
      int primeiroDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

      if (primeiroDigito != int.parse(text[12])) {
        return false;
      }

      // Calcula o segundo dígito verificador do CNPJ
      multiplicadores = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
      soma = 0;
      for (int i = 0; i < 13; i++) {
        soma += int.parse(text[i]) * multiplicadores[i];
      }
      int segundoDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

      return segundoDigito == int.parse(text[13]);
    } catch (e) {
      return false;
    }
  }

  static String formataPIS(dynamic numero) {
    if (validarPIS(numero)) {
      var n = "$numero";
      n = n.replaceAll(RegExp(r'[.-]'), '');
      n = n.padLeft(11, '0');
      n = n.replaceFirstMapped(RegExp(r'(\d{3})(\d{5})(\d{2})(\d{1})'), (match) {
        return '${match[1]}.${match[2]}.${match[3]}-${match[4]}';
      });
      return n;
    } else {
      throw const FormatException('String is not a valid PIS');
    }
  }

  static bool validarPIS(dynamic numero) {
    string text = "$numero";
    if (text.isNotValid) {
      return false;
    }

    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length != 11) {
      return false;
    }

    var count = text[0];
    if (text.split('').where((w) => w == count).length == text.length) {
      return false;
    }

    var multiplicador = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int soma = 0;
    int resto;

    for (var i = 0; i < 10; i++) {
      soma += int.parse(text[i]) * multiplicador[i];
    }

    resto = soma % 11;

    resto = resto < 2 ? 0 : 11 - resto;

    return text.toLowerCase().endsWith(resto.toString().toLowerCase());
  }

  static string pegarRotuloDocumento({dynamic documento, string rotuloPadrao = ""}) {
    var d = "$documento";
    if (validarCPF(d)) return "CPF";
    if (validarCNPJ(d)) return "CNPJ";
    if (validarCEP(d)) return "CEP";
    if (validarEAN(d)) return "EAN";
    if (validarPIS(d)) return "PIS";
    if (validarCNH(d)) return "CNH";
    if (d.isEmail) return "Email";
    if (d.isIP) return "IP";
    if (validarTelefone(d)) return d.onlyNumbers.length.isIn([9, 11]) ? "Celular" : "Telefone";
    return rotuloPadrao;
  }

  /// Retorna um documento formatado com seu rótulo
  static string formatarDocumentoComRotulo({dynamic documento, string rotuloPadrao = ""}) {
    var x = pegarRotuloDocumento(documento: documento, rotuloPadrao: rotuloPadrao);
    documento = "$documento";
    switch (x) {
      case "CPF":
      case "CNPJ":
        documento = formataCPFouCNPJ(documento);
        break;

      case "CEP":
        documento = formataCEP(documento);
        break;
      case "CNH":
        documento = formataCNH(documento);
        break;

      case "PIS":
        documento = formataPIS(documento);
        break;

      case "Email":
        documento = "$documento".toLowerCase();
        break;

      case "EAN":
        documento = formataEAN(documento);
        break;

      case "Telefone":
      case "Celular":
        documento = formataTelefone(documento);
        break;

      default: //IP
        break;
    }

    if (x.isNotBlank) {
      documento = "$x: $documento";
    }
    return documento;
  }

  static string formataCEP(dynamic numero) {
    var cep = "$numero";
    cep = cep.onlyNumbers;
    cep = cep.padLeft(8, '0');
    cep = cep.insertAt(5, "-");
    if (validarCEP(cep)) {
      return cep;
    } else {
      return "";
    }
  }

  static String formataCNH(dynamic numero) {
    // Remova quaisquer caracteres não numéricos da entrada

    var apenasDigitos = "$numero".onlyNumbers;
    if (validarCNH(apenasDigitos)) {
      // Formate a CNH no padrão XXX-XXXXXX-XX
      final uf = apenasDigitos.substring(0, 3);
      final sequencial = apenasDigitos.substring(3, 9);
      final digitosVerificadores = apenasDigitos.substring(9);

      return '$uf-$sequencial-$digitosVerificadores';
    }
    return "";
  }

  static bool validarCNH(dynamic numero) {
    var cnh = "$numero";

    if (cnh.isNotBlank && cnh.length == 11 && cnh != '1' * 11) {
      int dsc = 0;
      int v = 0;
      int i = 0;
      int j = 9;
      while (i < 9) {
        v += int.parse(cnh[i]) * j;
        i += 1;
        j -= 1;
      }

      int vl1 = v % 11;
      if (vl1 >= 10) {
        vl1 = 0;
        dsc = 2;
      }

      v = 0;
      i = 0;
      j = 1;
      while (i < 9) {
        v += int.parse(cnh[i]) * j;
        i += 1;
        j += 1;
      }

      int x = v % 11;
      int vl2 = x >= 10 ? 0 : x - dsc;
      return '$vl1$vl2' == cnh.substring(cnh.length - 2);
    }

    return false;
  }

  // Função para validar CPF
  static bool validarCPF(dynamic numero) {
    try {
      var text = "$numero".removeAny(["-", "."]);

      if (text.isNotNumber || text.length != 11) {
        return false;
      }

      // Calcula o primeiro dígito verificador do CPF
      int soma = 0;
      for (int i = 0; i < 9; i++) {
        soma += int.parse(text[i]) * (10 - i);
      }
      int primeiroDigito = 11 - (soma % 11);
      if (primeiroDigito >= 10) primeiroDigito = 0;

      if (primeiroDigito != int.parse(text[9])) {
        return false;
      }

      // Calcula o segundo dígito verificador do CPF
      soma = 0;
      for (int i = 0; i < 10; i++) {
        soma += int.parse(text[i]) * (11 - i);
      }
      int segundoDigito = 11 - (soma % 11);
      if (segundoDigito >= 10) segundoDigito = 0;

      return segundoDigito == int.parse(text[10]);
    } catch (e) {
      return false;
    }
  }

  static String gerarCPFFake() {
    Random random = Random();
    int n = 9;
    int n1 = random.nextInt(n);
    int n2 = random.nextInt(n);
    int n3 = random.nextInt(n);
    int n4 = random.nextInt(n);
    int n5 = random.nextInt(n);
    int n6 = random.nextInt(n);
    int n7 = random.nextInt(n);
    int n8 = random.nextInt(n);
    int n9 = random.nextInt(n);
    int d1 = n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 = 11 - (d1 % 11);
    if (d1 >= 10) d1 = 0;
    int d2 = d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 = 11 - (d2 % 11);
    if (d2 >= 10) d2 = 0;
    return "$n1$n2$n3.$n4$n5$n6.$n7$n8$n9-$d1$d2";
  }

  static String gerarCNPJFake() {
    Random random = Random();
    int n = 9;
    int n1 = random.nextInt(n);
    int n2 = random.nextInt(n);
    int n3 = random.nextInt(n);
    int n4 = random.nextInt(n);
    int n5 = random.nextInt(n);
    int n6 = random.nextInt(n);
    int n7 = random.nextInt(n);
    int n8 = random.nextInt(n);
    int n9 = 0;
    int n10 = 0;
    int n11 = 0;
    int n12 = 1;
    int d1 = n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
    d1 = 11 - (d1 % 11);
    if (d1 >= 10) d1 = 0;
    int d2 = d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
    d2 = 11 - (d2 % 11);
    if (d2 >= 10) d2 = 0;
    return "$n1$n2.$n3$n4$n5.$n6$n7$n8/$n9$n10$n11$n12-$d1$d2";
  }

  static String gerarPISFake() {
    Random random = Random();
    int n = 9;
    int n1 = random.nextInt(n);
    int n2 = random.nextInt(n);
    int n3 = random.nextInt(n);
    int n4 = random.nextInt(n);
    int n5 = random.nextInt(n);
    int n6 = random.nextInt(n);
    int n7 = random.nextInt(n);
    int n8 = random.nextInt(n);
    int n9 = random.nextInt(n);
    int n10 = random.nextInt(n);
    int n11 = random.nextInt(n);
    int d1 = n11 * 3 + n10 * 2 + n9 * 9 + n8 * 8 + n7 * 7 + n6 * 6 + n5 * 5 + n4 * 4 + n3 * 3 + n2 * 2 + n1 * 1;
    d1 = 11 - (d1 % 11);
    if (d1 >= 10) d1 = 0;
    return "$n1$n2$n3$n4$n5$n6$n7$n8$n9$n10$n11$d1";
  }

  /// Gera um CPF ou CNPJ falso de forma aleatória.
  ///
  /// Retorna uma string contendo um CPF falso se o valor aleatório gerado for verdadeiro,
  /// caso contrário, retorna uma string contendo um CNPJ falso.
  static String gerarCPFouCNPJFake() => Random().nextBool() ? gerarCPFFake() : gerarCNPJFake();

  static Telefone separarTelefone(dynamic telefone) => Telefone(telefone);

  static bool validarTelefone(dynamic telefone) {
    try {
      // Remove todos os caracteres não numéricos

      telefone = "$telefone";

      String apenasNumeros = "$telefone".onlyNumbers;

      if (apenasNumeros.length == 13 && apenasNumeros.startsWith("55")) {
        apenasNumeros = apenasNumeros.removeFirst(2);
      }

      // Verifica se o número tem o tamanho correto (8 ou 9 dígitos locais + 0 ou 2 dígitos DDD)
      if (apenasNumeros.length < 8 || apenasNumeros.length > 11) {
        return false;
      }

      // Se o número tem 10 ou 11 dígitos, verifica se os dois primeiros são um DDD válido
      if (apenasNumeros.length > 9) {
        int ddd = int.parse(apenasNumeros.substring(0, 2));
        if (ddd < 11 || ddd > 99) {
          return false;
        }
      }

      // Se chegou até aqui, o número é válido
      return true;
    } catch (e) {
      return false;
    }
  }

  // Função para validar CPF ou CNPJ
  static bool validarCPFouCNPJ(dynamic numero) {
    // Implementação da validação que verifica se o texto é um CPF ou CNPJ válido
    // Retorne true se for válido, caso contrário, retorne false
    return validarCPF(numero) || validarCNPJ(numero);
  }

  // Função para formatar CPF
  static String formataCPF(dynamic numero) {
    // Implementação para formatar o número do CPF
    // Retorne uma string formatada (por exemplo: "123.456.789-01")
    String cpf = "$numero".onlyNumbers;
    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
  }

  // Função para formatar CNPJ
  static String formataCNPJ(dynamic number) {
    // Implementação para formatar o número do CNPJ
    // Retorne uma string formatada (por exemplo: "12.345.678/0001-90")
    String cnpj = "$number".onlyNumbers;
    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
  }

  static String formataCPFouCNPJ(dynamic numero) {
    if (validarCPF(numero)) {
      return formataCPF(numero);
    } else if (validarCNPJ(numero)) {
      return formataCNPJ(numero);
    } else {
      return "$numero";
    }
  }

  /// formata um numero de telefone com traço e parentesis quando necessário
  static String formataTelefone(dynamic numero) => Telefone(numero).toString();
}

class InfoUsuario implements Validator {
  string nome = "";
  string sobrenome = "";
  string cpfCnpj = "";
  string rg = "";
  string cnh = "";
  string pis = "";
  List<string> emails = [];
  List<Telefone> telefones = [];
  List<Endereco> enderecos = [];
  @override
  int get hashCode => Object.hash(cpfCnpj, 1);

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  strings validate() {
    return [];
  }
}

class Endereco implements Comparable<Endereco> {
  String cep;
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  Endereco({
    this.cep = "",
    this.logradouro = "",
    this.numero = "",
    this.complemento = "",
    this.bairro = "",
    this.ibge = "",
    this.gia = "",
    this.ddd = "",
    this.siafi = "",
  });

  Future<Cidade?> get cidade async => await Brasil.pegarCidade(ibge);
  Future<Estado?> get estado async => ((await cidade)?.estado) ?? await Brasil.pegarEstado(ibge);

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
        cep: (json['cep'] ?? "").toString(),
        logradouro: (json['logradouro'] ?? "").toString(),
        complemento: (json['complemento'] ?? "").toString(),
        bairro: (json['bairro'] ?? "").toString(),
        ibge: (json['ibge'] ?? "").toString(),
        gia: (json['gia'] ?? "").toString(),
        ddd: (json['ddd'] ?? "").toString(),
        siafi: (json['siafi'] ?? "".toString()),
      );

  @override
  int get hashCode => Object.hash(cep, numero, complemento);

  @override
  int compareTo(Endereco other) {
    if (cep == other.cep) {
      if (numero == other.numero) {
        return complemento.compareTo(other.complemento);
      } else {
        return numero.compareTo(other.numero);
      }
    } else {
      return cep.compareTo(other.cep);
    }
  }

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  Future<String> get fullAddress async => [
        [logradouro, numero, complemento].whereValid.join(", ").trim(),
        bairro,
        (await cidade)?.nome ?? "",
        (await estado)?.uf ?? "",
        cep,
      ].whereValid.join(" - ").trim();

  @override
  String toString() => [
        [logradouro, numero, complemento].whereValid.join(", ").trim(),
        bairro,
      ].whereValid.join(" - ").trim();
}

class Estado implements Comparable<Estado> {
  final String nome;
  final String uf;
  final int ibge;
  final String regiao;
  final double latitude;
  final double longitude;
  final List<Cidade> cidades = [];

  static Future<List<Estado>> get pegarEstados async => await Brasil.estados;

  /// pega um estado a partir do nome, UF ou IBGE
  static Future<Estado?> pegar(String nomeOuUFOuIBGE) async => await Brasil.pegarEstado(nomeOuUFOuIBGE);

  /// Pesquisa um estado
  static Future<List<Estado>> pesquisar(String nomeOuUFOuIBGE) async => await Brasil.pesquisarEstado(nomeOuUFOuIBGE);

  Cidade get capital => cidades.firstWhere((e) => e.capital);

  @override
  int compareTo(other) => nome.compareTo(other.nome);

  @override
  String toString() => nome;

  @override
  int get hashCode => Object.hash(ibge, 0);

  Estado._(this.nome, this.uf, this.ibge, this.regiao, this.latitude, this.longitude);

  factory Estado._fromJson(Map<String, dynamic> json) {
    var e = Estado._(json['Nome'], json['UF'], json['IBGE'], json['Regiao'], json['Latitude'], json['Longitude']);
    json['Cidades'].forEach((v) {
      e.cidades.add(Cidade._fromJson(v, e));
    });
    return e;
  }

  Map<String, dynamic> toJson() => {'Nome': nome, 'UF': uf, 'IBGE': ibge, 'Regiao': regiao, 'Latitude': latitude, 'Longitude': longitude, 'Cidades': cidades.map((v) => v.toJson()).toList()};

  @override
  bool operator ==(Object other) {
    if (other is Estado) {
      return ibge == other.ibge;
    }

    if (other is Cidade) {
      return ibge == other.estado.ibge;
    }

    if (other is num) {
      return ibge == other.floor();
    }

    return false;
  }
}

class Cidade implements Comparable<Cidade> {
  final String nome;
  final bool capital;
  final int ibge;
  final int siafi;
  final int ddd;
  final String timeZone;
  final Estado estado;

  static Future<List<Cidade>> get pegarCidades async => await Brasil.cidades;

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Future<Cidade?> pegar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) async => await Brasil.pegarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static Future<Iterable<Cidade>> pesquisar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) async => await Brasil.pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

  @override
  String toString() => nome;

  Cidade._(this.nome, this.capital, this.ibge, this.siafi, this.ddd, this.timeZone, this.estado);

  factory Cidade._fromJson(Map<String, dynamic> json, Estado estado) => Cidade._(json['Nome'], json['Capital'], json['IBGE'], json['SIAFI'], json['DDD'], json['TimeZone'], estado);

  Map<String, dynamic> toJson() => {'Nome': nome, 'Capital': capital, 'IBGE': ibge, 'SIAFI': siafi, 'DDD': ddd, 'TimeZone': timeZone, "Estado": estado.uf};

  @override
  bool operator ==(Object other) {
    if (other is Cidade) {
      return ibge == other.ibge;
    }

    if (other is Estado) {
      return estado.ibge == other.ibge;
    }

    if (other is num) {
      return ibge == "$other".toDouble?.floor();
    }
    if (other is string) {
      return nome.flatEqual(other);
    }

    return false;
  }

  @override
  int get hashCode => Object.hash(ibge, 0);

  @override
  int compareTo(other) => nome.compareTo(other.nome);
}

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

  @override
  String toString() => completoMascara;

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
