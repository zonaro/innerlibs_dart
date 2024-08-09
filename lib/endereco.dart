import 'package:innerlibs/innerlibs.dart';

class Endereco implements Comparable<Endereco> {
  final String cep;
  final String logradouro;
  final String numero;
  final String complemento;
  final String bairro;
  final int? gia;
  final int? ddd;
  final int? siafi;
  String get pais => "Brasil";
  int get codigoPais => 1058;
  final Cidade? cidade;

  int? get ibge => cidade?.ibge;

  Endereco({
    this.cep = "",
    this.logradouro = "",
    this.numero = "",
    this.complemento = "",
    this.bairro = "",
    this.cidade,
    this.gia,
    this.ddd,
    this.siafi,
  });

  Estado? get estado => cidade?.estado;

  static Endereco fromPartialJson(Map<String, dynamic> json) {
    return Endereco(
      cep: Brasil.formatarCEP((json['cep']).toString().onlyNumbers.padLeft(8, '0')),
      logradouro: changeTo(json['logradouro']),
      numero: changeTo(json['numero']),
      complemento: changeTo(json['complemento']),
      bairro: changeTo(json['bairro']),
      gia: changeTo(json['gia']),
      ddd: changeTo(json['ddd']),
      siafi: changeTo(json['siafi']),
    );
  }

  static Future<Endereco> fromJson(Map<String, dynamic> json) async {
    var cidade = await Cidade.pegar(json['ibge']);
    return Endereco(
      cep: Brasil.formatarCEP(changeTo<string>(json['cep']).onlyNumbers.padLeft(8, '0')),
      logradouro: changeTo(json['logradouro']),
      numero: changeTo(json['numero']),
      complemento: changeTo(json['complemento']),
      bairro: changeTo(json['bairro']),
      gia: changeTo(json['gia']),
      ddd: changeTo(json['ddd']) ?? cidade?.ddd,
      siafi: changeTo(json['siafi']),
      cidade: cidade,
    );
  }

  Map<String, dynamic> toJson() => {
        'CEP': cep,
        'Logradouro': logradouro,
        'Numero': numero,
        'Complemento': complemento,
        'Bairro': bairro,
        'GIA': gia,
        'DDD': ddd,
        'SIAFI': siafi,
        'IBGE': ibge,
        'Cidade': cidade?.toJson(),
        'Estado': estado?.toJson(),
      };

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

  /// Retorna o logradouro completo do endereço.
  ///
  /// O logradouro completo é composto pelo logradouro, número e complemento,
  /// separados por vírgula e sem espaços em branco desnecessários.
  ///
  ///
  /// Exemplo:
  /// ```
  /// final endereco = Endereco();
  /// endereco.logradouro = 'Rua Principal';
  /// endereco.numero = '123';
  /// endereco.complemento = 'Apto 4';
  /// print(endereco.logradouroCompleto); // Rua Principal, 123, Apto 4
  /// ```
  string get logradouroCompleto => [logradouro, numero, complemento].whereValid.join(", ").trim();

  /// Retorna uma string contendo o bairro, cidade e estado concatenados, separados por hífen.
  ///
  /// A string resultante é obtida a partir dos valores das propriedades [bairro], [cidade.nome] e [estado.uf].
  /// Caso a propriedade [cidade.nome] ou [estado.uf] sejam nulas, elas serão ignoradas na concatenação.
  /// O resultado final é uma string sem espaços em branco no início ou no final.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// String enderecoCompleto = bairroCidadeEstado;
  /// print(enderecoCompleto); // "bairro - cidade - estado"
  /// ```
  string get bairroCidadeEstado => [bairro, cidade?.nome, estado?.uf].whereValid.join(" - ").trim();

  /// Retorna o endereço completo formatado.
  ///
  /// O endereço completo é composto pelo logradouro completo, bairro, cidade e estado,
  /// separados por hífen ("-"). O resultado é retornado como uma string, com espaços
  /// em branco removidos no início e no final.
  ///
  /// Retorna:
  ///     - O endereço formatado.
  string get endereco => [logradouroCompleto, bairroCidadeEstado].whereValid.join(" - ").trim();

  /// Retorna o endereço completo com o CEP.
  ///
  /// O endereço completo é formado pela concatenação do endereço e do CEP,
  /// separados por um traço ("-"). Os valores inválidos são ignorados.
  /// O resultado é retornado como uma string, com espaços em branco removidos.
  ///
  /// Exemplo:
  /// ```dart
  /// String endereco = "Rua A";
  /// String cep = "12345-678";
  /// String enderecoComCep = [endereco, cep].whereValid.join(" - ").trim();
  /// print(enderecoComCep); // Saída: "Rua A - 12345-678"
  /// ```
  string get enderecoComCep => [endereco, cep].whereValid.join(" - ").trim();

  /// Retorna o endereço completo, incluindo o endereço com CEP e o país.
  ///
  /// O endereço completo é obtido através da junção do endereço com CEP e o país,
  /// separados por um traço ("-"). Qualquer espaço em branco no início ou no final
  /// do endereço completo é removido.
  ///
  /// Retorna uma string contendo o endereço completo.
  string get enderecoCompleto => [enderecoComCep, pais].whereValid.join(" - ").trim();

  /// Retorna uma string contendo o bairro, cidade, estado e CEP concatenados, separados por " - ".
  ///
  /// Exemplo:
  /// ```
  /// final endereco = Endereco();
  /// final resultado = endereco.bairroCidadeEstadoCep;
  /// print(resultado); // "bairro - Cidade - Estado - cep"
  /// ```
  string get bairroCidadeEstadoCep => [bairroCidadeEstado, cep].whereValid.join(" - ").trim();

  /// Retorna uma representação em String do endereço.
  @override
  String toString() => enderecoCompleto;
}
