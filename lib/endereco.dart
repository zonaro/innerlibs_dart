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
  final Cidade? cidade;
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

  /// Retorna uma string contendo o bairro, cidade, estado e CEP concatenados, separados por " - ".
  ///
  /// Exemplo:
  /// ```
  /// final endereco = Endereco();
  /// final resultado = endereco.bairroCidadeEstadoCep;
  /// print(resultado); // "bairro - Cidade - Estado - cep"
  /// ```
  string get bairroCidadeEstadoCep => [bairroCidadeEstado, cep].whereValid.join(" - ").trim();

  int get codigoPais => 1058;

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

  Estado? get estado => cidade?.estado;

  @override
  int get hashCode => Object.hash(cep, numero, complemento);

  int? get ibge => cidade?.ibge;

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

  String get pais => "Brasil";

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

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

  /// Retorna uma representação em String do endereço.
  @override
  String toString() => enderecoCompleto;

  static Future<Endereco> fromCEP(String cep) async {
    try {
      return (await Brasil.pesquisarCEP(cep))!;
    } on Exception catch (e) {
      throw Exception("Erro ao buscar o CEP: $e");
    }
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

//TODO: terminar a conversão do método tryParse
//     static   tryParse<T extends Endereco>(string Address)
// {
//     string original = Address;
//     string PostalCode = "";
//     string State =  "";
//     string City = "";
//     string Neighborhood  = "";
//     string Complement  = "";
//     string Number  = "";
//     string Country  = "Brasil";
//     Address = Address.fixText.removeLastAny([" ",".","-"]); // arruma os espacos do endereco
//     var ceps = procurarCEP( Address ); // procura ceps no endereco
//     Address = Address.removeAny(ceps); // remove ceps
//     Address = Address.fixText.removeLastAny([" ",".","-"]); // arruma os espacos do endereco
//     if (ceps.Any())
//     {
//         PostalCode = FormatPostalCode(ceps.First());
//     }

//     Address = Address.FixText().TrimAny("-", ",", "/"); // arruma os espacos do endereco
//     if (Address.Contains(" - "))
//     {
//         var parts = Address.Split(" - ").ToList();
//         if (parts.Count == 1)
//         {
//             Address = parts.First().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//         }

//         if (parts.Count == 2)
//         {
//             Address = parts.First().IfBlank(Util.EmptyString);
//             string maybeNeigh = parts.Last().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//             if (maybeNeigh.Length == 2)
//             {
//                 State = maybeNeigh;
//             }
//             else
//             {
//                 Neighborhood = maybeNeigh;
//             }
//         }

//         if (parts.Count == 3)
//         {
//             Address = parts.First().IfBlank(Util.EmptyString);
//             string maybeCity = parts.Last().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//             if (maybeCity.Length == 2)
//             {
//                 State = maybeCity;
//             }
//             else
//             {
//                 City = maybeCity;
//             }

//             parts.RemoveLast();
//             parts = parts.Skip(1).ToList();
//             Neighborhood = parts.FirstOrDefault().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//         }

//         if (parts.Count == 6)
//         {
//             string ad = parts[0] + ", " + parts[1] + " " + parts[2];
//             parts.RemoveAt(1);
//             parts.RemoveAt(2);
//             parts[0] = ad;
//         }

//         if (parts.Count == 5)
//         {
//             string ad = parts[0] + ", " + parts[1];
//             parts.RemoveAt(1);
//             parts[0] = ad;
//         }

//         if (parts.Count == 4)
//         {
//             Address = parts.First().IfBlank(Util.EmptyString);
//             string maybeState = parts.Last().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//             parts.RemoveLast();
//             string maybeCity = parts.Last().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//             parts.RemoveLast();
//             City = maybeCity;
//             State = maybeState;
//             parts = parts.Skip(1).ToList();
//             Neighborhood = parts.FirstOrDefault().IfBlank(Util.EmptyString).TrimAny(" ", ",", "-");
//         }
//     }

//     Address = Address.FixText();
//     if (Address.Contains(","))
//     {
//         var parts = Address.GetAfter(",").SplitAny(" ", ".", ",").ToList();
//         Number = parts.FirstOrDefault(x => x == "s/n" || x == "sn" || x == "s" || x == "sem" || x.IsNumber());
//         parts.Remove(Number);
//         Complement = parts.SelectJoinString(" ");
//         Address = Address.GetBefore(",");
//     }
//     else
//     {
//         var adparts = Address.SplitAny(" ", "-").ToList();
//         if (adparts.Any())
//         {
//             string maybeNumber = adparts.FirstOrDefault(x => x == "s/n" || x == "sn" || x.IsNumber()).IfBlank(Util.EmptyString).TrimAny(" ", ",");
//             Complement = adparts.SelectJoinString(" ").GetAfter(maybeNumber).TrimAny(" ", ",");
//             Number = maybeNumber;
//             Address = adparts.SelectJoinString(" ").GetBefore(maybeNumber).TrimAny(" ", ",");
//         }
//     }

//     Number = Number.TrimBetween().TrimAny(" ", ",", "-");
//     Complement = Complement.TrimBetween().TrimAny(" ", ",", "-");
//     var d = CreateLocation<T>(Address, Number, Complement, Neighborhood, City, State, Country, PostalCode);
//     d["original_string"] = original;
//     return d;
// }
}
