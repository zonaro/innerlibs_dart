import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innerlibs/string_extensions.dart';

part 'brazil_tools.part.dart';

/// Contém métodos uteis para varias operações relacionadas com o Brasil
abstract interface class Brasil extends _Brasil {
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

  static final List<Estado> _estados = [];

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
  static List<Estado> get estados {
    if (_estados.isEmpty) {
      for (var v in _Brasil._br) {
        var e = Estado._fromJson(v);
        _estados.add(e);
      }
      _estados.sort();
    }
    return _estados.toList(growable: false);
  }

  /// Lista com todas as cidades do Brasil
  static List<Cidade> get cidades => estados.expand((e) => e.cidades).toList()..sort();

  /// pega um estado a partir do nome, UF ou IBGE
  static Estado? pegarEstado(String nomeOuUFOuIBGE) => pesquisarEstado(nomeOuUFOuIBGE).singleOrNull;

  /// Pesquisa um estado
  static List<Estado> pesquisarEstado(String nomeOuUFOuIBGE) {
    try {
      nomeOuUFOuIBGE = nomeOuUFOuIBGE.toLowerCase().trim();
      var l = estados.where((e) => e.nome.flatContains(nomeOuUFOuIBGE) || e.uf.flatEqual(nomeOuUFOuIBGE) || e.ibge.toString() == nomeOuUFOuIBGE.trim().substring(0, 2)).toList(growable: false);
      if (l.isEmpty) {
        l = estados.where((e) => e.cidades.any((c) => c.nome.flatEqual(nomeOuUFOuIBGE))).toList(growable: false);
      }
      return l;
    } catch (e) {
      return [];
    }
  }

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Cidade? pegarCidade(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => (pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE)).singleOrNull;

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static List<Cidade> pesquisarCidade(String nomeCidadeOuIBGE, [String? nomeOuUFOuIBGE]) {
    try {
      nomeCidadeOuIBGE = nomeCidadeOuIBGE.toLowerCase().removeDiacritics()?.trim() ?? "";
      Estado? e = pegarEstado(nomeCidadeOuIBGE);
      if (e == null && nomeOuUFOuIBGE!.trim() != "") {
        e = pegarEstado(nomeOuUFOuIBGE);
      }
      return (e?.cidades ?? (cidades)).where((c) => c.nome.flatContains(nomeCidadeOuIBGE) || c.ibge.toString().startsWith(nomeCidadeOuIBGE)).toList(growable: false);
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
          debugPrint('Erro ao buscar endereço: ${response.statusCode} ${response.reasonPhrase}');
        }
      } catch (e) {
        debugPrint('Erro ao buscar endereço: $e');
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

  static Map<String, String> separarTelefone(String telefone) {
    if (validarTelefone(telefone)) {
      // Remove todos os caracteres não numéricos
      String apenasNumeros = telefone.replaceAll(RegExp(r'\D'), '');

      // Extrai o DDD, prefixo e sufixo
      RegExp exp = RegExp(r'(\d{2})(\d{4,5})(\d{4})$');
      var match = exp.firstMatch(apenasNumeros);

      // Retorna um mapa com as partes do telefone
      return {
        'original': telefone,
        'semMascara': apenasNumeros,
        'ddd': "${match?.group(1)}",
        'prefixo': "${match?.group(2)}",
        'sufixo': "${match?.group(3)}",
        'numero': "${match?.group(2)}${match?.group(3)}",
        'numeroMascara': "${match?.group(2)}-${match?.group(3)}",
      };
    } else {
      return {'original': telefone};
    }
  }

  static bool validarTelefone(String telefone) {
    try {
      // Remove todos os caracteres não numéricos
      String apenasNumeros = telefone.replaceAll(RegExp(r'\D'), '');

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
    String cpf = "$numero".onlyNumbers!;
    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
  }

  // Função para formatar CNPJ
  static String formataCNPJ(dynamic number) {
    // Implementação para formatar o número do CNPJ
    // Retorne uma string formatada (por exemplo: "12.345.678/0001-90")
    String cnpj = "$number".onlyNumbers!;
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
  static String formataTelefone(dynamic numero) {
    String telefoneFormatado = "$numero".onlyNumbers!;
    if (telefoneFormatado.isBlank) return "";

    if (telefoneFormatado.length > 11) {
      telefoneFormatado = telefoneFormatado.substring(0, 11);
    }

    if (telefoneFormatado.length == 11) {
      telefoneFormatado = '(${telefoneFormatado.substring(0, 2)}) ${telefoneFormatado.substring(2, 7)}-${telefoneFormatado.substring(7, 11)}';
    } else if (telefoneFormatado.length == 10) {
      telefoneFormatado = '(${telefoneFormatado.substring(0, 2)}) ${telefoneFormatado.substring(2, 6)}-${telefoneFormatado.substring(6, 10)}';
    } else if (telefoneFormatado.length == 9) {
      telefoneFormatado = '${telefoneFormatado.substring(0, 5)}-${telefoneFormatado.substring(5, 9)}';
    } else if (telefoneFormatado.length == 8) {
      telefoneFormatado = '${telefoneFormatado.substring(0, 4)}-${telefoneFormatado.substring(4, 8)}';
    }

    return telefoneFormatado;
  }
}

class Endereco {
  final String cep;
  final String logradouro;
  String numero = "";
  String complemento;
  final String bairro;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  Endereco({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  Cidade? get cidade => Brasil.pegarCidade(ibge);
  Estado? get estado => cidade?.estado ?? Brasil.pegarEstado(ibge);

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
        cep: json['cep'],
        logradouro: json['logradouro'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        ibge: json['ibge'],
        gia: json['gia'],
        ddd: json['ddd'],
        siafi: json['siafi'],
      );
}

class Estado implements Comparable<Estado> {
  final String nome;
  final String uf;
  final int ibge;
  final String regiao;
  final double latitude;
  final double longitude;
  final List<Cidade> cidades = [];

  static List<Estado> get pegarEstados => Brasil.estados;

  /// pega um estado a partir do nome, UF ou IBGE
  static Estado? pegar(String nomeOuUFOuIBGE) => Brasil.pegarEstado(nomeOuUFOuIBGE);

  /// Pesquisa um estado
  static List<Estado> pesquisar(String nomeOuUFOuIBGE) => Brasil.pesquisarEstado(nomeOuUFOuIBGE);

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

  static List<Cidade> get pegarCidades => Brasil.cidades;

  /// Pega uma cidade a partir do nome, UF ou IBGE e estado
  static Cidade? pegar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => Brasil.pegarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

  /// Pesquisa uma cidade no Brasil todo ou em algum estado especifico se [nomeOuUFOuIBGE] for especificado
  static List<Cidade> pesquisar(String nomeCidadeOuIBGE, [String nomeOuUFOuIBGE = ""]) => Brasil.pesquisarCidade(nomeCidadeOuIBGE, nomeOuUFOuIBGE);

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
      return ibge == other.floor();
    }

    return false;
  }

  @override
  int get hashCode => Object.hash(ibge, 0);

  @override
  int compareTo(other) => nome.compareTo(other.nome);
}
