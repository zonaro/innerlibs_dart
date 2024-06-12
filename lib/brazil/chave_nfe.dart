import 'package:innerlibs/innerlibs.dart';

/// Classe que representa a Chave da Nota Fiscal Eletrônica (NFe).
class ChaveNFe {
  /// Tamanho do CNPJ na chave da NFe.
  static const int tamanhoCNPJ = 14;

  /// Tamanho do código na chave da NFe.
  static const int tamanhoCodigo = 8;

  /// Tamanho do dígito na chave da NFe.
  static const int tamanhoDigito = 1;

  /// Tamanho do mês e ano na chave da NFe.
  static const int tamanhoMesAno = 4;

  /// Tamanho do modelo na chave da NFe.
  static const int tamanhoModelo = 2;

  /// Tamanho da nota na chave da NFe.
  static const int tamanhoNota = 9;

  /// Tamanho da série na chave da NFe.
  static const int tamanhoSerie = 3;

  /// Tamanho da UF na chave da NFe.
  static const int tamanhoUF = 2;

  /// Tamanho da forma de emissão na chave da NFe.
  static const int tamanhoFormaEmissao = 1;

  // Ano de emissão da NF-e.
  final int ano;
  // Forma de emissão da NF-e.
  final int formaEmissao;
  // CNPJ do emitente da NF-e.
  final int cnpj;
  // Código do município do emitente da NF-e.
  final int codigo;
  // Dígito verificador da chave da NF-e.
  int get digito => _digito;
  int _digito;
  // Mês de emissão da NF-e.
  final int mes;
  // Modelo da NF-e.
  final int modelo;

  /// Retorna o mês de emissão da chave NFe.
  ///
  /// A chave NFe é composta pelo ano e mês de emissão da nota fiscal eletrônica.
  /// Este método retorna um objeto [DateTime] representando o mês de emissão.
  DateTime get mesEmissao => DateTime(ano, mes);

  // Número da NF-e.
  final int nota;

  // Série da NF-e.
  final int serie;
  // UF do emitente da NF-e.
  final int uf;

  /// Obtém o tipo da NFe com base no modelo fixo.
  ///
  /// Retorna "NF-e" para modelo fixo "55",
  /// "CT-e" para modelo fixo "57",
  /// "NFC-e" para modelo fixo "65",
  /// ou "DF-e Desconhecido" para outros modelos fixos.
  String? get tipo {
    switch (modelo) {
      case 55:
        return "NF-e";

      case 57:
        return "CT-e";

      case 65:
        return "NFC-e";

      default:
        return "DF-e Desconhecido";
    }
  }

  /// Construtor padrão da classe ChaveNFe.
  ChaveNFe({
    required this.uf,
    required this.ano,
    required this.mes,
    required this.cnpj,
    required this.modelo,
    required this.serie,
    required this.codigo,
    required this.formaEmissao,
    required this.nota,
    int digito = -1,
  }) : _digito = digito {
    if (Brasil.validarCNPJ(cnpj) == false) {
      throw const FormatException("CNPJ inválido");
    }
    if (Brasil.validarCodigoUF(uf) == false) {
      throw const FormatException("UF inválida");
    }
    if ([57, 57, 65].contains(modelo) == false) {
      throw const FormatException("Modelo inválido");
    }
    if (_digito < 0) {
      _digito = calcularDigitoChave(chave);
    } else {
      String chaveSemDigito = chave.first(43);
      int digitoVerificador = int.parse(chave.last(1));
      int digitoCalculado = ChaveNFe.calcularDigitoChave(chaveSemDigito);
      if (digitoVerificador == digitoCalculado) {
        throw const FormatException("Digito verificador inválido");
      }
    }
  }

  /// Construtor que inicializa a ChaveNFe com base nos componentes fornecidos.
  ///
  /// Os componentes são: UF, ano, mês, CNPJ, modelo, série, nota, forma de emissão e código.
  static fromComponents({
    required String uf,
    required dynamic cnpj,
    required int ano,
    required int mes,
    required int modelo,
    required int serie,
    required int nota,
    required int formaEmissao,
    required int codigo,
  }) async {
    final int ufCode = (await Brasil.pegarEstado(uf))?.ibge ?? 0;
    if (ufCode == 0) {
      throw const FormatException("UF inválida");
    }
    final int cnpjNumber = int.tryParse("$cnpj".onlyNumbers) ?? 0;

    return ChaveNFe(
      uf: ufCode,
      ano: ano,
      mes: mes,
      cnpj: cnpjNumber,
      modelo: modelo,
      serie: serie,
      nota: nota,
      formaEmissao: formaEmissao,
      codigo: codigo,
    );
  }

  /// Obtém a chave da NFe formatada sem traços.
  String get chave => chaveFormatadaTraco.onlyNumbers;

