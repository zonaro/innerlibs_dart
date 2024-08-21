import 'package:innerlibs/innerlibs.dart';

typedef CodigoRegimeTributario = RegimeTributario;

/// Códigos de regimes tributários
typedef CRT = RegimeTributario;

typedef MetodoPagamento = FormaPagamento;

typedef TipoNota = TipoOperacao;

enum FinalidadeNFe {
  normal(1),
  complementar(2),
  ajuste(3),
  devolucao(4);

  final int value;
  const FinalidadeNFe(this.value);

  factory FinalidadeNFe.fromInt(int value) {
    switch (value) {
      case 1:
        return FinalidadeNFe.normal;
      case 2:
        return FinalidadeNFe.complementar;
      case 3:
        return FinalidadeNFe.ajuste;
      case 4:
        return FinalidadeNFe.devolucao;
      default:
        throw ArgumentError('FinNFe inválido: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case FinalidadeNFe.normal:
        return 'NF-e normal';
      case FinalidadeNFe.complementar:
        return 'NF-e complementar';
      case FinalidadeNFe.ajuste:
        return 'NF-e de ajuste';
      case FinalidadeNFe.devolucao:
        return 'Devolução de mercadoria';
    }
  }
}

/// Enumeração que representa os indicadores de meio de pagamento para Nota Fiscal Eletrônica (NFe).
enum FormaPagamento {
  naoDefinido(null),

  /// Dinheiro
  dinheiro(1),

  /// Cheque
  cheque(2),

  /// Cartão de Crédito
  cartaoCredito(3),

  /// Cartão de Débito
  cartaoDebito(4),

  /// Crédito Loja
  creditoLoja(5),

  /// Vale Alimentação
  valeAlimentacao(10),

  /// Vale Refeição
  valeRefeicao(11),

  /// Vale Presente
  valePresente(12),

  /// Vale Combustível
  valeCombustivel(13),

  /// Duplicata Mercantil
  duplicataMercantil(14),

  /// Boleto Bancário
  boletoBancario(15),

  /// Depósito Bancário
  depositoBancario(16),

  /// PIX
  pix(17),

  /// Transferência Bancária, Carteira Digital
  transferenciaBancariaCarteiraDigital(18),

  /// Cashback, Cartão Fidelidade
  cashbackCartaoFidelidade(19),

  /// Sem Pagamento
  semPagamento(90),

  /// Outros
  outros(99);

  final int? value;

  /// Construtor constante que associa um valor de int a cada indicador de meio de pagamento.
  const FormaPagamento(this.value);

  factory FormaPagamento.fromInt(int? value) {
    switch (value) {
      case 1:
        return FormaPagamento.dinheiro;
      case 2:
        return FormaPagamento.cheque;
      case 3:
        return FormaPagamento.cartaoCredito;
      case 4:
        return FormaPagamento.cartaoDebito;
      case 5:
        return FormaPagamento.creditoLoja;
      case 10:
        return FormaPagamento.valeAlimentacao;
      case 11:
        return FormaPagamento.valeRefeicao;
      case 12:
        return FormaPagamento.valePresente;
      case 13:
        return FormaPagamento.valeCombustivel;
      case 14:
        return FormaPagamento.duplicataMercantil;
      case 15:
        return FormaPagamento.boletoBancario;
      case 16:
        return FormaPagamento.depositoBancario;
      case 17:
        return FormaPagamento.pix;
      case 18:
        return FormaPagamento.transferenciaBancariaCarteiraDigital;
      case 19:
        return FormaPagamento.cashbackCartaoFidelidade;
      case 90:
        return FormaPagamento.semPagamento;
      case 99:
        return FormaPagamento.outros;
      default:
        return FormaPagamento.naoDefinido;
    }
  }

  factory FormaPagamento.fromValue(dynamic value) {
    if (value == null) {
      return FormaPagamento.naoDefinido;
    }
    if (value is FormaPagamento) {
      return value;
    }
    if (value is bool) {
      return value ? FormaPagamento.dinheiro : FormaPagamento.semPagamento;
    }

    if (value is num) {
      return FormaPagamento.fromInt(value.floor());
    }
    var svalue = "$value".toLowerCase();

    if (svalue.isNumericOnly) {
      return FormaPagamento.fromInt(svalue.toNumOrZero.floor());
    }

    switch (svalue) {
      case 'dinheiro':
        return FormaPagamento.dinheiro;
      case 'cheque':
        return FormaPagamento.cheque;
      case 'cartaocredito':
      case 'cartaodecredito':
        return FormaPagamento.cartaoCredito;
      case 'cartaodebito':
      case 'cartaodedebito':
        return FormaPagamento.cartaoDebito;
      case 'creditoloja':
        return FormaPagamento.creditoLoja;
      case 'valealimentacao':
        return FormaPagamento.valeAlimentacao;
      case 'valerefeicao':
        return FormaPagamento.valeRefeicao;
      case 'valepresente':
        return FormaPagamento.valePresente;
      case 'valecombustivel':
        return FormaPagamento.valeCombustivel;
      case 'duplicatamercantil':
        return FormaPagamento.duplicataMercantil;
      case 'boletobancario':
        return FormaPagamento.boletoBancario;
      case 'depositobancario':
        return FormaPagamento.depositoBancario;
      case 'pix':
        return FormaPagamento.pix;
      case 'transferenciabancariacarteiradigital':
      case 'transferenciabancaria':
      case 'carteiradigital':
        return FormaPagamento.transferenciaBancariaCarteiraDigital;
      case 'cashbackcartaofidelidade':
      case 'cashback':
      case 'cartaofidelidade':
        return FormaPagamento.cashbackCartaoFidelidade;
      case 'sempagamento':
      case 'nenhum':
        return FormaPagamento.semPagamento;
      case 'outros':
      default:
        return FormaPagamento.outros;
    }
  }

