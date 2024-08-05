import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:innerlibs/innerlibs.dart';

 

/// Contém métodos uteis para varias operações relacionadas com o Brasil
abstract interface class Brasil {
  static List<Regiao> get regioes => Regiao.pegarRegioes;

  /// Lista contendo os nomes mais comuns no Brasil
  static List<String> get nomesFemininosComuns => [
        "Agatha",
        "Alice",
        "Amanda",
        "Ana",
        "Analu",
        "Ana Luiza",
        "Beatriz",
        "Bianca",
        "Bárbara",
        "Carolina",
        "Caroline",
        "Catarina",
        "Katarina",
        "Katherine",
        "Cecília",
        "Clara",
        "Eduarda",
        "Eloá",
        "Emilly",
        "Fernanda",
        "Gabriela",
        "Giovana",
        "Giovanna",
        "Helena",
        "Heloísa",
        "Isabella",
        "Isabelly",
        "Isadora",
        "Isis",
        "Júlia",
        "Lara",
        "Laura",
        "Letícia",
        "Lorena",
        "Luana",
        "Luiza",
        "Luna",
        "Luíza",
        "Lívia",
        "Manuela",
        "Maria",
        "Mariana",
        "Marina",
        "Melissa",
        "Mirella",
        "Nina",
        "Rafaela",
        "Raissa",
        "Sofia",
        "Sophia",
        "Sophie",
        "Stella",
        "Valentina",
        "Vitória",
      ];