  /// Define a chave da NFe.
  ///
  /// A chave deve conter apenas números.
  /// Se a chave tiver 43 caracteres, o dígito verificador será calculado e adicionado automaticamente.
  /// Se a chave não tiver 44 caracteres após a formatação, será preenchida com zeros à esquerda.
  factory ChaveNFe.fromString(String value) {
    var c = value.zeroIfBlank.onlyNumbers;
    if (c.length == 43) {
      c += calcularDigitoChave(c).toString();
    }

    if (c.length != 44) {
      c = "".padLeft(44, '0');
    }

    var parts = c.splitChunk([tamanhoUF, tamanhoMesAno - 2, tamanhoMesAno - 2, tamanhoCNPJ, tamanhoModelo, tamanhoSerie, tamanhoNota, tamanhoFormaEmissao, tamanhoCodigo, tamanhoDigito]);

    return ChaveNFe(
      uf: parts[0].toInt!,
      ano: parts[1].toInt!,
      mes: parts[2].toInt!,
      cnpj: parts[3].toInt!,
      modelo: parts[4].toInt!,
      serie: parts[5].toInt!,
      nota: parts[6].toInt!,
      formaEmissao: parts[7].toInt!,
      codigo: parts[8].toInt!,
      digito: parts[9].toInt!,
    );
  }

  /// Verifica se umaa chave da NFe é válida.
  ///
  /// Retorna true se a chave da NFe for válida, caso contrário retorna false.
  static bool validar(dynamic chave) {
    try {
      chave = "$chave";
      if (chave.onlyNumbers != chave) throw const FormatException("Chave NFe inválida");
      ChaveNFe.fromString(chave);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Obtém a chave da NFe formatada com traços.
  ///
  /// Retorna a chave formatada com traços entre os componentes.
  String get chaveFormatadaTraco => "$ufFixo-$mesAno-$cnpjFixo-$modeloFixo-$serieFixo-$notaFixo-$formaEmissaoFixo-$codigoFixo-$digitoFixo";

  /// Obtém a chave da NFe formatada com espaços.
  ///
  /// Retorna a chave formatada com espaços a cada 4 caracteres.
  String get chaveFormatadaComEspacos => chave.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ").trimRight();

  /// Obtém o mês e ano da NFe formatado.
  ///
  /// Retorna uma string com o mês e ano formatados no padrão "MMYY".
  /// Se o ano ou o mês forem nulos, retorna null.
  String get mesAno => "${ano.toString().last(2).padLeft(tamanhoMesAno - 2, '0')}${mes.toString().padLeft(tamanhoMesAno - 2, '0')}";

  /// Obtém o modelo fixo da NFe formatado.
  ///
  /// Retorna uma string com o modelo fixo formatado com zeros à esquerda.
  String get modeloFixo => modelo.toString().padLeft(tamanhoModelo, '0');

  /// Obtém a nota fixa da NFe formatada.
  ///
  /// Retorna uma string com a nota fixa formatada com zeros à esquerda.
  String get notaFixo => nota.toString().padLeft(tamanhoNota, '0');

  /// Obtém a série fixa da NFe formatada.
  ///
  /// Retorna uma string com a série fixa formatada com zeros à esquerda.
  String get serieFixo => serie.toString().padLeft(tamanhoSerie, '0');

  /// Obtém a UF fixa da NFe formatada.
  ///
  /// Retorna uma string com a UF fixa formatada com zeros à esquerda.
  String get ufFixo => uf.toString().padLeft(tamanhoUF, '0');

  /// Obtém a forma de emissão fixa da NFe formatada.
  ///
  /// Retorna uma string com a forma de emissão fixa formatada com zeros à esquerda.
  String get formaEmissaoFixo => formaEmissao.toString().padLeft(tamanhoFormaEmissao, '0');

  /// Obtém o CNPJ fixo da NFe formatado.
  ///
  /// Retorna uma string com o CNPJ fixo formatado com zeros à esquerda.
  String get cnpjFixo => cnpj.toString().padLeft(tamanhoCNPJ, '0');

  /// Obtém o código fixo da NFe formatado.
  ///
  /// Retorna uma string com o código fixo formatado com zeros à esquerda.
  String get codigoFixo => codigo.toString().padLeft(tamanhoCodigo, '0');

  /// Obtém o dígito fixo da NFe formatado.
  ///
  /// Retorna uma string com o dígito fixo formatado com zeros à esquerda.
  String get digitoFixo => _digito.toString().padLeft(tamanhoDigito, '0');

  /// Calcula o dígito verificador da chave da NFe.
  ///
  /// Retorna o dígito verificador calculado com base na chave fornecida.
  /// A chave deve ter 43 ou 44 caracteres.
  static int calcularDigitoChave(dynamic chave) {
    int soma = 0;
    int peso = 2;
    string c = "$chave";
    if (c.length != 43 && c.length != 44) {
      throw const FormatException("Chave inválida");
    }
    for (int i = c.length - 1; i >= 0; i--) {
      int digito = int.parse(c[i]);
      soma += digito * peso;
      peso++;
      if (peso > 9) {
        peso = 2;
      }
    }

    int resto = soma % 11;
    int digitoVerificador = 11 - resto;

    if (digitoVerificador >= 10) {
      digitoVerificador = 0;
    }

    return digitoVerificador;
  }

  @override
  String toString() => chave;
}