  @override
  String toString() {
    switch (this) {
      case FormaPagamento.dinheiro:
        return 'Dinheiro';
      case FormaPagamento.cheque:
        return 'Cheque';
      case FormaPagamento.cartaoCredito:
        return 'Cartão de Crédito';
      case FormaPagamento.cartaoDebito:
        return 'Cartão de Débito';
      case FormaPagamento.creditoLoja:
        return 'Crédito Loja';
      case FormaPagamento.valeAlimentacao:
        return 'Vale Alimentação';
      case FormaPagamento.valeRefeicao:
        return 'Vale Refeição';
      case FormaPagamento.valePresente:
        return 'Vale Presente';
      case FormaPagamento.valeCombustivel:
        return 'Vale Combustível';
      case FormaPagamento.duplicataMercantil:
        return 'Duplicata Mercantil';
      case FormaPagamento.boletoBancario:
        return 'Boleto Bancário';
      case FormaPagamento.depositoBancario:
        return 'Depósito Bancário';
      case FormaPagamento.pix:
        return 'PIX';
      case FormaPagamento.transferenciaBancariaCarteiraDigital:
        return 'Transferência Bancária, Carteira Digital';
      case FormaPagamento.cashbackCartaoFidelidade:
        return 'Cashback, Cartão Fidelidade';
      case FormaPagamento.semPagamento:
        return 'Sem Pagamento';
      case FormaPagamento.outros:
        return 'Outros';
      default:
        return 'Indicador de meio de pagamento desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de operação de uma Nota Fiscal Eletrônica (NFe).
enum IdentificadorDestinoOperacaoNFe {
  ///1 - Operação interna
  operacaoInterna(1),

  ///2 - Operação interestadual
  operacaoInterestadual(2),

  ///3 - Operação com exterior
  operacaoComExterior(3);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de operação.
  const IdentificadorDestinoOperacaoNFe(this.value);
  factory IdentificadorDestinoOperacaoNFe.fromInt(int value) {
    switch (value) {
      case 1:
        return IdentificadorDestinoOperacaoNFe.operacaoInterna;
      case 2:
        return IdentificadorDestinoOperacaoNFe.operacaoInterestadual;
      case 3:
        return IdentificadorDestinoOperacaoNFe.operacaoComExterior;
      default:
        throw ArgumentError('Tipo de operação desconhecido: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case IdentificadorDestinoOperacaoNFe.operacaoInterna:
        return 'Operação interna';
      case IdentificadorDestinoOperacaoNFe.operacaoInterestadual:
        return 'Operação interestadual';
      case IdentificadorDestinoOperacaoNFe.operacaoComExterior:
        return 'Operação com exterior';
      default:
        return 'Tipo de operação desconhecido';
    }
  }
}

/// Enumeração que representa os indicadores de forma de pagamento de documentos fiscais.
enum IndicadorFormaPagamento {
  /// Pagamento à Vista
  pagamentoAVista(0),

  /// Pagamento a Prazo
  pagamentoAPrazo(1);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada indicador de forma de pagamento.
  const IndicadorFormaPagamento(this.value);
  factory IndicadorFormaPagamento.fromInt(int value) {
    switch (value) {
      case 0:
        return IndicadorFormaPagamento.pagamentoAVista;
      case 1:
        return IndicadorFormaPagamento.pagamentoAPrazo;
      default:
        throw ArgumentError('Indicador de forma de pagamento desconhecido: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case IndicadorFormaPagamento.pagamentoAVista:
        return 'Pagamento à Vista';
      case IndicadorFormaPagamento.pagamentoAPrazo:
        return 'Pagamento a Prazo';
      default:
        return 'Indicador de forma de pagamento desconhecido';
    }
  }
}

/// Enumeração que representa os indicadores de Inscrição Estadual do destinatário.
enum IndicadorIEDestinatario {
  /// Contribuinte ICMS (informar a IE do destinatário)
  contribuinteICMS(1),

  /// Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS
  contribuinteIsento(2),

  /// Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS
  naoContribuinte(9);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada indicador de IE.
  const IndicadorIEDestinatario(this.value);

  /// Método factory para construir os valores a partir de um inteiro.
  factory IndicadorIEDestinatario.fromInt(int value) {
    switch (value) {
      case 1:
        return IndicadorIEDestinatario.contribuinteICMS;
      case 2:
        return IndicadorIEDestinatario.contribuinteIsento;
      case 9:
        return IndicadorIEDestinatario.naoContribuinte;
      default:
        throw ArgumentError('Indicador de IE desconhecido: $value');
    }
  }

  /// Retorna o tipo de contribuinte com base no tipo ou documento fornecido.
  ///
  /// O parâmetro [tipoPessoaOuDocumento] representa o tipo ou documento do contribuinte.
  /// O parâmetro [inscricaoRg] é opcional e representa a inscrição RG do contribuinte, sendo "ISENTO" o valor padrão.
  ///
  /// Retorna uma expressão de caractere que representa o tipo de contribuinte:
  /// - "9 - NÃO CONTRIBUINTE" para pessoas físicas.
  /// - "2 - CONTRIBUINTE ISENTO" para pessoas jurídicas com inscrição RG igual a "ISENTO".
  /// - "1 - CONTRIBUINTE ICMS" para pessoas jurídicas com inscrição RG diferente de "ISENTO".
  ///
  /// Se o parâmetro [tipoPessoaOuDocumento] estiver vazio, retorna uma string vazia.
  factory IndicadorIEDestinatario.fromValue(dynamic tipoPessoaOuDocumento, [int? inscricaoRg]) {
    if (tipoPessoaOuDocumento == null) {
      return IndicadorIEDestinatario.naoContribuinte;
    }

    if (tipoPessoaOuDocumento is String) {
      if (tipoPessoaOuDocumento.isBlank) {
        return IndicadorIEDestinatario.naoContribuinte;
      }

      if (tipoPessoaOuDocumento.keywordContainsAny(["isento", "contribuinteIsento"])) {
        return IndicadorIEDestinatario.contribuinteIsento;
      }
      if (tipoPessoaOuDocumento.keywordContainsAny(["contribuinte", "contribuinteICMS"])) {
        return IndicadorIEDestinatario.contribuinteICMS;
      }
    }

    var tipoPessoa = TipoPessoa.fromValue(tipoPessoaOuDocumento);

    if (tipoPessoa == TipoPessoa.fisica || tipoPessoa == TipoPessoa.outros) {
      return IndicadorIEDestinatario.naoContribuinte;
    } else {
      if (inscricaoRg == null || inscricaoRg == 0) {
        return IndicadorIEDestinatario.contribuinteIsento;
      } else {
        return IndicadorIEDestinatario.contribuinteICMS;
      }
    }
  }

  @override
  String toString() {
    switch (this) {
      case IndicadorIEDestinatario.contribuinteICMS:
        return 'Contribuinte ICMS (informar a IE do destinatário)';
      case IndicadorIEDestinatario.contribuinteIsento:
        return 'Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS';
      case IndicadorIEDestinatario.naoContribuinte:
        return 'Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS';
      default:
        return 'Indicador de IE desconhecido';
    }
  }
}

/// Enumeração que representa os indicadores de intermediação para Nota Fiscal Eletrônica (NFe).
enum IndicadorIntermediacaoNFe {
  /// Operação Presencial
  operacaoPresencial(1),

  /// Operação Não Presencial, pela Internet
  operacaoNaoPresencialInternet(2),

  /// Operação Não Presencial, Teleatendimento
  operacaoNaoPresencialTeleatendimento(3),

  /// NFC-e em operação com entrega em domicílio
  nfceOperacaoEntregaDomicilio(4),

  /// Operação Não Presencial, outros
  operacaoNaoPresencialOutros(9);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada indicador de intermediação.
  const IndicadorIntermediacaoNFe(this.value);
  factory IndicadorIntermediacaoNFe.fromInt(int value) {
    switch (value) {
      case 1:
        return IndicadorIntermediacaoNFe.operacaoPresencial;
      case 2:
        return IndicadorIntermediacaoNFe.operacaoNaoPresencialInternet;
      case 3:
        return IndicadorIntermediacaoNFe.operacaoNaoPresencialTeleatendimento;
      case 4:
        return IndicadorIntermediacaoNFe.nfceOperacaoEntregaDomicilio;
      case 9:
        return IndicadorIntermediacaoNFe.operacaoNaoPresencialOutros;
      default:
        throw ArgumentError('Indicador de Intermediação desconhecido: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case IndicadorIntermediacaoNFe.operacaoPresencial:
        return 'Operação Presencial';
      case IndicadorIntermediacaoNFe.operacaoNaoPresencialInternet:
        return 'Operação Não Presencial, pela Internet';
      case IndicadorIntermediacaoNFe.operacaoNaoPresencialTeleatendimento:
        return 'Operação Não Presencial, Teleatendimento';
      case IndicadorIntermediacaoNFe.nfceOperacaoEntregaDomicilio:
        return 'NFC-e em operação com entrega em domicílio';
      case IndicadorIntermediacaoNFe.operacaoNaoPresencialOutros:
        return 'Operação Não Presencial, outros';
      default:
        return 'Indicador de Intermediação desconhecido';
    }
  }
}

/// Enumeração que representa os indicadores de presença do comprador
/// no momento da emissão da Nota Fiscal Eletrônica (NFe).
enum IndicadorPresencaNFe {
  /// Não se aplica (por exemplo, Nota Fiscal complementar ou de ajuste)
  naoSeAplica(0),

  /// Operação presencial
  operacaoPresencial(1),

  /// Operação não presencial, pela Internet
  operacaoInternet(2),

  /// Operação não presencial, Teleatendimento
  operacaoTeleatendimento(3),

  /// NFC-e em operação com entrega a domicílio
  entregaDomicilio(4),

  /// Operação presencial, fora do estabelecimento (incluído na versão 4.0)
  operacaoPresencialForaEstabelecimento(5),

  /// Operação não presencial, outros
  operacaoNaoPresencialOutros(9);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada indicador de presença.
  const IndicadorPresencaNFe(this.value);

  /// Método factory para construir os valores da enum a partir de um inteiro.
  factory IndicadorPresencaNFe.fromInt(int value) {
    switch (value) {
      case 0:
        return IndicadorPresencaNFe.naoSeAplica;
      case 1:
        return IndicadorPresencaNFe.operacaoPresencial;
      case 2:
        return IndicadorPresencaNFe.operacaoInternet;
      case 3:
        return IndicadorPresencaNFe.operacaoTeleatendimento;
      case 4:
        return IndicadorPresencaNFe.entregaDomicilio;
      case 5:
        return IndicadorPresencaNFe.operacaoPresencialForaEstabelecimento;
      case 9:
        return IndicadorPresencaNFe.operacaoNaoPresencialOutros;
      default:
        throw ArgumentError('Indicador de presença desconhecido: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case IndicadorPresencaNFe.naoSeAplica:
        return 'Não se aplica';
      case IndicadorPresencaNFe.operacaoPresencial:
        return 'Operação presencial';
      case IndicadorPresencaNFe.operacaoInternet:
        return 'Operação não presencial, pela Internet';
      case IndicadorPresencaNFe.operacaoTeleatendimento:
        return 'Operação não presencial, Teleatendimento';
      case IndicadorPresencaNFe.entregaDomicilio:
        return 'NFC-e em operação com entrega a domicílio';
      case IndicadorPresencaNFe.operacaoPresencialForaEstabelecimento:
        return 'Operação presencial, fora do estabelecimento';
      case IndicadorPresencaNFe.operacaoNaoPresencialOutros:
        return 'Operação não presencial, outros';
      default:
        return 'Indicador de presença desconhecido';
    }
  }
}

/// Enumeração que representa as modalidades de determinação da base de cálculo do ICMS para Nota Fiscal Eletrônica (NFe).
enum ModalidadeDeterminacaoDaBc {
  /// Margem Valor Agregado (%)
  margemValorAgregado(0),

  /// Pauta (Valor)
  pautaValor(1),

  /// Preço Tabelado Máx. (valor)
  precoTabeladoMax(2),

  /// Valor da operação
  valorDaOperacao(3);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada modalidade de determinação da base de cálculo.
  const ModalidadeDeterminacaoDaBc(this.value);
  factory ModalidadeDeterminacaoDaBc.fromInt(int value) {
    switch (value) {
      case 0:
        return ModalidadeDeterminacaoDaBc.margemValorAgregado;
      case 1:
        return ModalidadeDeterminacaoDaBc.pautaValor;
      case 2:
        return ModalidadeDeterminacaoDaBc.precoTabeladoMax;
      case 3:
        return ModalidadeDeterminacaoDaBc.valorDaOperacao;
      default:
        throw ArgumentError('Modalidade de Determinação da BC desconhecida: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case ModalidadeDeterminacaoDaBc.margemValorAgregado:
        return 'Margem Valor Agregado (%)';
      case ModalidadeDeterminacaoDaBc.pautaValor:
        return 'Pauta (Valor)';
      case ModalidadeDeterminacaoDaBc.precoTabeladoMax:
        return 'Preço Tabelado Máx. (valor)';
      case ModalidadeDeterminacaoDaBc.valorDaOperacao:
        return 'Valor da operação';
      default:
        return 'Modalidade de Determinação da BC desconhecida';
    }
  }
}

/// Enumeração que representa as modalidades de determinação da base de cálculo do ICMS ST.
enum ModalidadeDeterminacaoDaBcST {
  /// Preço tabelado ou máximo sugerido
  precoTabeladoOuMaximoSugerido(0),

  /// Lista Negativa (valor)
  listaNegativa(1),

  /// Lista Positiva (valor)
  listaPositiva(2),

  /// Lista Neutra (valor)
  listaNeutra(3),

  /// Margem Valor Agregado (%)
  margemValorAgregado(4),

  /// Pauta (valor)
  pauta(5);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada modalidade.
  const ModalidadeDeterminacaoDaBcST(this.value);
  factory ModalidadeDeterminacaoDaBcST.fromInt(int value) {
    switch (value) {
      case 0:
        return ModalidadeDeterminacaoDaBcST.precoTabeladoOuMaximoSugerido;
      case 1:
        return ModalidadeDeterminacaoDaBcST.listaNegativa;
      case 2:
        return ModalidadeDeterminacaoDaBcST.listaPositiva;
      case 3:
        return ModalidadeDeterminacaoDaBcST.listaNeutra;
      case 4:
        return ModalidadeDeterminacaoDaBcST.margemValorAgregado;
      case 5:
        return ModalidadeDeterminacaoDaBcST.pauta;
      default:
        throw ArgumentError('Modalidade de determinação da BC ST desconhecida: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case ModalidadeDeterminacaoDaBcST.precoTabeladoOuMaximoSugerido:
        return 'Preço Tabelado ou Máximo Sugerido';
      case ModalidadeDeterminacaoDaBcST.listaNegativa:
        return 'Lista Negativa (valor)';
      case ModalidadeDeterminacaoDaBcST.listaPositiva:
        return 'Lista Positiva (valor)';
      case ModalidadeDeterminacaoDaBcST.listaNeutra:
        return 'Lista Neutra (valor)';
      case ModalidadeDeterminacaoDaBcST.margemValorAgregado:
        return 'Margem Valor Agregado (%)';
      case ModalidadeDeterminacaoDaBcST.pauta:
        return 'Pauta (valor)';
      default:
        return 'Modalidade de determinação da BC ST desconhecida';
    }
  }
}

/// Enumeração que representa as modalidades de frete na Nota Fiscal Eletrônica (NFe).
enum ModalidadeFreteNFe {
  /// Contratação do Frete por conta do Remetente (CIF)
  remetenteCIF(0),

  /// Contratação do Frete por conta do Destinatário (FOB)
  destinatarioFOB(1),

  /// Contratação do Frete por conta de Terceiros
  terceiros(2),

  /// Transporte Próprio por conta do Remetente
  proprioRemetente(3),

  /// Transporte Próprio por conta do Destinatário
  proprioDestinatario(4),

  /// Sem Ocorrência de Transporte
  semTransporte(9);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada modalidade de frete.
  const ModalidadeFreteNFe(this.value);
  factory ModalidadeFreteNFe.fromInt(int value) {
    switch (value) {
      case 0:
        return ModalidadeFreteNFe.remetenteCIF;
      case 1:
        return ModalidadeFreteNFe.destinatarioFOB;
      case 2:
        return ModalidadeFreteNFe.terceiros;
      case 3:
        return ModalidadeFreteNFe.proprioRemetente;
      case 4:
        return ModalidadeFreteNFe.proprioDestinatario;
      case 9:
        return ModalidadeFreteNFe.semTransporte;
      default:
        throw ArgumentError('Modalidade de frete desconhecida: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case ModalidadeFreteNFe.remetenteCIF:
        return 'Contratação do Frete por conta do Remetente (CIF)';
      case ModalidadeFreteNFe.destinatarioFOB:
        return 'Contratação do Frete por conta do Destinatário (FOB)';
      case ModalidadeFreteNFe.terceiros:
        return 'Contratação do Frete por conta de Terceiros';
      case ModalidadeFreteNFe.proprioRemetente:
        return 'Transporte Próprio por conta do Remetente';
      case ModalidadeFreteNFe.proprioDestinatario:
        return 'Transporte Próprio por conta do Destinatário';
      case ModalidadeFreteNFe.semTransporte:
        return 'Sem Ocorrência de Transporte';
      default:
        return 'Modalidade de frete desconhecida';
    }
  }
}

/// Modelos dos DFes (NFe, CTe, MDFe, NFCe, etc...)
enum ModeloDFe {
  /// NF-e (Modelo: 55)
  nfe(55),

  /// NFC-e (Modelo: 65)
  nfce(65),

  /// CT-e (Modelo: 57)
  cte(57),

  /// MDF-e (Modelo: 58)
  mdfe(58),

  /// CTeOS (Modelo: 67)
  cteos(67);

  final int value;
  const ModeloDFe(this.value);

  factory ModeloDFe.fromInt(int value) {
    switch (value) {
      case 55:
        return ModeloDFe.nfe;
      case 65:
        return ModeloDFe.nfce;
      case 57:
        return ModeloDFe.cte;
      case 58:
        return ModeloDFe.mdfe;
      case 67:
        return ModeloDFe.cteos;
      default:
        throw ArgumentError('ModeloDFe inválido: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case ModeloDFe.nfe:
        return 'NF-e';
      case ModeloDFe.nfce:
        return 'NFC-e';
      case ModeloDFe.cte:
        return 'CT-e';
      case ModeloDFe.mdfe:
        return 'MDF-e';
      case ModeloDFe.cteos:
        return 'CTeOS';
      default:
        return "DF-e Desconhecido";
    }
  }
}

/// Enumeração que representa os tipos de impressão de documentos fiscais.
enum OrigemProduto {
  /// Nacional (exceto as indicadas nos códigos 3, 4, 5 e 8).
  nacional(0),

  /// Estrangeira – Importação direta, exceto a indicada no código 6.
  estrangeiraImportacaoDireta(1),

  /// Estrangeira – Adquirida no mercado interno, exceto a indicada no código 7.
  estrangeiraAdquiridaMercadoInterno(2),

  /// Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%.
  nacionalConteudoImportacao40a70(3),

  /// Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos (PPB).
  nacionalPPB(4),

  /// Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%.
  nacionalConteudoImportacaoAte40(5),

  /// Estrangeira – Importação direta, sem similar nacional, constante em lista de Resolução CAMEX e gás natural.
  estrangeiraImportacaoDiretaSemSimilar(6),

  /// Estrangeira – Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução CAMEX e gás natural.
  estrangeiraAdquiridaMercadoInternoSemSimilar(7),

  /// Nacional, mercadoria ou bem com Conteúdo de Importação superior a 70%.
  nacionalConteudoImportacaoSuperior70(8);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de impressão.
  const OrigemProduto(this.value);

  factory OrigemProduto.fromInt(int value) {
    switch (value) {
      case 0:
        return OrigemProduto.nacional;
      case 1:
        return OrigemProduto.estrangeiraImportacaoDireta;
      case 2:
        return OrigemProduto.estrangeiraAdquiridaMercadoInterno;
      case 3:
        return OrigemProduto.nacionalConteudoImportacao40a70;
      case 4:
        return OrigemProduto.nacionalPPB;
      case 5:
        return OrigemProduto.nacionalConteudoImportacaoAte40;
      case 6:
        return OrigemProduto.estrangeiraImportacaoDiretaSemSimilar;
      case 7:
        return OrigemProduto.estrangeiraAdquiridaMercadoInternoSemSimilar;
      case 8:
        return OrigemProduto.nacionalConteudoImportacaoSuperior70;
      default:
        throw ArgumentError('Origem do Produto Desconhecida: $value');
    }
  }

  factory OrigemProduto.fromValue(dynamic value) {
    if (value == null) {
      return OrigemProduto.nacional;
    } else if (value is OrigemProduto) {
      return value;
    } else if (value is string && value.isNumericOnly) {
      return OrigemProduto.fromInt(value.toNumOrZero.floor());
    } else if (value is num) {
      return OrigemProduto.fromInt(value.floor());
    } else {
      switch (generateKeyword(value)) {
        case '0':
        case 'nacional':
          return OrigemProduto.nacional;
        case '1':
        case 'estrangeiraimportacaodireta':
          return OrigemProduto.estrangeiraImportacaoDireta;
        case '2':
        case 'estrangeiraadquiridamercadointerno':
          return OrigemProduto.estrangeiraAdquiridaMercadoInterno;
        case '3':
        case 'nacionalconteudoimportacao40a70':
          return OrigemProduto.nacionalConteudoImportacao40a70;
        case '4':
        case 'nacionalppb':
          return OrigemProduto.nacionalPPB;
        case '5':
        case 'nacionalconteudoimportacaoate40':
          return OrigemProduto.nacionalConteudoImportacaoAte40;
        case '6':
        case 'estrangeiraimportacaodiretasemsimilar':
          return OrigemProduto.estrangeiraImportacaoDiretaSemSimilar;
        case '7':
        case 'estrangeiraadquiridamercadointernosemsimilar':
          return OrigemProduto.estrangeiraAdquiridaMercadoInternoSemSimilar;
        case '8':
        case 'nacionalconteudoimportacaosuperior70':
          return OrigemProduto.nacionalConteudoImportacaoSuperior70;
        default:
          throw ArgumentError('Origem do Produto Desconhecida: $value');
      }
    }
  }

  @override
  String toString() {
    switch (this) {
      case OrigemProduto.nacional:
        return 'Nacional (exceto as indicadas nos códigos 3, 4, 5 e 8)';
      case OrigemProduto.estrangeiraImportacaoDireta:
        return 'Estrangeira – Importação direta, exceto a indicada no código 6';
      case OrigemProduto.estrangeiraAdquiridaMercadoInterno:
        return 'Estrangeira – Adquirida no mercado interno, exceto a indicada no código 7';
      case OrigemProduto.nacionalConteudoImportacao40a70:
        return 'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%';
      case OrigemProduto.nacionalPPB:
        return 'Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos (PPB)';
      case OrigemProduto.nacionalConteudoImportacaoAte40:
        return 'Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%';
      case OrigemProduto.estrangeiraImportacaoDiretaSemSimilar:
        return 'Estrangeira – Importação direta, sem similar nacional, constante em lista de Resolução CAMEX e gás natural';
      case OrigemProduto.estrangeiraAdquiridaMercadoInternoSemSimilar:
        return 'Estrangeira – Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução CAMEX e gás natural';
      case OrigemProduto.nacionalConteudoImportacaoSuperior70:
        return 'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 70%';
      default:
        return 'Tipo de impressão desconhecido';
    }
  }
}

/// Enumeração que representa os modos de emissão de NF-e.
enum ProcessoEmissaoNFe {
  /// Emissão de NF-e com aplicativo do contribuinte.
  aplicativoContribuinte(0),

  /// Emissão de NF-e avulsa pelo Fisco.
  avulsaFisco(1),

  /// Emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco.
  avulsaContribuinteSiteFisco(2),

  /// Emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco.
  aplicativoFornecidoFisco(3);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada modo de emissão.
  const ProcessoEmissaoNFe(this.value);
  factory ProcessoEmissaoNFe.fromInt(int value) {
    switch (value) {
      case 0:
        return ProcessoEmissaoNFe.aplicativoContribuinte;
      case 1:
        return ProcessoEmissaoNFe.avulsaFisco;
      case 2:
        return ProcessoEmissaoNFe.avulsaContribuinteSiteFisco;
      case 3:
        return ProcessoEmissaoNFe.aplicativoFornecidoFisco;
      default:
        throw ArgumentError('Modo de emissão desconhecido: $value');
    }
  }
  @override
  String toString() {
    switch (this) {
      case ProcessoEmissaoNFe.aplicativoContribuinte:
        return 'Emissão de NF-e com aplicativo do contribuinte';
      case ProcessoEmissaoNFe.avulsaFisco:
        return 'Emissão de NF-e avulsa pelo Fisco';
      case ProcessoEmissaoNFe.avulsaContribuinteSiteFisco:
        return 'Emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco';
      case ProcessoEmissaoNFe.aplicativoFornecidoFisco:
        return 'Emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco';
      default:
        return 'Modo de emissão desconhecido';
    }
  }
}

/// Regimes tributários
enum RegimeTributario {
  /// 1 - Simples Nacional
  simplesNacional(1),

  /// 2 - Simples Nacional; excesso sublimite de receita bruta
  simplesNacionalExcessoSublimite(2),

  /// 3 - Regime Normal
  regimeNormal(3);

  final int value;
  const RegimeTributario(this.value);

  factory RegimeTributario.fromInt(int value) {
    switch (value) {
      case 1:
        return RegimeTributario.simplesNacional;
      case 2:
        return RegimeTributario.simplesNacionalExcessoSublimite;
      case 3:
        return RegimeTributario.regimeNormal;
      default:
        throw ArgumentError('Regime Tributário inválido: $value');
    }
  }

  factory RegimeTributario.fromValue(dynamic value) {
    if (value is RegimeTributario) {
      return value;
    }
    if (value is num) {
      return RegimeTributario.fromInt(value.floor());
    }
    if (value is string && value.isNumericOnly) {
      return RegimeTributario.fromInt(value.onlyNumbersInt!);
    }

    switch (generateKeyword(value)) {
      case '1':
      case 'simplesnacional':
      case 'simples':
        return RegimeTributario.simplesNacional;
      case '2':
      case 'simplesnacionalexcessosublimite':
      case 'simplesnacionalexcessosublimitereceitabruta':
      case 'simplesnacionalexcessosublimitedereceitabruta':
      case 'receitabruta':
      case 'excessosublimite':
      case 'excesso':
        return RegimeTributario.simplesNacionalExcessoSublimite;
      case '3':
      case 'regimenormal':
      case 'normal':
        return RegimeTributario.regimeNormal;
      default:
        throw ArgumentError('Regime Tributário inválido: $value');
    }
  }

  bool get isSimplesNacional => this == RegimeTributario.simplesNacional || this == RegimeTributario.simplesNacionalExcessoSublimite;
}

enum SeloControle {
  produtoNacional(971001, 'Verde combinado com marrom'),
  produtoNacionalExportacaoTipo1(971010, 'Verde escuro combinado com marrom'),
  produtoNacionalExportacaoTipo2(971011, 'Verde escuro combinado com marrom'),
  produtoNacionalExportacaoTipo3(971012, 'Verde escuro combinado com marrom'),
  produtoEstrangeiro(861009, 'Vermelho combinado com azul');

  final int value;
  final string corSelo;
  const SeloControle(this.value, this.corSelo);

  factory SeloControle.fromInt(int value) {
    switch (value) {
      case 971001:
        return SeloControle.produtoNacional;
      case 971010:
      case 1:
        return SeloControle.produtoNacionalExportacaoTipo1;
      case 971011:
      case 2:
        return SeloControle.produtoNacionalExportacaoTipo2;
      case 971012:
      case 3:
        return SeloControle.produtoNacionalExportacaoTipo3;
      case 861009:
        return SeloControle.produtoEstrangeiro;
      default:
        throw ArgumentError('Selo de controle desconhecido: $value');
    }
  }

  factory SeloControle.fromValue(dynamic value) {
    if (value is SeloControle) {
      return value;
    }
    if (value is num) {
      return SeloControle.fromInt(value.floor());
    }
    if (value is String && value.isNumericOnly) {
      return SeloControle.fromInt(value.onlyNumbersInt!);
    }

    switch (generateKeyword(value)) {
      case "nacional":
      case "produtonacional":
      case "n":
        return SeloControle.produtoNacional;
      case "produtoexportacaotipo1":
      case "exportacaotipo1":
      case "tipo1":
      case "produtonacionalexportacaotipo1":
        return SeloControle.produtoNacionalExportacaoTipo1;
      case "produtoexportacaotipo2":
      case "exportacaotipo2":
      case "tipo2":
      case "produtonacionalexportacaotipo2":
        return SeloControle.produtoNacionalExportacaoTipo2;
      case "produtoexportacaotipo3":
      case "exportacaotipo3":
      case "tipo3":
      case "produtonacionalexportacaotipo3":
        return SeloControle.produtoNacionalExportacaoTipo3;
      case "estrangeiro":
      case "produtoestrangeiro":
      case "ex":
        return SeloControle.produtoEstrangeiro;
      default:
        throw ArgumentError('Selo de controle desconhecido: $value');
    }
  }

  string get valorFormatado => value.fixedLength(6)!.insertAt(4, '-');

  @override
  String toString() {
    switch (this) {
      case SeloControle.produtoNacional:
        return 'Produto Nacional';
      case SeloControle.produtoNacionalExportacaoTipo1:
        return 'Produto Nacional para Exportação - Tipo 1';
      case SeloControle.produtoNacionalExportacaoTipo2:
        return 'Produto Nacional para Exportação - Tipo 2';
      case SeloControle.produtoNacionalExportacaoTipo3:
        return 'Produto Nacional para Exportação - Tipo 3';
      case SeloControle.produtoEstrangeiro:
        return 'Produto Estrangeiro';
      default:
        return 'Selo de controle desconhecido';
    }
  }
}

/// Enumeração que representa os status de Nota Fiscal Eletrônica (NFe).
enum StatusNFe {
  desconhecido(0),
  autorizado(100),
  cancelado(101),
  inutilizado(102),
  loteRecebido(103),
  loteProcessado(104),
  loteEmProcessamento(105),
  loteNaoLocalizado(106),
  servicoEmOperacao(107),
  servicoParalisadoMomentaneamente(108),
  servicoParalisadoSemPrevisao(109),
  usoDenegado(110),
  consultaCadastroUmaOcorrencia(111),
  consultaCadastroMultiplasOcorrencias(112),
  epecAutorizado(124),
  loteEventoProcessado(128),
  eventoRegistradoVinculadoNFe(135),
  eventoRegistradoNaoVinculadoNFe(136),
  nenhumDocumentoLocalizadoDestinatario(137),
  documentoLocalizadoDestinatario(138),
  pedidoDownloadProcessado(139),
  downloadDisponibilizado(140),
  ambienteContingenciaEPECBloqueado(142),
  autorizadoForaPrazo(150),
  canceladoForaPrazo(151);

  final int value;

  const StatusNFe(this.value);

  factory StatusNFe.fromInt(int value) {
    switch (value) {
      case 100:
        return StatusNFe.autorizado;
      case 101:
        return StatusNFe.cancelado;
      case 102:
        return StatusNFe.inutilizado;
      case 103:
        return StatusNFe.loteRecebido;
      case 104:
        return StatusNFe.loteProcessado;
      case 105:
        return StatusNFe.loteEmProcessamento;
      case 106:
        return StatusNFe.loteNaoLocalizado;
      case 107:
        return StatusNFe.servicoEmOperacao;
      case 108:
        return StatusNFe.servicoParalisadoMomentaneamente;
      case 109:
        return StatusNFe.servicoParalisadoSemPrevisao;
      case 110:
        return StatusNFe.usoDenegado;
      case 111:
        return StatusNFe.consultaCadastroUmaOcorrencia;
      case 112:
        return StatusNFe.consultaCadastroMultiplasOcorrencias;
      case 124:
        return StatusNFe.epecAutorizado;
      case 128:
        return StatusNFe.loteEventoProcessado;
      case 135:
        return StatusNFe.eventoRegistradoVinculadoNFe;
      case 136:
        return StatusNFe.eventoRegistradoNaoVinculadoNFe;
      case 137:
        return StatusNFe.nenhumDocumentoLocalizadoDestinatario;
      case 138:
        return StatusNFe.documentoLocalizadoDestinatario;
      case 139:
        return StatusNFe.pedidoDownloadProcessado;
      case 140:
        return StatusNFe.downloadDisponibilizado;
      case 142:
        return StatusNFe.ambienteContingenciaEPECBloqueado;
      case 150:
        return StatusNFe.autorizadoForaPrazo;
      case 151:
        return StatusNFe.canceladoForaPrazo;
      default:
        return StatusNFe.desconhecido;
    }
  }

  @override
  String toString() {
    switch (this) {
      case StatusNFe.autorizado:
        return 'Autorizado o uso da NF-e';
      case StatusNFe.cancelado:
        return 'Cancelamento de NF-e homologado';
      case StatusNFe.inutilizado:
        return 'Inutilização de número homologado';
      case StatusNFe.loteRecebido:
        return 'Lote recebido com sucesso';
      case StatusNFe.loteProcessado:
        return 'Lote processado';
      case StatusNFe.loteEmProcessamento:
        return 'Lote em processamento';
      case StatusNFe.loteNaoLocalizado:
        return 'Lote não localizado';
      case StatusNFe.servicoEmOperacao:
        return 'Serviço em Operação';
      case StatusNFe.servicoParalisadoMomentaneamente:
        return 'Serviço Paralisado Momentaneamente (curto prazo)';
      case StatusNFe.servicoParalisadoSemPrevisao:
        return 'Serviço Paralisado sem Previsão';
      case StatusNFe.usoDenegado:
        return 'Uso Denegado';
      case StatusNFe.consultaCadastroUmaOcorrencia:
        return 'Consulta cadastro com uma ocorrência';
      case StatusNFe.consultaCadastroMultiplasOcorrencias:
        return 'Consulta cadastro com mais de uma ocorrência';
      case StatusNFe.epecAutorizado:
        return 'EPEC Autorizado';
      case StatusNFe.loteEventoProcessado:
        return 'Lote de Evento Processado';
      case StatusNFe.eventoRegistradoVinculadoNFe:
        return 'Evento registrado e vinculado a NF-e';
      case StatusNFe.eventoRegistradoNaoVinculadoNFe:
        return 'Evento registrado, mas não vinculado a NF-e';
      case StatusNFe.nenhumDocumentoLocalizadoDestinatario:
        return 'Nenhum documento localizado para o Destinatário';
      case StatusNFe.documentoLocalizadoDestinatario:
        return 'Documento localizado para o Destinatário';
      case StatusNFe.pedidoDownloadProcessado:
        return 'Pedido de Download processado';
      case StatusNFe.downloadDisponibilizado:
        return 'Download disponibilizado';
      case StatusNFe.ambienteContingenciaEPECBloqueado:
        return 'Ambiente de Contingência EPEC bloqueado para o Emitente';
      case StatusNFe.autorizadoForaPrazo:
        return 'Autorizado o uso da NF-e, autorização fora de prazo';
      case StatusNFe.canceladoForaPrazo:
        return 'Cancelamento de NF-e homologado fora de prazo';
      default:
        return 'Status de NFe desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de ambiente para emissão de NF-e.
enum TipoAmbiente {
  /// Ambiente de Produção
  producao(1),

  /// Ambiente de Homologação
  homologacao(2);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de ambiente.
  const TipoAmbiente(this.value);

  /// Factory para construir os valores da enum a partir de um inteiro.
  factory TipoAmbiente.fromInt(int value) {
    switch (value) {
      case 1:
        return TipoAmbiente.producao;
      case 2:
        return TipoAmbiente.homologacao;
      default:
        throw ArgumentError('Tipo de ambiente desconhecido: $value');
    }
  }

  /// Factory para construir os valores da enum a partir de um valor dinâmico.
  /// - Retorna o ambiente de **homologação** caso o valor seja nulo.
  /// - Retorna o ambiente de **produção** caso o valor seja 1.
  /// - Retorna o ambiente de **homologação** caso o valor seja 0 ou 2.
  /// - Retorna o ambiente de **produção** caso o valor seja `producao`.
  /// - Retorna o ambiente de **homologação** caso o valor seja `homologacao`.
  /// - Retorna o ambiente de **homologação** caso o valor de `asBool()` retorne falso.
  /// - Retorna o ambiente de **produção** caso o valor de `asBool()` retorne verdadeiro.
  ///
  factory TipoAmbiente.fromValue(dynamic producao) {
    if (producao == null) return TipoAmbiente.homologacao;
    if (producao is TipoAmbiente) return producao;
    if (producao is num) {
      if (producao == 1) {
        return TipoAmbiente.producao;
      } else if (producao == 2 || producao == 0) {
        return TipoAmbiente.homologacao;
      }
    }
    if (producao is string) {
      if (producao.flatEqualAny(["producao", "1"])) {
        return TipoAmbiente.producao;
      } else if (producao.flatEqualAny(["homologacao", "2", "0"])) {
        return TipoAmbiente.homologacao;
      }
    }

    return (producao as Object?).asBool(everythingIsTrue: false) ? TipoAmbiente.producao : TipoAmbiente.homologacao;
  }

  @override
  String toString() {
    switch (this) {
      case TipoAmbiente.producao:
        return 'Produção';
      case TipoAmbiente.homologacao:
        return 'Homologação';
      default:
        return 'Tipo de ambiente desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de emissão de documentos fiscais.
enum TipoEmissao {
  /// Emissão normal
  normal(1),

  /// Emissão em contingência FS-IA
  contingenciaFSIA(2),

  /// Emissão em regime especial NFF
  regimeEspecialNFF(3),

  /// Emissão em contingência EPEC
  contingenciaEPEC(4),

  /// Emissão em contingência FS-DA
  contingenciaFSDA(5),

  /// Emissão em contingência SVC-AN
  contingenciaSVCAN(6),

  /// Emissão em contingência SVC-RS
  contingenciaSVCRS(7),

  /// Emissão em contingência SVC-SP
  contingenciaSVCSP(8),

  /// Emissão em contingência offline
  contingenciaOffLine(9);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de emissão.
  const TipoEmissao(this.value);

  factory TipoEmissao.fromInt(int value) {
    switch (value) {
      case 1:
        return TipoEmissao.normal;
      case 2:
        return TipoEmissao.contingenciaFSIA;
      case 3:
        return TipoEmissao.regimeEspecialNFF;
      case 4:
        return TipoEmissao.contingenciaEPEC;
      case 5:
        return TipoEmissao.contingenciaFSDA;
      case 6:
        return TipoEmissao.contingenciaSVCAN;
      case 7:
        return TipoEmissao.contingenciaSVCRS;
      case 8:
        return TipoEmissao.contingenciaSVCSP;
      case 9:
        return TipoEmissao.contingenciaOffLine;
      default:
        throw ArgumentError('Tipo de emissão desconhecido: $value');
    }
  }

  /// Retorna verdadeiro se o tipo de emissão for diferente de normal(1).
  bool get isContingencia => value != 1;

  @override
  String toString() {
    switch (this) {
      case TipoEmissao.normal:
        return 'Normal';
      case TipoEmissao.contingenciaFSIA:
        return 'Contingência FS-IA';
      case TipoEmissao.regimeEspecialNFF:
        return 'Regime Especial NFF';
      case TipoEmissao.contingenciaEPEC:
        return 'Contingência EPEC';
      case TipoEmissao.contingenciaFSDA:
        return 'Contingência FS-DA';
      case TipoEmissao.contingenciaSVCAN:
        return 'Contingência SVC-AN';
      case TipoEmissao.contingenciaSVCRS:
        return 'Contingência SVC-RS';
      case TipoEmissao.contingenciaSVCSP:
        return 'Contingência SVC-SP';
      case TipoEmissao.contingenciaOffLine:
        return 'Contingência Offline';
      default:
        return 'Tipo de emissão desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de impressão de documentos fiscais.
enum TipoImpressao {
  /// Sem geração de DANFE
  semGeracaoDANFE(0),

  /// DANFE normal, Retrato
  danfeNormalRetrato(1),

  /// DANFE normal, Paisagem
  danfeNormalPaisagem(2),

  /// DANFE Simplificado
  danfeSimplificado(3);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de impressão.
  const TipoImpressao(this.value);

  factory TipoImpressao.fromInt(int value) {
    switch (value) {
      case 0:
        return TipoImpressao.semGeracaoDANFE;
      case 1:
        return TipoImpressao.danfeNormalRetrato;
      case 2:
        return TipoImpressao.danfeNormalPaisagem;
      case 3:
        return TipoImpressao.danfeSimplificado;
      default:
        throw ArgumentError('Tipo de impressão desconhecido: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TipoImpressao.semGeracaoDANFE:
        return 'Sem geração de DANFE';
      case TipoImpressao.danfeNormalRetrato:
        return 'DANFE normal, Retrato';
      case TipoImpressao.danfeNormalPaisagem:
        return 'DANFE normal, Paisagem';
      case TipoImpressao.danfeSimplificado:
        return 'DANFE Simplificado';
      default:
        return 'Tipo de impressão desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de operação de documentos fiscais.
enum TipoOperacao {
  /// Entrada
  entrada(0),

  /// Saída
  saida(1);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de operação.
  const TipoOperacao(this.value);

  factory TipoOperacao.fromInt(int value) {
    switch (value) {
      case 0:
        return TipoOperacao.entrada;
      case 1:
        return TipoOperacao.saida;
      default:
        throw ArgumentError('Tipo de operação desconhecido: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TipoOperacao.entrada:
        return 'Entrada';
      case TipoOperacao.saida:
        return 'Saída';
      default:
        return 'Tipo de operação desconhecido';
    }
  }
}

enum TipoPessoa {
  fisica(0),
  juridica(1),
  outros(99);

  final int value;

  const TipoPessoa(this.value);

  /// Retorna o tipo de pessoa com base no tipo ou documento fornecido.
  ///
  /// - Se o valor estiver nulo retorna [fisica].
  /// - Se o valor for um booleano, retorna [juridica] se for verdadeiro e [fisica] se for falso.
  /// - Se o tipo do valor for [TipoPessoa], retorna o próprio valor.
  /// - Se o valor for um CNPJ válido, retorna [juridica].
  /// - Se o valor for um CPF válido, retorna [fisica].
  /// - Se o valor for um outro número, retorna [fisica] se for 0 e [juridica] se for 1.
  /// - Se o valor for uma string, retorna [fisica] se for 'fisica', 'cpf' ou em branco e [juridica] se for 'juridica' ou 'cnpj'.
  ///
  /// Parâmetros:
  /// - [value]: O tipo ou documento a ser verificado.
  ///
  /// Retorna:
  /// O tipo de pessoa correspondente ao tipo ou documento fornecido.
  factory TipoPessoa.fromValue(dynamic value) {
    value ??= TipoPessoa.outros;

    if (value is TipoPessoa) {
      return value;
    }

    if (value is bool) {
      return value ? TipoPessoa.juridica : TipoPessoa.fisica;
    }

    if (Brasil.validarCNPJ(value)) {
      return TipoPessoa.juridica;
    }

    if (Brasil.validarCPF(value)) {
      return TipoPessoa.fisica;
    }

    if (value is num) {
      switch (value.round()) {
        case 0:
          return TipoPessoa.fisica;
        case 1:
          return TipoPessoa.juridica;
        default:
          return TipoPessoa.outros;
      }
    }

    switch (flatString(value)) {
      case 'fisica':
      case 'cpf':
        return TipoPessoa.fisica;
      case 'juridica':
      case 'cnpj':
        return TipoPessoa.juridica;
      default:
        return TipoPessoa.outros;
    }
  }

  @override
  String toString() {
    switch (this) {
      case TipoPessoa.fisica:
        return 'Física';
      case TipoPessoa.juridica:
        return 'Jurídica';
      default:
        return 'Tipo de pessoa desconhecido';
    }
  }
}

/// Enumeração que representa os tipos de produtos.
enum TipoProduto {
  /// 00 - Revenda
  revenda(0),

  /// 01 - Matéria-Prima
  materiaPrima(1),

  /// 02 - Embalagem
  embalagem(2),

  /// 03 - Produto em Processo
  produtoEmProcesso(3),

  /// 04 - Produto Acabado
  produtoAcabado(4),

  /// 05 - Subproduto
  subproduto(5),

  /// 06 - Produto Intermediário
  produtoIntermediario(6),

  /// 07 - Material de Uso e Consumo
  materialUsoConsumo(7),

  /// 08 - Ativo Imobilizado
  ativoImobilizado(8),

  /// 09 - Serviços
  servicos(9),

  /// 10 - Outros Insumos
  outrosInsumos(10),

  /// 99 - Outras
  outras(99);

  final int value;

  /// Construtor constante que associa um valor inteiro a cada tipo de produto.
  const TipoProduto(this.value);

  /// Método factory para construir os valores a partir de um inteiro.
  factory TipoProduto.fromInt(int value) {
    switch (value) {
      case 0:
        return TipoProduto.revenda;
      case 1:
        return TipoProduto.materiaPrima;
      case 2:
        return TipoProduto.embalagem;
      case 3:
        return TipoProduto.produtoEmProcesso;
      case 4:
        return TipoProduto.produtoAcabado;
      case 5:
        return TipoProduto.subproduto;
      case 6:
        return TipoProduto.produtoIntermediario;
      case 7:
        return TipoProduto.materialUsoConsumo;
      case 8:
        return TipoProduto.ativoImobilizado;
      case 9:
        return TipoProduto.servicos;
      case 10:
        return TipoProduto.outrosInsumos;
      case 99:
        return TipoProduto.outras;
      default:
        throw ArgumentError('Tipo de produto desconhecido: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TipoProduto.revenda:
        return 'Revenda';
      case TipoProduto.materiaPrima:
        return 'Matéria-Prima';
      case TipoProduto.embalagem:
        return 'Embalagem';
      case TipoProduto.produtoEmProcesso:
        return 'Produto em Processo';
      case TipoProduto.produtoAcabado:
        return 'Produto Acabado';
      case TipoProduto.subproduto:
        return 'Subproduto';
      case TipoProduto.produtoIntermediario:
        return 'Produto Intermediário';
      case TipoProduto.materialUsoConsumo:
        return 'Material de Uso e Consumo';
      case TipoProduto.ativoImobilizado:
        return 'Ativo Imobilizado';
      case TipoProduto.servicos:
        return 'Serviços';
      case TipoProduto.outrosInsumos:
        return 'Outros Insumos';
      case TipoProduto.outras:
        return 'Outras';
      default:
        return 'Tipo de produto desconhecido';
    }
  }
}