  static List<String> get nomesMasculinosComuns => [
        "Alisson",
        "Antônio",
        "Arthur",
        "Artur",
        "Benjamin",
        "Bernardo",
        "Breno",
        "Caio",
        "Davi",
        "Emanuel",
        "Enrico",
        "Enzo",
        "Felipe",
        "Gabriel",
        "Gabriel",
        "Gabriel",
        "Giovanni",
        "Guilherme",
        "Gustavo",
        "Gustavo",
        "Heitor",
        "Henrique",
        "Joaquim",
        "João",
        "João",
        "Kaio",
        "Kaique",
        "Leonardo",
        "Lorenzo",
        "Lucas",
        "Luiz",
        "Luíz",
        "Luís",
        "Luis",
        "Matheus",
        "Miguel",
        "Pedro",
        "Rafael",
        "Ruan",
        "Thiago",
        "Vinícius",
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

  static List<string> get nomesComuns => [...nomesFemininosComuns, ...nomesMasculinosComuns];

  /// Gera um nome aleatório com opções personalizáveis.
  ///
  /// Esta função gera um nome aleatório com base nas opções fornecidas.
  /// Os parâmetros opcionais permitem controlar o gênero do nome gerado,
  /// se o nome é composto ou não, e se o sobrenome deve ser único.
  ///
  /// Parâmetros:
  /// - [sobrenomeUnico]: Define se o sobrenome deve ser único. O valor padrão é [false].
  /// - [nomeComposto]: Define se o nome deve ser composto. O valor padrão é [false].
  /// - [masculino]: Define se o nome gerado pode ser masculino. O valor padrão é [true].
  /// - [feminino]: Define se o nome gerado pode ser feminino. O valor padrão é [true].
  ///
  /// Retorna:
  /// Um [String] contendo o nome aleatório gerado.
  ///
  /// Exemplo:
  /// ```dart
  /// String nome = gerarNomeAleatorio();
  /// print(nome); // Exemplo de saída: "João Silva"
  /// ```

  static strings gerarNomeAleatorio({bool sobrenomeUnico = false, bool nomeComposto = false, bool masculino = true, bool feminino = true}) {
    if (masculino == false && feminino == false) {
      masculino = random.nextBool();
      feminino = !masculino;
    }
    var l = nomesComuns;
    if (masculino == false) l = nomesFemininosComuns;
    if (feminino == false) l = nomesMasculinosComuns;
    var s1 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    var s2 = sobrenomesComuns[random.nextInt(sobrenomesComuns.length)];
    var n1 = l[random.nextInt(l.length)];
    var n2 = l[random.nextInt(l.length)].blankIf((s) => nomeComposto == false || random.nextBool() || n1 == s);
    if (random.nextBool() || s1 == s2 || sobrenomeUnico) s2 = "";
    return [
      [n1, n2].whereValid.join(" "),
      [s1, s2].whereValid.join(" ")
    ];
  }

  static Future<Endereco> gerarEnderecoAleatorio() async {
    return Endereco(
      cep: random.nextInt(99999999).toString().padLeft(8, "0"),
      logradouro: "${["Rua", "Avenida", "Alameda", "Travessa", "Praça"].randomize().first} ${gerarNomeAleatorioString()}",
      numero: random.nextInt(999).toString(),
      bairro: "${["Jardim", "Campos", ""].randomize().first} ${gerarNomeAleatorioString()}",
      cidade: await cidades.then((c) => c.randomize().first),
    );
  }

  static string gerarNomeAleatorioString({bool sobrenomeUnico = false, bool nomeComposto = false, bool masculino = true, bool feminino = true}) => gerarNomeAleatorio(sobrenomeUnico: sobrenomeUnico, nomeComposto: nomeComposto, masculino: masculino, feminino: feminino).join(" ");

  static Telefone gerarTelefone({Cidade? cidade}) => Telefone((cidade?.ddd.toString() ?? random.nextInt(99).toString().padLeft(2, "0")) + random.nextInt(99999999).toString().padLeft(8, "9").first(9));

  static Future<InfoUsuario> gerarPessoaAleatoria({bool sobrenomeUnico = false, bool nomeComposto = false, bool masculino = true, bool feminino = true}) async {
    if (masculino == feminino) {
      masculino = random.nextBool();
      feminino = !masculino;
    } else {
      masculino = !feminino;
    }

    var nomeInteiro = gerarNomeAleatorio(sobrenomeUnico: sobrenomeUnico, nomeComposto: nomeComposto, masculino: masculino, feminino: feminino);
    var nome = nomeInteiro.first;
    var sobrenome = nomeInteiro.last;
    var doc = Brasil.gerarCPFouCNPJFake();
    var email = "${nome.replaceAll(" ", ".").toLowerCase()}@${["fakemail.com", "notmail.com", "ghostmail.com", "jmail.com", "outlucky.com"].randomize().first}";
    var tel = gerarTelefone();
    return InfoUsuario(
      nome: nome,
      sobrenome: sobrenome,
      cpfCnpj: doc,
      emails: [email],
      telefones: [tel],
      enderecos: [await gerarEnderecoAleatorio()],
    );
  }

  /// Gera um código EAN a partir de uma lista de partes.
  ///
  /// O código EAN é gerado concatenando todas as partes da lista e, em seguida,
  /// verificando se o comprimento do código resultante é igual a 7 ou 12. Se for,
  /// é adicionado um dígito de verificação ao código. Em seguida, é verificado se
  /// o código gerado é um EAN válido. Se for, o código é retornado. Caso contrário,
  /// uma string vazia é retornada.
  ///
  /// Parâmetros:
  /// - `partes`: Uma lista de partes que serão concatenadas para gerar o código EAN.
  ///
  /// Retorna:
  /// - O código EAN gerado, se for válido.
  /// - Uma string vazia, caso contrário.
  static String gerarEAN(List<dynamic> partes) {
    var n = partes.join("");
    if (n.length == 7 || n.length == 12) {
      n += n.generateBarcodeCheckSum;
    }
    if (n.isValidEAN) {
      return n;
    }
    return "";
  }

  /// Formata um número EAN removendo caracteres não numéricos e adicionando hífens para melhor legibilidade.
  ///
  /// O parâmetro [numero] pode ser de qualquer tipo, mas será convertido para uma string antes de ser formatado.
  /// Retorna a versão formatada do número EAN.
  static string formatarEAN(dynamic numero) {
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

  /// Valida se o valor do código EAN é válido. (veja também: [String.isValidEAN])
  ///
  /// Retorna `true` se o valor fornecido for um código EAN válido e `false` caso contrário.
  /// O parâmetro [input] pode ser de qualquer tipo, mas será convertido para uma string antes da validação.
  ///
  /// Exemplo:
  ///
  /// ```dart
  /// bool resultado = validarEAN(7894561230123);
  /// print(resultado); // true
  /// ```
  static bool validarEAN(dynamic input) => "$input".isValidEAN;

  /// Valida um CEP.
  ///
  /// Esta função recebe um CEP como parâmetro e verifica se ele é válido.
  /// O tamanho do CEP deve ser exatamente 8 caracteres numericos ou 9 caracteres, sendo 8 numericos e 1 traço.
  ///
  /// Retorna `true` se o CEP for válido e `false` caso contrário.
  static bool validarCEP(dynamic valor) {
    var cep = "$valor";
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

  /// Retorna uma lista com todos os Estados do Brasil
  ///
  /// Esta função assíncrona carrega os dados de um arquivo JSON que contém informações sobre os Estados do Brasil.
  /// Em seguida, os dados são convertidos em objetos do tipo Estado e adicionados a uma lista.
  /// A lista é ordenada e retornada como resultado da função.
  ///
  /// Retorna:
  ///   - Uma lista de objetos do tipo Estado, contendo informações sobre todos os Estados do Brasil.
  ///
  static List<Estado> get estados => Estado.pegarEstados;

  /// Retorna uma lista com todas as cidades do Brasil
  ///
  /// Este método retorna uma lista assíncrona de objetos do tipo [Cidade],
  /// que representa todas as cidades do Brasil. A lista é obtida através da
  /// expansão dos estados e suas respectivas cidades, e em seguida é ordenada
  /// alfabeticamente.
  ///
  /// Exemplo de uso:
  ///
  /// ```dart
  /// List<Cidade> cidades = await Brasil.cidades;
  /// ```
  static Future<List<Cidade>> get cidades async => await Cidade.pegarCidades;

  /// Pega um estado a partir do nome, UF ou IBGE
  /// Se uma primeira busca não retornar resultados, ele tenta buscar pelo nome de uma cidade
  ///
  /// Parâmetros:
  /// - [nomeOuUFOuIBGE]: O nome, UF ou IBGE do estado a ser pesquisado.
  ///
  /// Retorna:
  /// Um objeto do tipo [Estado] que corresponde ao estado pesquisado, ou [Estado.naoDefinido] se nenhum resultado for encontrado.
  static Estado pegarEstado(dynamic nomeOuUFOuIBGE) {
    try {
      if (nomeOuUFOuIBGE is Estado) {
        return nomeOuUFOuIBGE;
      }
      if (nomeOuUFOuIBGE is Cidade) {
        return nomeOuUFOuIBGE.estado;
      }

      nomeOuUFOuIBGE = flatString("$nomeOuUFOuIBGE");

      var l = estados.where((e) => e.nome.flatEqual(nomeOuUFOuIBGE) || e.uf.flatEqual(nomeOuUFOuIBGE) || e.ibge.toString() == nomeOuUFOuIBGE.toString().first(2));
      return l.singleOrNull ?? Estado.naoDefinido;
    } catch (e) {
      return Estado.naoDefinido;
    }
  }

  /// Pesquisa um estado pelo nome, UF ou código IBGE.
  ///
  /// Retorna uma lista de estados que correspondem ao critério de pesquisa.
  /// O critério de pesquisa pode ser o nome do estado, a UF (Unidade Federativa)
  /// ou o código IBGE do estado. Se a primeira busca não retornar nenhum estado, a função
  /// tenta buscar pelo nome de uma cidade.
  ///
  /// Parâmetros:
  /// - [nomeOuUFOuIBGE]: O critério de pesquisa (nome, UF ou código IBGE).
  ///
  /// Retorna:
  /// Uma lista de objetos do tipo [Estado] que correspondem ao critério de pesquisa.
  /// Se nenhum estado for encontrado, retorna uma lista vazia.
  ///
  /// Exemplo:
  /// ```dart
  /// var estadosEncontrados = await pesquisarEstado('São Paulo');
  /// print(estadosEncontrados);
  /// ```
  static Iterable<Estado> pesquisarEstado(dynamic nomeOuUFOuIBGE) {
    try {
      if (nomeOuUFOuIBGE is Cidade) {
        return [nomeOuUFOuIBGE.estado];
      }

      if (nomeOuUFOuIBGE is Estado) {
        return [nomeOuUFOuIBGE];
      }

      nomeOuUFOuIBGE = "$nomeOuUFOuIBGE".toLowerCase().trim();

      var l = estados.where((e) => e.nome.flatContains(nomeOuUFOuIBGE) || e.uf.flatEqual(nomeOuUFOuIBGE) || e.ibge.toString() == nomeOuUFOuIBGE.toString().first(2));
      return l.orderBy((x) {
        return [
          x.nome.getLevenshtein(nomeOuUFOuIBGE, false),
          x.uf.getLevenshtein(nomeOuUFOuIBGE, false),
          x.ibge.toString().getLevenshtein(nomeOuUFOuIBGE, false),
        ].min;
      }).thenBy((x) => x.nome);
    } catch (e) {
      return [];
    }
  }

  /// Retorna a cidade correspondente ao nome da cidade ou ao código IBGE da cidade.
  ///
  /// A função `pegarCidade` recebe o nome da cidade ou o código IBGE da cidade como parâmetro e retorna a cidade correspondente.
  ///
  /// Parâmetros:
  /// - `nomeCidadeOuIBGE`: O nome da cidade ou o código IBGE da cidade.
  /// - `nomeOuUFOuIBGE` (opcional): O nome do estado ou o código IBGE do estado. Quando especificado, limita a busca da cidade apenas ao estado informado.
  ///
  /// Retorna:
  /// - Um objeto do tipo `Cidade` correspondente à cidade encontrada.
  /// - `null` se nenhuma cidade for encontrada.
  static Future<Cidade?> pegarCidade(dynamic nomeCidadeOuIBGE, [dynamic nomeEstadoOuUFOuIBGEouRegiao]) async {
    if (nomeCidadeOuIBGE is Cidade) {
      return nomeCidadeOuIBGE;
    }

    var cids = (await cidades).toList();

    if (nomeEstadoOuUFOuIBGEouRegiao is Cidade) {
      nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.estado;
    }

    if (nomeEstadoOuUFOuIBGEouRegiao is Estado) {
      nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.ibge;
    }

    if (nomeEstadoOuUFOuIBGEouRegiao is Regiao) {
      nomeEstadoOuUFOuIBGEouRegiao = null;
      cids = (await (nomeCidadeOuIBGE as Regiao).cidades).toList();
    }

    if (nomeEstadoOuUFOuIBGEouRegiao is num) {
      nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.toString().first(2);
    }
    nomeCidadeOuIBGE = flatString(nomeCidadeOuIBGE);

    Estado est = pegarEstado(nomeCidadeOuIBGE);
    if (est.estadoReal == false && isValid(nomeEstadoOuUFOuIBGEouRegiao)) {
      est = pegarEstado(nomeEstadoOuUFOuIBGEouRegiao);
      cids.removeWhere((c) => c.estado.ibge != est.ibge);
    }

    return cids.singleWhereOrNull((x) => x.nome.flatEqual(nomeCidadeOuIBGE) || x.ibge.toString() == nomeCidadeOuIBGE.toString());
  }

  /// Pesquisa uma cidade pelo nome, código IBGE ou UF.
  ///
  /// Retorna uma lista de cidades que correspondem ao critério de pesquisa.
  /// O parâmetro [nomeCidadeOuIBGE] pode ser o nome da cidade, o código IBGE da cidade
  /// ou uma combinação de ambos. O parâmetro [nomeEstadoOuUFOuIBGEouRegiao] é opcional e pode ser
  /// utilizado para especificar o nome do estado, a UF, o código IBGE da UF ou a região. Quando especificado, a busca se limita apenas ao estado (ou região) informado.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// var cidades = await pesquisarCidade("São Paulo");
  /// ```
  static Future<Iterable<Cidade>> pesquisarCidade(dynamic nomeCidadeOuIBGE, [dynamic nomeEstadoOuUFOuIBGEouRegiao]) async {
    try {
      if (nomeCidadeOuIBGE is Cidade) {
        return [nomeCidadeOuIBGE];
      }

      var cids = (await cidades).toList(growable: true);

      if (nomeEstadoOuUFOuIBGEouRegiao is Cidade) {
        nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.estado;
      }

      if (nomeEstadoOuUFOuIBGEouRegiao is Estado) {
        if (nomeEstadoOuUFOuIBGEouRegiao.estadoReal) {
          nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.ibge;
        } else {
          nomeEstadoOuUFOuIBGEouRegiao = null;
        }
      }

      if (nomeEstadoOuUFOuIBGEouRegiao is Regiao) {
        nomeEstadoOuUFOuIBGEouRegiao = null;
        cids = (await (nomeCidadeOuIBGE as Regiao).cidades).toList();
      }

      if (nomeEstadoOuUFOuIBGEouRegiao is num) {
        nomeEstadoOuUFOuIBGEouRegiao = nomeEstadoOuUFOuIBGEouRegiao.toString().first(2);
      }

      nomeCidadeOuIBGE = flatString(nomeCidadeOuIBGE);

      Estado est = pegarEstado(nomeCidadeOuIBGE);
      if (est.estadoReal == false && isValid(nomeEstadoOuUFOuIBGEouRegiao)) {
        est = pegarEstado(nomeEstadoOuUFOuIBGEouRegiao);
        cids.removeWhere((c) => c.estado.ibge != est.ibge);
      }
      return cids.search(searchTerms: nomeCidadeOuIBGE, searchOn: (x) => [x.nome, x.ibge]);
    } catch (e) {
      return [];
    }
  }

  /// Pesquisa um endereço a partir de um CEP. Utiliza a api ViaCEP para buscar o endereço.
  ///
  /// Retorna um objeto [Endereco] contendo as informações do endereço encontrado.
  /// O parâmetro [cep] é obrigatório e representa o CEP a ser pesquisado.
  /// O parâmetro [numero] é opcional e representa o número do endereço.
  /// O parâmetro [complemento] é opcional e representa o complemento do endereço.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// Endereco endereco = await pesquisarCEP('12345678', '123', 'Apto 101');
  /// print(endereco.logradouro); // Exibe o logradouro do endereço encontrado
  /// ```
  static Future<Endereco?> pesquisarCEP(String cep, [String numero = "", String complemento = ""]) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    if (validarCEP(cep)) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          data['cep'] = cep;
          data['numero'] = numero;
          data['complemento'] = complemento;
          return (await Endereco.fromJson(data));
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

      if (numero is num) {
        text = numero.floor().toString().padLeft(14, "0");
      }

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

  static String formatarPIS(dynamic numero) {
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

  /// Formata uma data no formato padrão brasileiro
  static String formatarData(DateTime data, {bool comHora = true, bool comSegundos = false}) => data.format('dd/MM/yyyy${comHora ? ' HH:mm${comSegundos ? ':ss' : ''}' : ''}');

  /// Formata uma data de acordo com o especificado no manual da SEFAZ
  static string? formatarDataXML(DateTime? data) => data?.format("yyyy-MM-ddTHH:mm:ssZ");

  /// Retorna uma data a partir de uma string no formato especificado no manual da SEFAZ
  static DateTime? parseDataXML(String data) => data.toDate("yyyy-MM-ddTHH:mm:ssZ", "pt-BR");

  /// Retorna o rótulo do documento com base no valor fornecido.
  ///
  /// O parâmetro [documento] é o valor do documento a ser verificado.
  /// O parâmetro [rotuloPadrao] é opcional e representa o rótulo padrão a ser retornado caso nenhum rótulo específico seja encontrado.
  ///
  /// Retorna o rótulo correspondente ao tipo de documento identificado.
  /// Se nenhum tipo de documento for identificado, retorna o rótulo padrão.
  ///
  /// Exemplo:
  /// ```dart
  /// var rotulo = pegarRotuloDocumento(documento: "430.774.698-80");
  /// print(rotulo); // Saída: "CPF"
  /// ```
  static String pegarRotuloDocumento({dynamic documento, String rotuloPadrao = ""}) {
    if (documento == null) return rotuloPadrao;
    if (documento is date) return "Data";
    if (documento is ChaveNFe) return "Chave NFe";
    if (documento is NFe) return "NFe";
    if (documento is Estado) return "Estado";
    if (documento is Cidade) return "Cidade";
    if (documento is Endereco) return "Endereço";

    var d = "$documento";
    if (validarCPF(d)) return "CPF";
    if (validarCNPJ(d)) return "CNPJ";
    if (validarCEP(d)) return "CEP";
    if (validarEAN(d)) return "EAN";
    if (validarPIS(d)) return "PIS";
    if (validarCNH(d)) return "CNH";
    if (ChaveNFe.validar(d)) return "Chave NFe";
    if (d.isEmail) return "Email";
    if (d.isIP) return "IP";
    if (validarTelefone(d)) return d.onlyNumbers.length.isIn([9, 11]) ? "Celular" : "Telefone";
    return rotuloPadrao;
  }

  /// Formata um documento de acordo com o seu tipo.
  ///
  /// O parâmetro [documento] pode ser de qualquer tipo. O método verifica o tipo do documento
  /// e retorna uma string formatada de acordo com o tipo.
  /// Tipos:
  /// - [date]: Retorna a data formatada no padrão brasileiro.
  /// - [ChaveNFe]: Retorna a chave da NFe formatada com traços.
  /// - [NFe]: Retorna o número da NFe.
  /// - [Estado]: Retorna a UF do estado.
  /// - [Cidade]: Retorna o nome da cidade.
  /// - [Endereco]: Retorna o endereço formatado.
  /// - [Iterable]: Retorna uma string com todos os elementos formatados e separados por virgula.
  /// - [Map]: Retorna uma string com todas as chaves e valores formatados e separados por quebra de linha.
  /// - [String]: Verifica se o documento é um CPF, CNPJ, CEP, EAN, PIS, CNH, ChaveNFe, Email, IP ou Telefone e formata de acordo.
  /// Se o documento for nulo, uma string vazia é retornada.
  ///
  static String formatarDocumento(dynamic documento) {
    if (documento == null) return "";
    if (documento is date) return formatarData(documento);
    if (documento is ChaveNFe) return documento.chaveFormatadaTraco;
    if (documento is NFe) return documento.infNFe?.ide?.nNF?.toString() ?? "";
    if (documento is Estado) return documento.uf;
    if (documento is Cidade) return documento.nome;
    if (documento is Endereco) return documento.toString();
    if (documento is Iterable) return documento.map((e) => formatarDocumento(e)).join(", ");
    if (documento is Map) return documento.entries.map((e) => "${flatString(e.key).isBlank ? "" : e.key.toString().pascalSplitString}: ${formatarDocumento(e.value)}").join("\r\n");

    if (validarCPF(documento)) return formatarCPF(documento);
    if (validarCNPJ(documento)) return formatarCNPJ(documento);
    if (validarCEP(documento)) return formatarCEP(documento);
    if (validarEAN(documento)) return formatarEAN(documento);
    if (validarPIS(documento)) return formatarPIS(documento);
    if (validarCNH(documento)) return formatarCNH(documento);
    if (ChaveNFe.validar(documento)) return ChaveNFe.fromString(documento).chaveFormatadaTraco;
    if (documento.toString().isEmail) return documento.toString().toLowerCase();
    if (documento.toString().isIP) return documento.toString();
    if (validarTelefone(documento)) return formatarTelefone(documento);
    return "";
  }

  /// Retorna o valor do documento como um número inteiro.
  /// Tipos:
  /// - [date]: Retorna o valor do documento como um timestamp.
  /// - [ChaveNFe]: Retorna o valor da chave como um inteiro.
  /// - [NFe]: Retorna o número da NFe.
  /// - [Estado]: Retorna o IBGE do estado.
  /// - [Cidade]: Retorna o IBGE da cidade.
  /// - [Endereco]: Retorna o CEP do endereço.
  /// - [num]: Retorna o valor do número arredondado para baixo.
  /// - [String]: Verifica se o documento é um CPF, CNPJ, CEP, EAN, PIS, CNH, ChaveNFe, Telefone e retorna o valor como um inteiro.
  /// Se o documento for nulo ou não for um número, retorna `null`.
  static int? valorDocumento(dynamic documento) {
    if (documento == null) return null;
    if (documento is date) return documento.millisecondsSinceEpoch.nullIfZero;
    if (documento is ChaveNFe) return documento.chave.toInt.nullIfZero;
    if (documento is NFe) return documento.infNFe?.ide?.nNF?.nullIfZero;
    if (documento is Estado) return documento.ibge.nullIfZero;
    if (documento is Cidade) return documento.ibge.nullIfZero;
    if (documento is Endereco) return documento.cep.onlyNumbers.toInt.nullIfZero;
    if (documento is num) return documento.floor();

    if (validarCPF(documento) || validarCNPJ(documento) || validarCEP(documento) || validarEAN(documento) || validarPIS(documento) || validarCNH(documento) || ChaveNFe.validar(documento) || validarTelefone(documento)) {
      return int.tryParse("$documento".onlyNumbers).nullIfZero;
    }

    return null;
  }

  /// Formata um documento com um rótulo opcional.
  ///
  /// O parâmetro [documento] pode ser um valor único, uma lista ou um mapa.
  /// Se [documento] for uma lista, cada elemento será formatado individualmente e separado por uma quebra de linha.
  /// Se [documento] for um mapa, a chave é utilizada como rótulo e o valor será formatado individualmente e separado por uma quebra de linha.
  /// O parâmetro [rotuloPadrao] é opcional e define um rótulo padrão para ser usado caso a chave do mapa seja vazia.
  ///
  /// Retorna o documento formatado como uma string.
  static string formatarDocumentoComRotulo({dynamic documento, string rotuloPadrao = ""}) {
    if (documento is Iterable) {
      return documento.map((e) => formatarDocumentoComRotulo(documento: e, rotuloPadrao: rotuloPadrao)).join("\r\n");
    }
    if (documento is Map) {
      return documento.entries.map((e) => "${flatString(e.key).isBlank ? rotuloPadrao : e.key.toString().pascalSplitString}: ${e.value}").join("\r\n");
    }

    var rotulo = pegarRotuloDocumento(documento: documento, rotuloPadrao: rotuloPadrao);

    if (rotulo.isNotBlank) {
      return "$rotulo: ${formatarDocumento(documento)}";
    }
    return formatarDocumento(documento);
  }

  /// Formata um número de CEP.
  ///
  /// Recebe um [numero] dinâmico e retorna uma string formatada no formato de CEP.
  /// Remove todos os caracteres não numéricos do [numero], adiciona zeros à esquerda
  /// até que o [numero] tenha 8 dígitos, e insere um hífen na posição 5.
  /// Se o CEP formatado for válido de acordo com a função [validarCEP], retorna o CEP formatado.
  /// Caso contrário, retorna uma string vazia.
  ///
  /// Exemplo:
  /// ```dart
  /// var cep = formataCEP(12345678);
  /// print(cep); // Output: "12345-678"
  /// ```
  static String formatarCEP(dynamic numero) {
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

  /// Formata o número da CNH (Carteira Nacional de Habilitação) no padrão XXX-XXXXXX-XX.
  ///
  /// Remove quaisquer caracteres não numéricos da entrada e valida se o número da CNH é válido.
  /// Em seguida, formata a CNH no padrão XXX-XXXXXX-XX, onde:
  /// - XXX representa a UF (Unidade Federativa) do emissor da CNH.
  /// - XXXXXX representa o número sequencial da CNH.
  /// - XX representa os dígitos verificadores da CNH.
  ///
  /// Retorna uma string vazia se o número da CNH não for válido.
  static String formatarCNH(dynamic numero) {
    var apenasDigitos = "$numero".onlyNumbers;
    if (validarCNH(apenasDigitos)) {
      final uf = apenasDigitos.substring(0, 3);
      final sequencial = apenasDigitos.substring(3, 9);
      final digitosVerificadores = apenasDigitos.substring(9);

      return '$uf-$sequencial-$digitosVerificadores';
    }
    return "";
  }

  /// Valida o número da Carteira Nacional de Habilitação (CNH).
  ///
  /// Essa função verifica se o número da CNH é válido, seguindo as seguintes regras:
  /// - O número deve ter 11 dígitos.
  /// - O número não pode ser composto apenas por um único dígito repetido 11 vezes.
  ///
  /// Parâmetros:
  /// - [numero]: O número da CNH a ser validado.
  ///
  /// Retorna:
  /// - [true] se o número da CNH for válido.
  /// - [false] caso contrário.
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

  /// Função para validar CPF
  ///
  /// Esta função recebe um número de CPF como parâmetro e verifica se ele é válido.
  /// O número de CPF pode ser passado como uma string ou um número.
  /// Retorna true se o CPF for válido e false caso contrário.
  static bool validarCPF(dynamic numero) {
    try {
      var text = "$numero".removeAny(["-", "."]);

      if (numero is num) {
        text = numero.floor().toString().padLeft(11, "0");
      }

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

  /// Gera um CPF falso.
  ///
  /// Essa função gera um número de CPF falso válido. O CPF é composto por 11 dígitos,
  /// sendo os 9 primeiros dígitos números aleatórios e os dois últimos dígitos são
  /// calculados com base nos 9 primeiros dígitos.
  ///
  /// Retorna uma string contendo o CPF falso gerado no formato "NNN.NNN.NNN-DD", onde
  /// N representa um dígito numérico e D representa um dígito verificador.
  static String gerarCPFFake() {
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

  /// Gera um CNPJ falso.
  ///
  /// Essa função gera um número de CNPJ falso com base em números aleatórios.
  /// O CNPJ gerado é válido de acordo com a fórmula de validação do CNPJ.
  /// Retorna uma string no formato "XX.XXX.XXX/XXXX-XX".
  static String gerarCNPJFake() {
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

  /// Gera um número de PIS fictício.
  ///
  /// Este método gera um número de PIS (Programa de Integração Social) fictício
  /// com base em números aleatórios. O número gerado é composto por 11 dígitos,
  /// sendo os 10 primeiros dígitos números aleatórios entre 0 e 9, e o último
  /// dígito é calculado com base nos outros dígitos seguindo uma fórmula específica.
  ///
  /// Retorna o número de PIS fictício gerado.
  static String gerarPISFake() {
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

  /// Gerador de numeros aleatórios
  static final random = Random();

  /// Gera um CPF ou CNPJ falso de forma aleatória.
  ///
  /// Retorna uma string contendo um CPF falso se o valor aleatório gerado for verdadeiro,
  /// caso contrário, retorna uma string contendo um CNPJ falso.
  static String gerarCPFouCNPJFake() => random.nextBool() ? gerarCPFFake() : gerarCNPJFake();

  /// Separa um número de telefone em um objeto da classe Telefone.
  ///
  /// O parâmetro [telefone] pode ser de qualquer tipo, pois será convertido para um objeto da classe Telefone.
  /// Retorna um objeto da classe Telefone.
  static Telefone separarTelefone(dynamic telefone) => Telefone(telefone);

  /// Valida um número de telefone.
  ///
  /// Esta função verifica se um número de telefone é válido de acordo com as seguintes regras:
  /// - Remove todos os caracteres não numéricos do número de telefone.
  /// - Verifica se o número tem o tamanho correto (8 ou 9 dígitos locais + 0 ou 2 dígitos DDD).
  /// - Se o número tem 10 ou 11 dígitos, verifica se os dois primeiros são um DDD válido.
  ///
  /// Retorna `true` se o número de telefone for válido, caso contrário retorna `false`.
  static bool validarTelefone(dynamic telefone) {
    try {
      telefone = "$telefone";
      String apenasNumeros = "$telefone".onlyNumbers;

      if (apenasNumeros.length == 13 && apenasNumeros.startsWith("55")) {
        apenasNumeros = apenasNumeros.removeFirst(2);
      }

      if (apenasNumeros.length < 8 || apenasNumeros.length > 11) {
        return false;
      }

      if (apenasNumeros.length > 9) {
        int ddd = int.parse(apenasNumeros.substring(0, 2));
        if (ddd < 11 || ddd > 99) {
          return false;
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Função para validar CPF ou CNPJ
  ///
  /// Esta função recebe um número como parâmetro e verifica se ele é um CPF ou CNPJ válido.
  /// Retorna true se for válido, caso contrário, retorna false.
  static bool validarCPFouCNPJ(dynamic numero) => validarCPF(numero) || validarCNPJ(numero);

  /// Formata um número de CPF para o formato XXX.XXX.XXX-XX.
  ///
  /// O parâmetro [numero] pode ser de qualquer tipo, mas será convertido para uma string.
  /// A função remove todos os caracteres não numéricos da string e formata o CPF no formato desejado.
  /// Retorna a string formatada do CPF.
  static String formatarCPF(dynamic numero) {
    String cpf = "$numero".onlyNumbers.padLeft(11, "0");
    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
  }

  /// Função para formatar CNPJ
  ///
  /// Esta função recebe um número de CNPJ e retorna uma string formatada
  /// no formato "XX.XXX.XXX/XXXX-XX".
  ///
  /// Parâmetros:
  /// - [number]: O número de CNPJ a ser formatado.
  ///
  /// Retorna:
  /// Uma string formatada (por exemplo: "12.345.678/0001-90")
  static String formatarCNPJ(dynamic number) {
    // Implementação para formatar o número do CNPJ
    String cnpj = "$number".onlyNumbers.padLeft(14, "0");
    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
  }

  /// Formata um número de CPF ou CNPJ.
  ///
  /// Recebe um número como parâmetro e verifica se é um CPF válido ou um CNPJ válido.
  /// Se for um CPF válido, formata o número de CPF.
  /// Se for um CNPJ válido, formata o número de CNPJ.
  /// Caso contrário, retorna o número como uma string.
  ///
  /// Parâmetros:
  /// - [numero]: O número de CPF ou CNPJ a ser formatado.
  ///
  /// Retorna:
  /// - Uma string contendo o número formatado de CPF ou CNPJ, ou o número original se não for válido.
  ///
  static String formatarCPFouCNPJ(dynamic numero) {
    if (validarCPF(numero)) {
      return formatarCPF(numero);
    } else if (validarCNPJ(numero)) {
      return formatarCNPJ(numero);
    } else {
      return "$numero";
    }
  }

  /// Formata um número de telefone com traço e parêntesis quando necessário.
  ///
  /// Recebe um [numero] dinâmico e retorna uma string formatada com traço e parêntesis,
  /// utilizando a classe [Telefone] para realizar a formatação.
  static String formatarTelefone(dynamic numero) => Telefone(numero).toString();

  /// Retorna o tipo de pessoa com base no tipo ou documento fornecido.
  ///
  /// Se o tipo ou documento estiver em branco, retorna uma string vazia.
  /// Se o tipo ou documento for um CNPJ válido, retorna "JURÍDICA".
  /// Se o tipo ou documento for um CPF válido, retorna "FÍSICA".
  ///
  /// Parâmetros:
  /// - [tipoOuDocumento]: O tipo ou documento a ser verificado.
  ///
  /// Retorna:
  /// O tipo de pessoa correspondente ao tipo ou documento fornecido.
  static String tipoPessoa(String documento) {
    if (documento.isBlank) return "";

    if (Brasil.validarCNPJ(documento)) {
      documento = "Jurídica";
    }

    if (Brasil.validarCPF(documento)) {
      documento = "Física";
    }

    return documento;
  }

  /// Retorna o tipo de contribuinte com base no tipo ou documento fornecido.
  ///
  /// O parâmetro [tipoPesoaOuDocumento] representa o tipo ou documento do contribuinte.
  /// O parâmetro [inscricaoRg] é opcional e representa a inscrição RG do contribuinte, sendo "ISENTO" o valor padrão.
  ///
  /// Retorna uma expressão de caractere que representa o tipo de contribuinte:
  /// - "9 - NÃO CONTRIBUINTE" para pessoas físicas.
  /// - "2 - CONTRIBUINTE ISENTO" para pessoas jurídicas com inscrição RG igual a "ISENTO".
  /// - "1 - CONTRIBUINTE ICMS" para pessoas jurídicas com inscrição RG diferente de "ISENTO".
  ///
  /// Se o parâmetro [tipoPesoaOuDocumento] estiver vazio, retorna uma string vazia.
  static IndicadorIEDestinatario? tipoContribuinte(String tipoPesoaOuDocumento, [int? inscricaoRg]) {
    if (tipoPesoaOuDocumento.isBlank) return null;
    tipoPesoaOuDocumento = tipoPessoa(tipoPesoaOuDocumento);
    if (tipoPesoaOuDocumento.isNotBlank) {
      if (tipoPesoaOuDocumento.flatEqual("FÍSICA")) {
        return IndicadorIEDestinatario.naoContribuinte;
      } else {
        if (tipoPesoaOuDocumento.flatEqual("JURÍDICA") && (inscricaoRg == null || inscricaoRg == 0)) {
          return IndicadorIEDestinatario.contribuinteIsento;
        } else {
          return IndicadorIEDestinatario.contribuinteICMS;
        }
      }
    }
    return null;
  }

  /// Verifica se o tipo de contribuinte é um consumidor final.
  ///
  /// Retorna true se o tipo de contribuinte for um consumidor final, caso contrário retorna false.
  /// O parâmetro [tipoPessoaOuDocumento] representa o tipo da pessoa (Fisica ou Juridica) ou documento do contribuinte.
  /// O parâmetro [inscricaoRg] é opcional e representa a inscrição RG do contribuinte, sendo "ISENTO" o valor padrão.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// bool isConsumidorFinal = consumidorFinal("43077469880", "ISENTO");
  /// ```
  static bool consumidorFinal(String tipoPessoaOuDocumento, [int? inscricaoRg]) => tipoContribuinte(tipoPessoaOuDocumento, inscricaoRg) == IndicadorIEDestinatario.naoContribuinte;
}
