// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';

import 'package:innerlibs/innerlibs.dart';
import 'package:xml/xml.dart';
import 'package:xml_crypto/xml_crypto.dart';

/// Classe de exceção para representar uma Nota Fiscal Eletrônica (NFe) inválida.
class InvalidNFeException implements Exception {
  final Iterable<String> erros;

  /// Cria uma nova instância de [InvalidNFeException] com a lista de erros fornecida.
  InvalidNFeException(this.erros);

  @override
  String toString() => "NFe encontrou erros durante a validação:$breakLine${erros.map((e) => " - $e").join(breakLine)}";
}

/// Classe que representa um objeto NFeProc.
///
/// Esta classe é responsável por manipular e processar um documento XML
/// contendo informações de uma Nota Fiscal Eletrônica (NFe).
class NFeProc extends TagXml {
  NFeProc() : super.fromTagName("nfeProc");

  /// Cria uma instância de [NFeProc] incluindo uma instância de [NFe].
  factory NFeProc.comNota(NFe nfe) => NFeProc()..nfe = nfe;

  /// Cria uma instância de [NFeProc] a partir de uma string XML.
  ///
  /// O parâmetro [xml] é a representação em string XML do NFeProc.
  /// Ele é analisado em um [XmlDocument] e usado para inicializar a instância de [NFeProc].
  ///
  /// Exemplo de uso:
  /// ```dart
  /// String xml = '<nfeProc>...</nfeProc>';
  /// NFeProc nfeProc = NFeProc.xmlString(xml);
  /// ```
  factory NFeProc.fromXmlString(String xml) => TagXml.fromXmlString(xml, () => NFeProc())!;

  /// Obtém ou define a instância da classe da Nota Fiscal Eletrônica contida no documento XML.
  NFe? get nfe => getTagAs('NFe', () => NFe());
  set nfe(NFe? value) => setTagFrom('NFe', value);

  /// Obtém a versão da NFe.
  string? get versao => nfe?.infNFe?.versao;
  set versao(String? value) {
    nfe ??= NFe();
    nfe?.infNFe ??= InfNFe();
    nfe!.infNFe?.versao = value;
  }

  /// Obtém o ID da NFe.
  ChaveNFe? get id => nfe?.infNFe?.chave;
  set id(ChaveNFe? value) {
    nfe ??= NFe();
    nfe?.infNFe ??= InfNFe();
    nfe!.infNFe!.chave = value;
  }

  /// Obtém ou define a instância da classe ProtNFe contida no documento XML.
  ProtNFe? get protNFe => getTagAs('protNFe', () => ProtNFe());
  set protNFe(ProtNFe? value) => setTagFrom('protNFe', value);

  /// Salva o documento XML em um diretório específico.
  File salvar(Directory diretorio, [string nomeArquivo = ""]) {
    String fileName = nomeArquivo | nomeArquivoDistribuicao;
    diretorio.createSync(recursive: true);
    File file = File('${diretorio.path}/$fileName');
    file.writeAsString(toString());
    return file;
  }

  /// Obtém o nome do arquivo de distribuição da NFe.
  string get nomeArquivoDistribuicao {
    switch (protNFe?.infProt?.cStat.value ?? 0) {
      case 110: //Uso Denegado
      case 205: //NF-e está denegada na base de dados da SEFAZ [nRec:999999999999999]
      case 301: //Uso Denegado: Irregularidade fiscal do emitente
      case 302: //Uso Denegado: Irregularidade fiscal do destinatário
      case 303: //Uso Denegado: Destinatário não habilitado a operar na UF
        return "${protNFe?.infProt?.chNFe ?? nfe?.infNFe?.chave ?? "sem-chave"}-den.xml";

      case 100: //Autorizado o uso da NF-e
      case 150: //Autorizado o uso da NF-e, autorização fora de prazo
      default:
        return "${protNFe?.infProt?.chNFe ?? nfe?.infNFe?.chave ?? "sem-chave"}-procnfe.xml";
    }
  }

  /// Obtém ou define os pagamentos da NFe.
  Map<FormaPagamento?, List<Pagamento>> get pagamentos => nfe?.pagamentos ?? {};
  set pagamentos(Map<FormaPagamento?, List<Pagamento>> value) {
    nfe ?? NFe();
    nfe!.pagamentos = value;
  }

  List<Pagamento> get listaPagamentos => nfe?.infNFe?.pag?.listaPagamentos ?? [];
  set listaPagamentos(List<Pagamento> value) {
    nfe ?? NFe();
    nfe!.infNFe ??= InfNFe();
    nfe!.infNFe!.pag ??= Pag();
    nfe!.infNFe!.pag!.listaPagamentos = value;
  }

  /// Obtém ou define a instância da classe InfRespTec contida no documento XML.
  InfRespTec? get infRespTec => getTagAs('infRespTec', () => InfRespTec());
  set infRespTec(InfRespTec? value) => setTagFrom('infRespTec', value);

  ChaveNFe? get chave => nfe?.infNFe?.chave;
  set chave(ChaveNFe? value) {
    nfe ??= NFe();
    nfe!.infNFe ??= InfNFe();
    nfe!.infNFe!.chave = value;
  }

  /// Obtém a URI para consulta da NFCe.
  Uri? get uriNFCe {
    var c = id;
    if (c != null) {
      return gerarUriNFCe(
        chNFe: c.chave,
        nVersao: versao ?? "",
        tpAmb: (nfe?.infNFe?.ide?.tpAmb ?? TipoAmbiente.homologacao).value.toString(),
        dhEmi: nfe?.infNFe?.ide?.dhEmi,
        vNF: nfe?.infNFe?.total?.icmsTot?.vNF,
        vICMS: nfe?.infNFe?.total?.icmsTot?.vICMS,
        digVal: protNFe?.infProt?.digVal,
        cIdToken: "", //TODO como fazer o cIdToken e cHashQRCode?
        cHashQRCode: "",
      );
    }
    return null;
  }

  /// Gera a URI para consulta da NFCe.
  static Uri gerarUriNFCe({
    required String? chNFe,
    required String? nVersao,
    required String? tpAmb,
    required date? dhEmi,
    required double? vNF,
    required double? vICMS,
    required String? digVal,
    required String? cIdToken,
    required String? cHashQRCode,
  }) {
    return Uri.http(
      'www.homologacao.nfce.fazenda.sp.gov.br',
      '/NFCeConsultaPublica/Paginas/ConsultaQRCode.aspx',
      {
        if (chNFe != null) 'chNFe': chNFe,
        if (nVersao != null) 'nVersao': nVersao,
        if (tpAmb != null) 'tpAmb': tpAmb,
        if (dhEmi != null) 'dhEmi': Brasil.formatarDataXML(dhEmi),
        if (vNF != null) 'vNF': vNF.toStringAsFixed(2),
        if (vICMS != null) 'vICMS': vICMS.toStringAsFixed(2),
        if (digVal != null) 'digVal': digVal,
        if (cIdToken != null) 'cIdToken': cIdToken,
        if (cHashQRCode != null) 'cHashQRCode': cHashQRCode,
      },
    );
  }

  @override
  Iterable<string> validate() {
    return [
      if (nfe == null) "$deepArrow Tag NFe não informada" else ...nfe!.validate(),
      if (protNFe == null) "$deepArrow Tag protNFe não informada" else ...protNFe!.validate(),
    ];
  }
}

/// Classe que representa um objeto NFe
class NFe extends TagXml implements Validator {
  NFe() : super.fromTagName("NFe") {
    setAttribute("xmlns", "http://www.portalfiscal.inf.br/nfe");
  }

  void assinar(Uint8List bytesCertificado, String senha) {
    //TODO: assinar o xml
    final sig = SignedXml();
    sig.addReference("//*[local-name()='book']");
    sig.signingKey = bytesCertificado;
    sig.computeSignature(toString());
  }

  /// Obtém ou define o regime tributário da nota fiscal.
  RegimeTributario? get regimeTributario => infNFe?.emit?.crt;
  set regimeTributario(RegimeTributario? value) {
    infNFe ??= InfNFe();
    infNFe!.emit ??= Emit();
    infNFe!.emit!.crt = value;
  }

  /// Salva o conteúdo da NFe em um arquivo.
  ///
  /// Cria um arquivo com o nome especificado e escreve o conteúdo da NFe nele.
  /// Se o diretório pai do arquivo não existir, ele será criado de forma recursiva.
  ///
  /// Retorna o arquivo criado.
  File salvar(String caminho) {
    File file = File(caminho);
    file.parent.createSync(recursive: true);
    file.writeAsString(toString());
    return file;
  }

  /// Cria uma instância de NFe a partir de uma string XML.
  ///
  /// Analisa a string XML fornecida e cria uma instância de NFe com base nos elementos e atributos encontrados.
  /// Se a string conter mais de uma NFe, apenas a primeira será considerada.
  /// Retorna a instância de NFe criada.
  factory NFe.fromXmlString(String xml) => TagXml.fromXmlString(xml, () => NFe())!;

  /// Cria uma lista de instâncias de NFe a partir de uma string XML.
  static List<NFe> fromXmlStringList(String xml) => TagXml.fromXmlStringList(xml, () => NFe());

  /// Cria uma instância de NFe a partir de um arquivo XML.
  /// O arquivo é lido e seu conteúdo é analisado para criar a instância de NFe.
  factory NFe.fromXmlFile(File file) {
    if (file.existsSync() && file.lengthSync() > 0) {
      return NFe.fromXmlString(file.readAsStringSync());
    }
    throw Exception("Arquivo não encontrado ou vazio");
  }

  /// Calcula os valores totais da Nota Fiscal Eletrônica (NF-e).
  ///
  /// Esta função calcula os valores totais da NF-e, incluindo o valor total dos produtos,
  /// descontos, outros valores, tributos, base de cálculo do ICMS e valor do ICMS.
  ///
  /// Exemplo de uso:
  ///
  /// ```dart
  /// void main() {
  ///   NFe nfe = NFe();
  ///   nfe.calcular();
  /// }
  /// ```
  void computar() {
    infNFe ??= InfNFe();
    infNFe!.total ??= Total();
    infNFe!.total!.icmsTot ??= ICMSTot();
    infNFe!.chave; // Garante que a chave seja definida
    infNFe!.versao ??= "4.00";

    infNFe!.dest ??= Dest();
    infNFe!.dest!.computar();

    for (var x in infNFe!.det) {
      x.computar();
      x.imposto?.pis?.computar();
      x.imposto?.cofins?.computar();
    }

    for (var x in infNFe!.detPag) {
      if (x.tPag == FormaPagamento.semPagamento) {
        x.vPag = 0;
      } else {
        x.vPag = x.vPag.forcePositive;
      }
    }

    infNFe!.total!.icmsTot!.vNF = infNFe!.det.sum((x) => x.prod?.vProd ?? 0);
    infNFe!.total!.icmsTot!.vDesc = infNFe!.det.sum((x) => x.prod?.vDesc ?? 0);
    infNFe!.total!.icmsTot!.vOutro = infNFe!.det.sum((x) => x.prod?.vOutro ?? 0);
    infNFe!.total!.icmsTot!.vFrete = infNFe!.det.sum((x) => x.prod?.vFrete ?? 0);
    infNFe!.total!.icmsTot!.vSeg = infNFe!.det.sum((x) => x.prod?.vSeg ?? 0);
    infNFe!.total!.icmsTot!.vTotTrib = infNFe!.det.sum((x) => x.imposto?.vTotTrib ?? 0);
    infNFe!.total!.icmsTot!.vBC = infNFe!.det.sum((x) => x.imposto?.icms?.tag?.vBC ?? 0);
    infNFe!.total!.icmsTot!.vICMS = infNFe!.det.sum((x) => x.imposto?.icms?.tag?.vICMS ?? 0);

    /// ajusta o indTot dos produtos
    for (Det x in infNFe!.det) {
      x.prod!.indTot = totalNota == x.prod!.vProd;
    }
  }

  double get totalNota => infNFe?.total?.icmsTot?.vNF ?? 0;
  set totalNota(double value) {
    infNFe ??= InfNFe();
    infNFe!.total ??= Total();
    infNFe!.total!.icmsTot ??= ICMSTot();
    infNFe!.total!.icmsTot!.vNF = value;
  }

  /// Obtém o valor total pago da Nota Fiscal Eletrônica (NF-e).
  double get totalPago => infNFe?.detPag.sum((x) => x.vPag) ?? 0;

  /// Obtém o valor do troco da Nota Fiscal Eletrônica (NF-e).
  double get totalTroco => infNFe?.detPag.sum((x) => x.vTroco) ?? 0;

  /// Obtém o valor total de desconto da Nota Fiscal Eletrônica (NF-e).
  double get totalDesconto => infNFe?.total?.icmsTot?.vDesc ?? 0;

  /// Obtém o valor total do seguro da Nota Fiscal Eletrônica (NF-e).
  double get totalSeguro => infNFe?.total?.icmsTot?.vSeg ?? 0;

  /// Obtém o valor total de outras despesas da Nota Fiscal Eletrônica (NF-e).
  double get totalOutrasDespesas => infNFe?.total?.icmsTot?.vOutro ?? 0;

  /// Obtém o valor total de frete da Nota Fiscal Eletrônica (NF-e).
  double get totalFrete => infNFe?.total?.icmsTot?.vFrete ?? 0;

  /// Verifica se a Nota Fiscal Eletrônica (NF-e) é válida.
  bool get notaValida => validate().isEmpty;

  /// Calcula e valida a Nota Fiscal Eletrônica (NF-e).
  /// Retorna `true` se a NF-e for válida, caso contrário, retorna `false`.
  /// Se o parâmetro [throwException] for `true`, uma exceção [InvalidNFeException] será lançada se a NF-e for inválida.
  bool computarEValidar([bool throwException = false]) {
    computar();
    if (throwException) {
      validateOrThrow((errors) => InvalidNFeException(errors));
    }
    return notaValida;
  }

  /// Obtém a instância da classe InfNFe contida no documento XML.
  InfNFe? get infNFe => getTagAs('infNFe', () => InfNFe());
  set infNFe(InfNFe? value) => setTagFrom('infNFe', value);

  Map<FormaPagamento?, List<Pagamento>> get pagamentos => infNFe?.pag?.pagamentos ?? {};
  set pagamentos(Map<FormaPagamento?, List<Pagamento>> value) {
    infNFe ??= InfNFe();
    infNFe!.pag ??= Pag();
    infNFe!.pag!.pagamentos = value;
  }

  /// Obtém a chave NFe desta nota fiscal, se existir.
  ChaveNFe? get chave => infNFe?.chave;
  set chave(ChaveNFe? value) {
    infNFe ??= InfNFe();
    infNFe!.chave = value;
  }

  /// Adiciona um item a NFe.
  Det addDet(Det det) {
    infNFe ??= InfNFe();
    infNFe!.addDet(det);
    return det;
  }

  /// Adiciona um pagamento a NFe.
  DetPag? addPagamento(FormaPagamento tPag, double vPag) => addDetPag(DetPag.from(tPag, vPag));

  /// Adiciona um DetPag a NFe.
  DetPag addDetPag(DetPag detPag) {
    infNFe ??= InfNFe();
    infNFe!.pag ??= Pag();
    infNFe!.pag!.addDetPag(detPag);
    return detPag;
  }

  @override
  Iterable<string> validate() {
    return [
      if (infNFe == null) "Tag infNfe não informada" else ...infNFe!.validate(),
    ];
  }
}

/// Classe que representa um objeto infNFe.
///
/// Esta classe é responsável por manipular e processar as informações
/// de uma Nota Fiscal Eletrônica (NFe).
class InfNFe extends TagXml {
  InfNFe() : super.fromTagName("infNFe") {
    versao = "4.00";
  }

  @override
  Iterable<string> validate() {
    return [
      if (chave == null) "Chave da NFe não informada" else if (ChaveNFe.validar(chave)) "Chave da NFe inválida",
      if (versao != "4.00") "Versão inválida (deve ser 4.00)",
      if (ide == null) "Tag ide não informada" else ...ide!.validate(),
      if (emit == null) "Tag emit não informada" else ...emit!.validate(),
      if (dest == null) "Tag dest não informada" else ...dest!.validate(),
      if (total == null) "Tag total não informada" else ...total!.validate(),
      if (infAdic == null) "Tag infAdic não informada" else ...infAdic!.validate(),
      if (det.isEmpty) "Nenhum det informado" else ...det.map((x) => x.validate()).expand((x) => x),
    ];
  }

  @override
  String toString() {
    chave; // Garante que o ID seja definido
    return super.toString();
  }

  /// Obtém a instância da classe InfAdic contida no documento XML.
  InfAdic? get infAdic => getTagAs('infAdic', () => InfAdic());
  set infAdic(InfAdic? value) => setTagFrom('infAdic', value);

  /// Obtém ou define a chave da NFe.
  /// Alterando a chave NFe diretamente, as seguintes tags do XML também são alteradas:
  /// - ide.cUF
  /// - emit.CNPJ
  /// - ide.dhEmi (somente mes e ano são alterados. Se o valor anterior for NULL, é considerado o primeiro dia do Mês especificado)
  /// - ide.mod
  /// - ide.serie
  /// - ide.nNF
  /// - ide.tpEmis
  /// - ide.cNF
  ChaveNFe? get chave {
    try {
      var c = ChaveNFe.fromComponents(
        uf: ide?.cUF ?? Estado.naoDefinido,
        cnpj: emit?.cnpj,
        ano: ide?.dhEmi?.year ?? 0,
        mes: ide?.dhEmi?.month ?? 0,
        modelo: ide?.mod ?? ModeloDFe.nfe,
        serie: ide?.serie ?? 0,
        nota: ide?.nNF ?? 0,
        tipoEmissao: ide?.tpEmis ?? TipoEmissao.normal,
        codigo: ide?.cNF ?? 0,
      );
      setAttribute('Id', 'NFe${c.toString()}');
      return c;
    } catch (_) {}
    return null;
  }

  set chave(ChaveNFe? value) {
    if (value != null) {
      ide ??= Ide();
      ide!.cUF = value.uf;
      emit ??= Emit();
      emit!.cnpj = value.cnpj;
      ide!.dhEmi = DateTime(value.ano, value.mes, ide!.dhEmi?.day ?? 1);
      ide!.mod = value.modelo;
      ide!.serie = value.serie;
      ide!.nNF = value.nota;
      ide!.tpEmis = value.tipoEmissao;
      ide!.cNF = value.codigo;
      setAttribute('Id', 'NFe${value.toString()}');
    }
  }

  /// Obtém ou define a versão da NFe.
  string? get versao => getAttribute('versao');
  set versao(String? value) => setAttribute('versao', value?.toString());

  /// Obtém o valor total da NFe.
  double get valorTotal => total?.icmsTot?.vNF ?? 0;
  set valorTotal(double value) {
    total ??= Total();
    total!.icmsTot ??= ICMSTot();
    total!.icmsTot!.vNF = value;
  }

  /// Obtém o valor do desconto da NFe.
  double get desconto => total?.icmsTot?.vDesc ?? 0;
  set desconto(double value) {
    total ??= Total();
    total!.icmsTot ??= ICMSTot();
    total!.icmsTot!.vDesc = value;
  }

  /// Obtém o valor total pago da NFe.
  double get totalPago => detPag.sum((x) => x.vPag);

  /// Obtém a quantidade de itens da NFe.
  double get quantidadeItens => det.sum((x) => x.prod?.qCom ?? 0);

  /// Obtém ou define a instância da classe Ide contida no documento XML.
  Ide? get ide => getTagAs('ide', () => Ide());
  set ide(Ide? value) => setTagFrom('ide', value);

  /// Obtém ou define a instância da classe Emit contida no documento XML.
  Emit? get emit => getTagAs('emit', () => Emit());
  set emit(Emit? value) => setTagFrom('emit', value);

  /// Obtém a instância da classe Dest contida no documento XML.
  Dest? get dest => getTagAs('dest', () => Dest());

  /// Define a instância da classe Dest no documento XML.
  set dest(Dest? value) => setTagFrom('dest', value);

  /// Obtém uma lista de instâncias da classe Det contidas no documento XML.
  Iterable<Det> get det => getTagsFrom('det', () => Det());

  /// Obtém uma lista de instâncias da classe DetPag contidas no documento XML dentro da tag Pag.
  Iterable<DetPag> get detPag => pag?.detPag ?? [];
  set detPag(Iterable<DetPag> value) {
    pag ??= Pag();
    pag!.detPag = value;
  }

  /// Obtém a instância da classe Total contida no documento XML.
  Total? get total => getTagAs('total', () => Total());
  set total(Total? value) => setTagFrom('total', value);

  /// Obtém a instância da classe Transp contida no documento XML.
  Transp? get transp => getTagAs("transp", () => Transp());
  set transp(Transp? value) => setTagFrom("transp", value);

  /// Obtém a instância da classe Cobr contida no documento XML.
  Cobr? get cobr => getTagAs("cobr", () => Cobr());
  set cobr(Cobr? value) => setTagFrom("cobr", value);

  /// Obtém a instância da classe Pag contida no documento XML.
  Pag? get pag => getTagAs("pag", () => Pag());
  set pag(Pag? value) => setTagFrom("pag", value);

  /// Adiciona um item ao documento XML.
  Det? addDet(Det det) {
    children.add(det);
    return det;
  }
}

/// Classe que representa um objeto Ide.
///
/// Esta classe é responsável por manipular e processar as informações
/// do campo "ide" de uma Nota Fiscal Eletrônica (NFe).
class Ide extends TagXml {
  Ide() : super.fromTagName("ide");

  @override
  Iterable<string> validate() {
    return [
      if (cUF == null) "cUF não informada",
      if (cNF == null) "cNF não informada",
      if (natOp == null) "natOp não informada" else if (natOp?.length.isBetweenOrEqual(1, 60) == false) "natOp deve ter entre 1 e 60 caracteres",
      if (mod == null) "mod não informada",
      if (serie == null) "serie não informada",
      if (nNF == null) "nNF não informada",
      if (dhEmi == null) "dhEmi não informada",
      if (tpNF == null) "tpNF não informada",
      if (idDest == null) "idDest não informada",
      if (cMunFG == null) "cMunFG não informada",
      if (tpImp == null) "tpImp não informada",
      if (tpEmis == null) "tpEmis não informada",
      if (cDV == null) "cDV não informada",
      if (tpAmb == null) "tpAmb não informada",
      if (finNFe == null) "finNFe não informada",
      if (indFinal == null) "indFinal não informada",
      if (indPres == null) "indPres não informada",
      if (procEmi == null) "procEmi não informada",
      if (verProc == null) "verProc não informada" else if (verProc?.length.isBetweenOrEqual(1, 20) == false) "verProc deve ter entre 1 e 20 caracteres",
      if (tpEmis?.isContingencia ?? false) ...[
        if (dhCont == null) "dhCont não informada",
        if (xJust == null) "xJust não informada" else if (xJust?.length.isBetweenOrEqual(15, 255) == false) "xJust deve ter entre 15 e 255 caracteres",
      ],
    ];
  }

  /// Dígito Verificador.
  int? get cDV => getValueFromNode('cDV');
  set cDV(int? value) => setTextValueForNode('cDV', value?.toString());

  /// Código do Município de Ocorrência do Fato Gerador.
  int? get cMunFG => getValueFromNode('cMunFG');
  set cMunFG(int? value) => setTextValueForNode('cMunFG', value.fixedLength(7));

  /// Código Numérico que compõe a Chave de Acesso.
  int? get cNF => getValueFromNode('cNF');
  set cNF(int? value) => setTextValueForNode('cNF', value?.fixedLength(8));

  /// UF do Emitente do Documento Fiscal.
  Estado? get cUF => getValueFromNode('cUF', Estado.fromUForIbge);
  set cUF(Estado? value) => setTextValueForNode('cUF', value?.ibge.toString());

  /// Data e Hora de Emissão do Documento Fiscal.
  date? get dhEmi => getValueFromNode<string, string>('dhEmi').nullIfBlank?.toDate();
  set dhEmi(date? value) => setTextValueForNode('dhEmi', Brasil.formatarDataXML(value));

  /// Date e Hora de entrada em contingência.
  date? get dhCont => getValueFromNode<string, string>('dhCont').nullIfBlank?.toDate();
  set dhCont(date? value) => setTextValueForNode('dhCont', Brasil.formatarDataXML(value));

  /// Justificativa de entrada em contingência.
  string? get xJust => getValueFromNode('xJust');
  set xJust(String? value) => setTextValueForNode('xJust', value);

  /// Data e Hora de Saída ou de Entrada da Mercadoria/Produto.
  date? get dhSaiEnt => getValueFromNode<string, string>('dhSaiEnt').nullIfBlank?.toDate();
  set dhSaiEnt(date? value) => setTextValueForNode('dhSaiEnt', Brasil.formatarDataXML(value));

  /// Finalidade de emissão da NFe.
  FinalidadeNFe? get finNFe => getValueFromNode('finNFe', FinalidadeNFe.fromInt);
  set finNFe(FinalidadeNFe? value) => setTextValueForNode('finNFe', value?.toString());

  /// Identificador de Destino da Operação.
  IdentificadorDestinoOperacaoNFe? get idDest => getValueFromNode('idDest', IdentificadorDestinoOperacaoNFe.fromInt);
  set idDest(IdentificadorDestinoOperacaoNFe? value) => setTextValueForNode('idDest', value?.toString());

  /// Indica se a Operação é Final ou Não.
  bool? get indFinal => getValueFromNode<string, string>('indFinal')?.asNullableBool();
  set indFinal(bool? value) => setTextValueForNode('indFinal', value == null ? null : (value ? "1" : "0"));

  /// Indicador de Intermediação
  IndicadorIntermediacaoNFe? get indIntermed => getValueFromNode('indIntermed', IndicadorIntermediacaoNFe.fromInt);
  set indIntermed(IndicadorIntermediacaoNFe? value) => setTextValueForNode('indIntermed', value?.toString());

  /// Indicador de Presença do Comprador no Estabelecimento Comercial no Momento da Operação.
  IndicadorPresencaNFe? get indPres => getValueFromNode('indPres');
  set indPres(IndicadorPresencaNFe? value) => setTextValueForNode('indPres', value?.toString());

  /// Modelo do Documento Fiscal.
  ModeloDFe? get mod => getValueFromNode('mod', ModeloDFe.fromInt);
  set mod(ModeloDFe? value) => setTextValueForNode('mod', value?.value.toString());

  /// Número da Nota Fiscal.
  int? get nNF => getValueFromNode('nNF');
  set nNF(int? value) => setTextValueForNode('nNF', value?.toString().last(9));

  /// Natureza da Operação.
  String? get natOp => getValueFromNode('natOp');
  set natOp(String? value) => setTextValueForNode('natOp', value);

  /// Processo de Emissão da NFe.
  ProcessoEmissaoNFe? get procEmi => ProcessoEmissaoNFe.fromInt(getValueFromNode('procEmi'));
  set procEmi(ProcessoEmissaoNFe? value) => setTextValueForNode('procEmi', value?.value.toString());

  /// Série do Documento Fiscal.
  int? get serie => getValueFromNode('serie');
  set serie(int? value) => setTextValueForNode('serie', value?.toString().last(3));

  /// Tipo de Ambiente.
  TipoAmbiente? get tpAmb => getValueFromNode('tpAmb');
  set tpAmb(TipoAmbiente? value) => setTextValueForNode('tpAmb', value?.toString());

  /// Forma de Emissão da NFe.
  TipoEmissao? get tpEmis => getValueFromNode('tpEmis', TipoEmissao.fromInt);
  set tpEmis(TipoEmissao? value) => setTextValueForNode('tpEmis', value?.value.toString());

  /// Tipo de Impressão da NFe.
  TipoImpressao? get tpImp => getValueFromNode('tpImp', TipoImpressao.fromInt);
  set tpImp(TipoImpressao? value) => setTextValueForNode('tpImp', value?.value.toString());

  /// Tipo da Nota Fiscal.
  TipoOperacao? get tpNF => getValueFromNode('tpNF', TipoOperacao.fromInt);
  set tpNF(TipoOperacao? value) => setTextValueForNode('tpNF', value?.value.toString());

  /// Versão do Processo de Emissão da NFe.
  String? get verProc => getValueFromNode('verProc');
  set verProc(String? value) => setTextValueForNode('verProc', value);
}

/// Classe que representa um objeto Emit.
///
/// Esta classe é responsável por manipular e processar as informações
/// do campo "emit" de uma Nota Fiscal Eletrônica (NFe).
class Emit extends TagXml {
  Emit() : super.fromTagName("emit");

  @override
  Iterable<string> validate() {
    return [
      if (cnpj == null) "$deepArrow CNPJ do emitente não informado" else if (Brasil.validarCNPJ(cnpj!) == false) "$deepArrow CNPJ do emitente inválido",
      if (xNome == null) "$deepArrow Razão Social do emitente não informada" else if (xNome?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow Razão Social do emitente deve ter entre 2 e 60 caracteres",
      if (xFant == null) "$deepArrow Nome Fantasia do emitente não informado" else if (xFant?.length.isBetweenOrEqual(1, 60) == false) "$deepArrow Nome Fantasia do emitente deve ter entre 1 e 60 caracteres",
      if (enderEmit == null) "$deepArrow Endereço do emitente não informado" else ...enderEmit!.validate(),
      if (crt == null) "$deepArrow CRT do emitente não informado",
      if (ie != null) enderEmit == null || enderEmit!.uf == null ? "$deepArrow IE informada mas UF não informada (EnderEmit)" : (enderEmit!.uf!.validarInscricaoEstadual(ie) ? null : "$deepArrow Inscrição estadual inválida para o estado ${enderEmit!.uf}"),
    ].whereNotNull();
  }

  /// Obtém a instância da classe EnderEmit contida no documento XML.
  EnderEmit? get enderEmit => getTagAs("enderEmit", () => EnderEmit());
  set enderEmit(EnderEmit? value) => setTagFrom("enderEmit", value);

  /// CNPJ do emitente.
  int? get cnpj => getValueFromNode('CNPJ');
  set cnpj(int? value) => setTextValueForNode('CNPJ', value.fixedLength(ChaveNFe.tamanhoCNPJ));

  /// Obtém ou define o nome do emitente.
  string? get xNome => getValueFromNode('xNome');
  set xNome(String? value) => setTextValueForNode('xNome', value?.asFlat.toUpperCase());

  /// Obtém ou define o nome fantasia do emitente.
  string? get xFant => getValueFromNode('xFant');
  set xFant(String? value) => setTextValueForNode('xFant', value?.asFlat.toUpperCase());

  /// Obtém ou define o valor da Inscrição Estadual (IE).
  string? get ie => getValueFromNode('IE');
  set ie(string? value) => setTextValueForNode('IE', value?.toString());

  /// Obtém ou define o valor da Inscrição Municipal (IM).
  string? get im => getValueFromNode('IM');
  set im(string? value) => setTextValueForNode('IM', value?.toString());

  int? get cnae => getValueFromNode('CNAE');
  set cnae(int? value) => setTextValueForNode('CNAE', value?.toString());

  /// Obtém ou define o CRT (Código de Regime Tributário) da NFe.
  ///
  /// O CRT é um valor numérico que representa o regime tributário do contribuinte.
  RegimeTributario? get crt => getValueFromNode('CRT', RegimeTributario.fromInt);
  set crt(RegimeTributario? value) => setTextValueForNode('CRT', value?.value.toString());
}

class EnderEmit extends Ender {
  EnderEmit([Endereco? endereco, Telefone? telefone]) : super("enderEmit", endereco: endereco, telefone: telefone);
}

class EnderDest extends Ender {
  EnderDest([Endereco? endereco, Telefone? telefone]) : super("enderDest", endereco: endereco, telefone: telefone);
}

/// Classe que representa um objeto Endereço.
///
/// Esta classe é responsável por manipular e processar as informações
/// do campo "ender" de uma Nota Fiscal Eletrônica (NFe).
class Ender extends TagXml {
  Ender(super.tagName, {Endereco? endereco, Telefone? telefone}) : super.fromTagName() {
    xLgr = endereco?.logradouro;
    nro = endereco?.numero;
    xBairro = endereco?.bairro;
    cMun = endereco?.ibge;
    xMun = endereco?.cidade?.nome;
    uf = endereco?.estado;
    cep = endereco?.cep.onlyNumbers.toInt;
    cPais = endereco?.codigoPais;
    xPais = endereco?.pais;
    fone = telefone?.completo;
  }

  @override
  Iterable<string> validate() {
    return [
      if (xLgr == null) "$deepArrow Logradouro não informado" else if (xLgr?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow Logradouro deve ter entre 2 e 60 caracteres",
      if (nro == null) "$deepArrow Número não informado" else if (nro?.length.isBetweenOrEqual(1, 60) == false) "$deepArrow Número deve ter entre 1 e 60 caracteres",
      if (xBairro == null) "$deepArrow Bairro não informado" else if (xBairro?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow Bairro deve ter entre 2 e 60 caracteres",
      if (cMun == null) "$deepArrow Código do município não informado",
      if (xMun == null) "$deepArrow Município não informado" else if (xMun?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow Município deve ter entre 2 e 60 caracteres",
      if (uf == null || uf == Estado.naoDefinido) "$deepArrow UF não informada",
      if (cep == null) "$deepArrow CEP não informado" else if (Brasil.validarCEP(cep!) == false) "$deepArrow CEP inválido",
      if (cPais == null) "$deepArrow Código do país não informado",
      if (xPais == null) "$deepArrow País não informado" else if (xPais?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow País deve ter entre 2 e 60 caracteres",
      if (fone == null) "$deepArrow Telefone não informado" else if (Brasil.validarTelefone(fone!) == false) "$deepArrow Telefone inválido",
    ];
  }

  /// Obtem o endereco formatado
  String get enderecoFormatado {
    return [
      [xLgr, nro, xCpl].whereValid.join(", "),
      xBairro,
      xMun,
      uf?.uf.toUpperCase(),
      Brasil.formatarDocumentoComRotulo(documento: cep),
    ].whereValid.join(" - ");
  }

  Future<Cidade?> get cidade async => await Cidade.pegar(cMun);

  /// Obtém ou define o logradouro do endereço.
  string? get xLgr => getValueFromNode('xLgr');
  set xLgr(String? value) => setTextValueForNode('xLgr', value?.asFlat.toUpperCase());

  /// Obtém ou define o número do endereço.
  string? get nro => getValueFromNode('nro');
  set nro(String? value) => setTextValueForNode('nro', value?.asFlat.toUpperCase());

  /// Obtém ou define o complemento do endereço.
  string? get xCpl => getValueFromNode('xCpl');
  set xCpl(String? value) => setTextValueForNode('xCpl', value?.asFlat.toUpperCase());

  /// Obtém ou define o bairro do endereço.
  string? get xBairro => getValueFromNode('xBairro');
  set xBairro(String? value) => setTextValueForNode('xBairro', value?.asFlat.toUpperCase());

  /// Obtém ou define o código do município do endereço.
  int? get cMun => getValueFromNode('cMun');
  set cMun(int? value) => setTextValueForNode('cMun', value.fixedLength(7));

  /// Obtém ou define o nome do município do endereço.
  string? get xMun => getValueFromNode('xMun');
  set xMun(String? value) => setTextValueForNode('xMun', value.asFlat.toUpperCase());

  /// Obtém ou define a sigla do estado do endereço.
  Estado? get uf => getValueFromNode('UF', Estado.fromUForIbge);
  set uf(Estado? value) => setTextValueForNode('UF', value?.uf);

  /// Obtém ou define o CEP do endereço.
  int? get cep => getValueFromNode('CEP');
  set cep(int? value) => setTextValueForNode('CEP', value?.toString());

  /// Obtém ou define o código do país.
  int? get cPais => getValueFromNode('cPais');
  set cPais(int? value) => setTextValueForNode('cPais', value?.fixedLength(4));

  /// Obtém ou define o nome do país.
  string? get xPais => getValueFromNode('xPais');
  set xPais(String? value) => setTextValueForNode('xPais', value?.asFlat.toUpperCase());

  /// Obtém ou define o número de telefone.
  string? get fone => getValueFromNode('fone');
  set fone(String? value) => setTextValueForNode('fone', value?.onlyNumbers.toString());
}

/// Classe que representa o destinatário de uma nota fiscal eletrônica (NFe).
class Dest extends TagXml {
  Dest() : super.fromTagName("dest");

  @override
  Iterable<string> validate() {
    return [
      if (cnpjCpf == null) "$deepArrow CNPJ/CPF do destinatário não informado",
      if (xNome == null) "$deepArrow Nome do destinatário não informado" else if (xNome?.length.isBetweenOrEqual(2, 60) == false) "$deepArrow Nome do destinatário deve ter entre 2 e 60 caracteres",
      if (indIEDest == null) "$deepArrow Indicador de IE do destinatário não informado",
      if (ie == null) "$deepArrow IE do destinatário não informada" else if (ie?.length.isBetweenOrEqual(2, 14) == false) "$deepArrow IE do destinatário deve ter entre 2 e 14 caracteres",
      if (enderDest == null) "$deepArrow Endereço do destinatário não informado" else ...enderDest!.validate(),
      if (ie != null) enderDest == null || (enderDest!.uf == null || enderDest!.uf == Estado.naoDefinido) ? "$deepArrow IE informada mas UF não informada" : (enderDest!.uf!.validarInscricaoEstadual(ie) ? null : "$deepArrow Inscrição estadual inválida para o estado ${enderDest!.uf}"),
    ].whereNotNull();
  }

  void computar() {
    enderDest ??= EnderDest();
    enderDest!.uf = enderDest!.uf ?? Estado.naoDefinido;
    if (enderDest!.uf == Estado.ex) {
      indIEDest = IndicadorIEDestinatario.naoContribuinte;
    }

    if (indIEDest == IndicadorIEDestinatario.contribuinteICMS && ie == null) {
      ie = "ISENTO";
    }

    if (indIEDest == IndicadorIEDestinatario.naoContribuinte) {
      ie = null;
    }
  }

  /// Obtém o endereço do destinatário.
  EnderDest? get enderDest => getTagAs('enderDest', () => EnderDest());
  set enderDest(EnderDest? value) => setTagFrom('enderDest', value);

  string? get cnpjCpf => getValueFromNode('CNPJ') ?? getValueFromNode('CPF');

  set cnpjCpf(String? value) {
    setTextValueForNode("CNPJ", null);
    setTextValueForNode("CPF", null);
    if (Brasil.validarCPFouCNPJ(value)) {
      setTextValueForNode(Brasil.pegarRotuloDocumento(documento: value, rotuloPadrao: "CPF"), value?.onlyNumbers);
    }
  }

  /// Obtém o nome do destinatário.
  String? get xNome => getValueFromNode('xNome');
  set xNome(String? value) => setTextValueForNode('xNome', value?.toString());

  /// Obtém a indicação de IE do destinatário.
  IndicadorIEDestinatario? get indIEDest => IndicadorIEDestinatario.fromInt(getValueFromNode('indIEDest'));
  set indIEDest(IndicadorIEDestinatario? value) => setTextValueForNode('indIEDest', value?.value.toString());

  /// Obtém a inscrição estadual do destinatário.
  String? get ie => getValueFromNode('IE');
  set ie(String? value) => setTextValueForNode('IE', value?.toString());
}

/// Classe que representa os detalhesde um item em um documento XML da Nota Fiscal Eletrônica (NFe).
class Det extends TagXml {
  Det() : super.fromTagName("det") {
    nItem;
  }

  @override
  Iterable<string> validate() {
    return [
      if (prod == null) "$deepArrow Tag prod não informada" else ...prod!.validate(),
      if (imposto == null) "$deepArrow Tag imposto não informada" else ...imposto!.validate(),
    ];
  }

  /// Obtém o valor do atributo 'nItem' da tag <Det>.
  /// O atributo 'nItem' é um número sequencial que identifica o item da NFe.
  int get nItem {
    var dets = parent?.findElements("det").toList() ?? [];
    var n = (dets.indexOf(this) + 1).clampMin(1);
    setAttribute('nItem', n.toString());
    return n;
  }

  @override
  toString() {
    nItem; // Garante que o nItem seja definido
    return super.toString();
  }

  /// Obtém a tag <prod> como um objeto da classe [Prod].
  Prod? get prod => getTagAs('prod', () => Prod());

  /// Define a tag <prod> como um objeto da classe [Prod].
  set prod(Prod? value) => setTagFrom('prod', value);

  /// Obtém a tag <imposto> como um objeto da classe [Imposto].
  Imposto? get imposto => getTagAs('imposto', () => Imposto());

  /// Define a tag <imposto> como um objeto da classe [Imposto].
  set imposto(Imposto? value) => setTagFrom('imposto', value);

  void computar() {
    prod ??= Prod();
    prod!.computar();
    imposto ??= Imposto();
  }
}

class ICMSUFDest extends TagXml {
  ICMSUFDest() : super.fromTagName("ICMSUFDest");

  @override
  Iterable<string> validate() {
    return [
      if (vBCUFDest == null) "$deepArrow Valor da BC do ICMS na UF de destino não informado",
      if (pICMSUFDest == null) "$deepArrow Percentual do ICMS Interestadual para a UF de destino não informado",
      if (pICMSInter == null) "$deepArrow Percentual do ICMS Interestadual para a UF de destino não informado",
      if (pICMSInterPart == null) "$deepArrow Percentual do ICMS Interestadual para a UF de destino não informado",
      if (vICMSUFDest == null) "$deepArrow Valor do ICMS Interestadual para a UF de destino não informado",
      if (vICMSUFRemet == null) "$deepArrow Valor do ICMS Interestadual para a UF de destino não informado",
    ];
  }

  /// Obtém o valor da BC do ICMS na UF de destino.
  double? get vBCUFDest => getValueFromNode('vBCUFDest');
  set vBCUFDest(double? value) => setTextValueForNode('vBCUFDest', value?.toStringAsFixed(2));

  double? get pICMSUFDest => getValueFromNode('pICMSUFDest');
  set pICMSUFDest(double? value) => setTextValueForNode('pICMSUFDest', value?.toStringAsFixed(2));

  double? get pICMSInter => getValueFromNode('pICMSInter');
  set pICMSInter(double? value) => setTextValueForNode('pICMSInter', value?.toStringAsFixed(2));

  double? get pICMSInterPart => getValueFromNode('pICMSInterPart');
  set pICMSInterPart(double? value) => setTextValueForNode('pICMSInterPart', value?.toStringAsFixed(2));

  double? get vICMSUFDest => getValueFromNode('vICMSUFDest');
  set vICMSUFDest(double? value) => setTextValueForNode('vICMSUFDest', value?.toStringAsFixed(2));

  double? get vICMSUFRemet => getValueFromNode('vICMSUFRemet');
  set vICMSUFRemet(double? value) => setTextValueForNode('vICMSUFRemet', value?.toStringAsFixed(2));
}

class IPI extends TagXml {
  IPI() : super.fromTagName("IPI");

  @override
  Iterable<string> validate() {
    return [
      if (cEnq == null) "$deepArrow Código de Enquadramento não informado" else if (cEnq?.length.isBetweenOrEqual(3, 3) == false) "$deepArrow Código de Enquadramento deve ter 3 caracteres",
      if (cSelo == null) "$deepArrow Código do Selo não informado",
      if (cnpjProd == null) "$deepArrow CNPJ do produtor não informado" else if (Brasil.validarCNPJ(cnpjProd!) == false) "$deepArrow CNPJ do produtor inválido",
    ];
  }

  /// Obtém ou define o código de enquadramento do IPI.
  /// O código de enquadramento é um valor numérico que identifica a situação tributária do IPI.
  string? get cEnq => getValueFromNode('cEnq');
  set cEnq(String? value) => setTextValueForNode('cEnq', value?.toString());

  SeloControle? get cSelo => getValueFromNode('cSelo', SeloControle.fromInt);
  set cSelo(SeloControle? value) => setTextValueForNode('cSelo', value?.value.toString());

  /// Obtém ou define o CNPJ do produtor.
  int? get cnpjProd => getValueFromNode('CNPJ');
  set cnpjProd(int? value) => setTextValueForNode('CNPJ', value?.fixedLength(ChaveNFe.tamanhoCNPJ));

  /// Obtém ou define a quantidade de selos.
  int? get qSelo => getValueFromNode('qSelo');
  set qSelo(int? value) => setTextValueForNode('qSelo', value?.toString());

  IPITrib? get ipiTrib => getTagAs('IPITrib', () => IPITrib());
  set ipiTrib(IPITrib? value) => setTagFrom('IPITrib', value);

  IPINT? get ipiNT => getTagAs('IPINT', () => IPINT());
  set ipiNT(IPINT? value) => setTagFrom('IPINT', value);
}

class IPITrib extends TagXml {
  IPITrib() : super.fromTagName("IPITrib");

  /// Obtém o valor do campo cST.
  int? get cst => getValueFromNode('CST');
  set cst(int? value) => setTextValueForNode('CST', value?.toString());

  /// Obtém o valor do campo vBC.
  double? get vBC => getValueFromNode('vBC');
  set vBC(double? value) => setTextValueForNode('vBC', value?.toString());

  /// Obtém o valor do campo pIPI.
  double? get pIPI => getValueFromNode('pIPI');
  set pIPI(double? value) => setTextValueForNode('pIPI', value?.toString());

  /// Obtém o valor do campo vIPI.
  double? get vIPI => getValueFromNode('vIPI');
  set vIPI(double? value) => setTextValueForNode('vIPI', value?.toString());
}

class IPINT extends TagXml {
  IPINT() : super.fromTagName("IPINT");

  /// Obtém o valor do campo CST.
  int? get cst => getValueFromNode('CST');
  set cst(int? value) => setTextValueForNode('CST', value?.toString());
}

/// Classe que representa a tag XML 'prod' do documento fiscal eletrônico (NF-e/NFC-e).
class Prod extends TagXml {
  Prod() : super.fromTagName("prod");

  int? get nItem {
    if (parent == null) {
      return null;
    }
    if (parent is Det) {
      return (parent as Det).nItem;
    } else if (parent is XmlElement) {
      return parent!.getAttribute('nItem')?.toInt;
    }
    return null;
  }

  @override
  Iterable<string> validate() {
    return [
      if (cProd == null) "$deepArrow Código do produto $nItem não informado" else if (cProd?.length.isBetweenOrEqual(1, 60) == false) "$deepArrow Código do produto $nItem deve ter entre 1 e 60 caracteres",
      if (cEAN == null) "$deepArrow Código de barras (EAN) do produto $nItem não informado" else if (cEAN?.isValidEAN == false || cEAN != "SEM GTIN") "$deepArrow Código de barras (EAN) do produto $nItem inválido",
      if (xProd == null) "$deepArrow Descrição do produto $nItem não informada" else if (xProd?.length.isBetweenOrEqual(1, 120) == false) "$deepArrow Descrição do produto $nItem deve ter entre 1 e 120 caracteres",
      if (uCom == null) "$deepArrow Unidade comercial do produto $nItem não informada" else if (uCom?.length.isBetweenOrEqual(1, 6) == false) "$deepArrow Unidade comercial do produto $nItem deve ter entre 1 e 6 caracteres",
      if (qCom == null) "$deepArrow Quantidade comercial do produto $nItem não informada",
      if (vUnCom == null) "$deepArrow Valor unitário comercial do produto $nItem não informado",
      if (vProd == null) "$deepArrow Valor total do produto $nItem não informado",
      if (cEANTrib == null) "$deepArrow Código de barras tributado do produto $nItem não informado" else if (cEANTrib?.isValidEAN == false || cEANTrib != "SEM GTIN") "$deepArrow Código de barras tributado do produto $nItem inválido",
      if (uTrib == null) "$deepArrow Unidade tributável do produto $nItem não informada" else if (uTrib?.length.isBetweenOrEqual(1, 6) == false) "$deepArrow Unidade tributável do produto $nItem deve ter entre 1 e 6 caracteres",
      if (qTrib == null) "$deepArrow Quantidade tributável do produto $nItem não informada",
      if (vUnTrib == null) "$deepArrow Valor unitário tributado do produto $nItem não informado",
      if (indTot == null) "$deepArrow Indicador de totalização do produto $nItem não informado",
    ];
  }

  /// Calcula os valores totais do produto.
  void computar() {
    cEAN ??= "SEM GTIN"; // Garante que o cEAN seja definido
    cEANTrib ??= "SEM GTIN"; // Garante que o cEANTrib seja definido
    qCom ??= 0;
    vUnCom ??= 0;
    vFrete = vFrete.nullIfZero;
    vOutro = vOutro.nullIfZero;
    vDesc = vDesc.nullIfZero;
    vProd = (qCom! * vUnCom!) + (vFrete ?? 0) + (vOutro ?? 0) - (vDesc ?? 0);
  }

  /// Obtém ou define a tag <rastro> do produto
  Iterable<Rastro> get rastro => getTagsFrom('rastro', () => Rastro());
  set rastro(Iterable<Rastro> value) {
    removeChildren('rastro');
    for (var rastro in value) {
      addRastro(rastro);
    }
  }

  /// Adiciona um rastro ao produto.
  Rastro addRastro(Rastro rastro) {
    children.add(rastro);
    return rastro;
  }

  /// Adiciona um rastro ao produto.
  Rastro addRastreamento({int? nLote, double? qLote, DateTime? dFab, DateTime? dVal, String? cAgreg}) {
    var rastro = Rastro(
      nLote: nLote,
      qLote: qLote,
      dFab: dFab,
      dVal: dVal,
      cAgreg: cAgreg,
    );
    return addRastro(rastro);
  }

  /// Obtém ou define o pedido.
  string? get xPed => getValueFromNode('xPed');
  set xPed(String? value) => setTextValueForNode('xPed', value?.removeSpecial);

  /// Obtém ou define o código do produto.
  string? get cProd => getValueFromNode('cProd');
  set cProd(String? value) => setTextValueForNode('cProd', value?.toString());

  /// Obtém ou define o código de barras (EAN) do produto.
  string? get cEAN => getValueFromNode('cEAN');
  set cEAN(String? value) => setTextValueForNode('cEAN', value | "SEM GTIN");

  /// Obtém ou define a descrição do produto.
  string? get xProd => getValueFromNode('xProd');
  set xProd(String? value) => setTextValueForNode('xProd', value?.toString());

  /// Obtém ou define o NCM (Nomenclatura Comum do Mercosul) do produto.
  int? get ncm => getValueFromNode('NCM');
  set ncm(int? value) => setTextValueForNode('NCM', value?.toString());

  /// Obtém ou define o CFOP (Código Fiscal de Operações e Prestações) do produto.
  int? get cfop => getValueFromNode('CFOP');
  set cfop(int? value) => setTextValueForNode('CFOP', value?.toString());

  /// Obtém ou define a unidade comercial do produto.
  string? get uCom => getValueFromNode('uCom');
  set uCom(String? value) => setTextValueForNode('uCom', value?.removeSpecial);

  /// Obtém ou define a quantidade comercial do produto.
  double? get qCom => getValueFromNode('qCom');
  set qCom(double? value) => setTextValueForNode('qCom', value?.toStringAsFixed(4));

  /// Obtém ou define o valor unitário comercial do produto.
  double? get vUnCom => getValueFromNode('vUnCom');
  set vUnCom(double? value) => setTextValueForNode('vUnCom', value?.toStringAsFixed(5));

  /// Obtém ou define o valor total do produto.
  double? get vProd => getValueFromNode('vProd');
  set vProd(double? value) => setTextValueForNode('vProd', value?.toStringAsFixed(2));

  /// Obtém ou define o código de barras (EAN) tributado do produto.
  string? get cEANTrib => getValueFromNode('cEANTrib');
  set cEANTrib(String? value) => setTextValueForNode('cEANTrib', value | "SEM GTIN");

  /// Obtém ou define a unidade tributável do produto.
  string? get uTrib => getValueFromNode('uTrib');
  set uTrib(String? value) => setTextValueForNode('uTrib', value?.removeSpecial);

  /// Obtém ou define a quantidade tributável do produto.
  double? get qTrib => getValueFromNode('qTrib');
  set qTrib(double? value) => setTextValueForNode('qTrib', value?.toStringAsFixed(4));

  /// Obtém ou define o valor unitário tributado do produto.
  double? get vUnTrib => getValueFromNode('vUnTrib');
  set vUnTrib(double? value) => setTextValueForNode('vUnTrib', value?.toStringAsFixed(5));

  /// Obtém ou define o indicador de totalização do produto.
  bool? get indTot => getValueFromNode<string, string>('indTot')?.asNullableBool();
  set indTot(bool? value) => setTextValueForNode('indTot', value == null ? null : (value ? "1" : "0"));

  /// Obtém ou define o CEST (Código Especificador da Substituição Tributária) do produto.
  int? get cest => getValueFromNode('CEST');
  set cest(int? value) => setTextValueForNode('CEST', value?.toString());

  /// Obtém ou define o valor do desconto do produto.
  double? get vDesc => getValueFromNode('vDesc');
  set vDesc(double? value) => setTextValueForNode('vDesc', value?.nullIfZero?.toStringAsFixed(2));

  /// Obtém ou define o valor do frete do produto.
  double? get vFrete => getValueFromNode('vFrete', double.parse);
  set vFrete(double? value) => setTextValueForNode('vFrete', value?.nullIfZero?.toStringAsFixed(2));

  /// Obtém ou define outors valores do produto.
  double? get vOutro => getValueFromNode('vOutro', double.parse);
  set vOutro(double? value) => setTextValueForNode('vOutro', value?.nullIfZero?.toStringAsFixed(2));

  /// Obtém ou define o valor do seguro do produto.
  double? get vSeg => getValueFromNode('vSeg', double.parse);
  set vSeg(double? value) => setTextValueForNode('vSeg', value?.nullIfZero?.toStringAsFixed(2));
}

/// Classe que representa a tag XML 'imposto' do documento fiscal eletrônico (NF-e/NFC-e).
class Imposto extends TagXml {
  Imposto() : super.fromTagName("imposto");

  double get vTotTrib => getValueFromNode('vTotTrib', double.parse) ?? 0;
  set vTotTrib(double value) => setTextValueForNode('vTotTrib', value.toStringAsFixed(2));

  /// Obtém ou define o ICMS (Imposto sobre Circulação de Mercadorias e Serviços) do imposto.
  ICMS? get icms => getTagAs<ICMS>('ICMS', () => ICMS());
  set icms(ICMS? value) => setTagFrom<ICMS>('ICMS', value);

  /// Obtém ou define o PIS (Programa de Integração Social) do imposto.
  PisCofins? get pis => getTagAs<PisCofins>('PIS', () => PIS());
  set pis(PisCofins? value) => setTagFrom<PisCofins>('PIS', value);

  /// Obtém ou define o COFINS (Contribuição para o Financiamento da Seguridade Social) do imposto.
  PisCofins? get cofins => getTagAs<PisCofins>('COFINS', () => COFINS());
  set cofins(PisCofins? value) => setTagFrom<PisCofins>('COFINS', value);

  /// Obtém ou define o IPI (Imposto sobre Produtos Industrializados) do imposto.
  IPI? get ipi => getTagAs<IPI>('IPI', () => IPI());
  set ipi(IPI? value) => setTagFrom<IPI>('IPI', value);

  /// Obtém o ICMSUFDest.
  ///
  /// Retorna o ICMSUFDest, que representa o Imposto sobre Circulação de Mercadorias e Serviços
  /// para o estado de destino da mercadoria.
  ICMSUFDest? get icmsUFDest => getTagAs<ICMSUFDest>('ICMSUFDest', () => ICMSUFDest());
  set icmsUFDest(ICMSUFDest? value) => setTagFrom<ICMSUFDest>('ICMSUFDest', value);
}

/// Classe que representa o ICMS (Imposto sobre Circulação de Mercadorias e Serviços) em um documento XML.
class ICMS extends TagXml {
  ICMS() : super.fromTagName("ICMS");

  /// Obtém o nome da tag ICMS utilizada.
  @override
  string get tagName => (children.singleOrNull as XmlElement?)?.name.local ?? "";
  set tagName(string value) => TagXml.mutate(tag, () => IcmsTag(value));

  /// Obtém o objeto ICMSBase.
  IcmsTag? get tag => getTagAs<IcmsTag>(tagName, () => IcmsTag(tagName));

  set tag(IcmsTag? value) {
    var nm = value?.name.local;
    if (nm != null) {
      setTagFrom<IcmsTag>(nm, value);
    }
  }

  ICMS00? get icms00 => tagName.flatEqual("ICMS00") ? tag : null;
  set icms00(ICMS00? value) {
    tag = value;
    tagName = 'ICMS00';
  }

  ICMS20? get icms20 => tagName.flatEqual("ICMS20") ? tag : null;
  set icms20(ICMS20? value) {
    tag = value;
    tagName = 'ICMS20';
  }

  ICMS40? get icms40 => tagName.flatEqual("ICMS40") ? tag : null;
  set icms40(ICMS40? value) {
    tag = value;
    tagName = 'ICMS40';
  }

  ICMS41? get icms41 => tagName.flatEqual("ICMS41") ? tag : null;
  set icms41(ICMS41? value) {
    tag = value;
    tagName = 'ICMS41';
  }

  ICMS45? get icms45 => tagName.flatEqual("ICMS45") ? tag : null;
  set icms45(ICMS45? value) {
    tag = value;
    tagName = 'ICMS45';
  }

  ICMS50? get icms50 => tagName.flatEqual("ICMS50") ? tag : null;
  set icms50(ICMS50? value) {
    tag = value;
    tagName = 'ICMS50';
  }

  ICMS60? get icms60 => tagName.flatEqual("ICMS60") ? tag : null;
  set icms60(ICMS60? value) {
    tag = value;
    tagName = 'ICMS60';
  }

  ICMS90? get icms90 => tagName.flatEqual("ICMS90") ? tag : null;
  set icms90(ICMS90? value) {
    tag = value;
    tagName = 'ICMS90';
  }

  ICMSOutraUF? get icmsOutraUF => tagName.flatEqual("ICMSOutraUF") ? tag : null;
  set icmsOutraUF(ICMSOutraUF? value) {
    tag = value;
    tagName = 'ICMSOutraUF';
  }

  ICMSSN? get icmsSN => tagName.flatEqual("ICMSSN") ? tag : null;
  set icmsSN(ICMSSN? value) {
    tag = value;
    tagName = 'ICMSSN';
  }

  ICMSvSitT? get icmsvSitT => tagName.flatEqual("ICMSvSitT") ? tag : null;
  set icmsvSitT(ICMSvSitT? value) {
    tag = value;
    tagName = 'ICMSvSitT';
  }

  ICMSSN102? get icmsSN102 => tagName.flatEqual("ICMSSN102") ? tag : null;
  set icmsSN102(ICMSSN102? value) {
    tag = value;
    tagName = 'ICMSSN102';
  }

  ICMSSN202? get icmsSN202 => tagName.flatEqual("ICMSSN202") ? tag : null;
  set icmsSN202(ICMSSN202? value) {
    tag = value;
    tagName = 'ICMSSN202';
  }
}

typedef ICMS00 = IcmsTag;
typedef ICMS20 = IcmsTag;
typedef ICMS40 = IcmsTag;
typedef ICMS41 = IcmsTag;
typedef ICMS45 = IcmsTag;
typedef ICMS50 = IcmsTag;
typedef ICMS60 = IcmsTag;
typedef ICMS90 = IcmsTag;
typedef ICMSOutraUF = IcmsTag;
typedef ICMSSN = IcmsTag;
typedef ICMSvSitT = IcmsTag;
typedef ICMSSN102 = IcmsTag;
typedef ICMSSN202 = IcmsTag;

/// Classe que representa um objeto Rastro.
///
/// Esta classe é responsável por manipular e processar as informações
/// de rastreabilidade de produto (Rastro) de uma Nota Fiscal Eletrônica (NFe).
class Rastro extends TagXml {
  Rastro({int? nLote, double? qLote, DateTime? dFab, DateTime? dVal, String? cAgreg}) : super.fromTagName("rastro") {
    this.nLote = nLote;
    this.qLote = qLote;
    this.dFab = dFab;
    this.dVal = dVal;
    this.cAgreg = cAgreg;
  }

  /// Obtém o número do lote do produto.
  int? get nLote => getValueFromNode('nLote');
  set nLote(int? value) => setTextValueForNode('nLote', value?.toString());

  /// Obtém a quantidade de produto no lote.
  double? get qLote => getValueFromNode('qLote');
  set qLote(double? value) => setTextValueForNode('qLote', value?.toStringAsFixed(3));

  /// Obtém a data de fabricação do produto.
  DateTime? get dFab => getValueFromNode('dFab');
  set dFab(DateTime? value) => setTextValueForNode('dFab', Brasil.formatarDataXML(value));

  /// Obtém a data de validade do produto.
  DateTime? get dVal => getValueFromNode('dVal');
  set dVal(DateTime? value) => setTextValueForNode('dVal', Brasil.formatarDataXML(value));

  /// Obtém o código de agência de regulação.
  String? get cAgreg => getValueFromNode('cAgreg');
  set cAgreg(String? value) => setTextValueForNode('cAgreg', value?.toString());
}

/// Classe que serve de base para as subtags do ICMS que possuem diversos nomes.
class IcmsTag extends TagXml {
  IcmsTag.icms(string sufixo) : super.fromTagName("ICMS$sufixo");
  IcmsTag(super.name) : super.fromTagName();

  /// Obtém o valor do campo orig.
  OrigemProduto? get orig => getValueFromNode('orig', OrigemProduto.fromInt);

  /// Define o valor do campo orig.
  set orig(OrigemProduto? value) => setTextValueForNode('orig', value?.value.toString());

  /// Obtém o valor do campo cST.
  int? get cst => getValueFromNode('CST');
  set cst(int? value) => setTextValueForNode('CST', value?.toString());

  /// Obtém ou define o valor do campo modBC.
  ModalidadeDeterminacaoDaBc? get modBC => getValueFromNode('modBC', ModalidadeDeterminacaoDaBc.fromInt);
  set modBC(ModalidadeDeterminacaoDaBc? value) => setTextValueForNode('modBC', value?.value.toString());

  ModalidadeDeterminacaoDaBcST? get modBCST => getValueFromNode('modBCST', ModalidadeDeterminacaoDaBcST.fromInt);
  set modBCST(ModalidadeDeterminacaoDaBcST? value) => setTextValueForNode('modBCST', value?.value.toString());

  double? get pRedBC => getValueFromNode('pRedBC', double.parse);
  set pRedBC(double? value) => setTextValueForNode('pRedBC', value?.toStringAsFixed(2));

  double? get pRedBCST => getValueFromNode('pRedBCST', double.parse);
  set pRedBCST(double? value) => setTextValueForNode('pRedBCST', value?.toStringAsFixed(2));

  double? get pMVAST => getValueFromNode('pMVAST', double.parse);
  set pMVAST(double? value) => setTextValueForNode('pMVAST', value?.toStringAsFixed(2));

  /// Obtém ou define o valor do campo vBC.
  double? get vBC => getValueFromNode('vBC');
  set vBC(double? value) => setTextValueForNode('vBC', value?.toStringAsFixed(2));

  double? get vBCST => getValueFromNode('vBCST');
  set vBCST(double? value) => setTextValueForNode('vBCST', value?.toStringAsFixed(2));

  /// Obtém ou define o valor do campo pICMS.
  double? get pICMS => getValueFromNode('pICMS');
  set pICMS(double? value) => setTextValueForNode('pICMS', value?.toStringAsFixed(2));

  /// Obtém ou define o valor do campo vICMS.
  double? get pICMSST => getValueFromNode('pICMSST');
  set pICMSST(double? value) => setTextValueForNode('pICMSST', value?.toStringAsFixed(2));

  /// Obtém ou define o valor do campo vICMSST.
  double? get vICMSST => getValueFromNode('vICMSST');
  set vICMSST(double? value) => setTextValueForNode('vICMSST', value?.toStringAsFixed(2));

  /// Obtém ou define o valor do campo vICMS.
  double? get vICMS => getValueFromNode('vICMS');
  set vICMS(double? value) => setTextValueForNode('vICMS', value?.toStringAsFixed(2));

  double? get vBCSTRet => getValueFromNode("vBCSTRet");
  set vBCSTRet(double? value) => setTextValueForNode("vBCSTRet", value?.toStringAsFixed(2));

  double? get pST => getValueFromNode("pST");
  set pST(double? value) => setTextValueForNode("pST", value?.toStringAsFixed(2));

  double? get vICMSSTRet => getValueFromNode("vICMSSTRet");
  set vICMSSTRet(double? value) => setTextValueForNode("vICMSSTRet", value?.toStringAsFixed(2));

  double? get vICMSSubstituto => getValueFromNode("vICMSSubstituto");
  set vICMSSubstituto(double? value) => setTextValueForNode("vICMSSubstituto", value?.toStringAsFixed(2));

  int? get csosn => getValueFromNode("CSOSN");
  set csosn(int? value) => setTextValueForNode("CSOSN", value?.toString());

  double? get pCredSN => getValueFromNode("pCredSN");
  set pCredSN(double? value) => setTextValueForNode("pCredSN", value?.toStringAsFixed(2));

  double? get vCredICMSSN => getValueFromNode("vCredICMSSN");
  set vCredICMSSN(double? value) => setTextValueForNode("vCredICMSSN", value?.toStringAsFixed(2));
}

PisTag PISNT() => PisTag.pis("NT");
PisTag PISAliq() => PisTag.pis("Aliq");
PisTag PISOutr() => PisTag.pis("Outr");
PisTag PISQtde() => PisTag.pis("Qtde");

CofinsTag COFINSNT() => CofinsTag.cofins("NT");
CofinsTag COFINSAliq() => CofinsTag.cofins("Aliq");
CofinsTag COFINSOutr() => CofinsTag.cofins("Outr");
CofinsTag COFINSQtde() => CofinsTag.cofins("Qtde");

PisCofins PIS() => PisCofins("PIS");
PisCofins COFINS() => PisCofins("COFINS");

class PisCofins extends TagXml {
  PisCofins(super.name) : super.fromTagName();

  void computar() {
    aliq?.computar();
    nt?.computar();
    outr?.computar();
    qtde?.computar();
  }

  @override
  Iterable<string> validate() {
    var x = [aliq, nt, outr, qtde].whereNotNull().length;
    return [
      if (tagName != "PIS" && tagName != "COFINS") "$deepArrow Tag $name inválida",
      if (x > 1) "$deepArrow Apenas uma tag de $name deve ser informada",
      if (x == 0) "$deepArrow Tag $name não informada",
      if (x == 1) ...tag!.validate(),
    ];
  }

  /// Obtém o nome da tag PIS ou COFINS utilizada.
  @override
  string get tagName => (children.singleOrNull as XmlElement?)?.name.local ?? "";
  set tagName(string value) => TagXml.mutate(tag, () => PisCofinsTag(value.toUpperCase()));

  /// Obtém a tag PIS ou COFINS.
  PisCofinsTag? get tag => getTagAs<PisCofinsTag>(tagName, () => PisCofinsTag(tagName.toUpperCase()));

  set tag(PisCofinsTag? value) {
    var nm = value?.name.local.toUpperCase();
    if (nm != null) {
      setTagFrom<PisCofinsTag>(nm, value);
    }
  }

  PisCofinsTag? get aliq => tagName.flatEqual("${tagName}Aliq") ? tag : null;
  set aliq(PisCofinsTag? value) {
    tag = value;
    tagName = '${tagName}Aliq';
  }

  PisCofinsTag? get nt => tagName.flatEqual("${tagName}NT") ? tag : null;
  set nt(PisCofinsTag? value) {
    tag = value;
    tagName = '${tagName}NT';
  }

  PisCofinsTag? get outr => tagName.flatEqual("${tagName}Outr") ? tag : null;
  set outr(PisCofinsTag? value) {
    tag = value;
    tagName = '${tagName}Outr';
  }

  PisCofinsTag? get qtde => tagName.flatEqual("${tagName}Qtde") ? tag : null;
  set qtde(PisCofinsTag? value) {
    tag = value;
    tagName = '${tagName}Qtde';
  }
}

class PisCofinsTag extends TagXml {
  PisCofinsTag(super.tagName) : super.fromTagName();
  PisCofinsTag.cofins(string sufixo) : super.fromTagName("COFINS${sufixo.toUpperCase()}");
  PisCofinsTag.pis(string sufixo) : super.fromTagName("PIS${sufixo.toUpperCase()}");

  string get pisCofinsTag {
    if (hasParent) {
      return parentElement!.name.local;
    }
    if (tagName.startsWith("PIS")) {
      return "PIS";
    } else if (tagName.startsWith("COFINS")) {
      return "COFINS";
    }
    return "INVALIDO";
  }

  string get sufixo => tagName.after(pisCofinsTag);

  void computar() {
    if (sufixo == "NT") {
      _vPisCofins = null;
      _pPisCofins = null;
      vBC = null;
    }

    if (pisCofinsTag.startsWith("PIS")) {
      removeChildren("vCOFINS");
      removeChildren("pCOFINS");
    } else if (pisCofinsTag.startsWith("COFINS")) {
      removeChildren("vPIS");
      removeChildren("pPIS");
    }
  }

  @override
  Iterable<string> validate() {
    return [
      if (pisCofinsTag.startsWithAny(["PIS", "COFINS"]) == false) "$deepArrow Tag $tagName inválida. Deve começar com PIS ou COFINS.",
      if (cst == null) "$deepArrow CST não informado",
      if (sufixo != "NT") ...[
        if (vBC == null) "$deepArrow Valor da base de cálculo não informado",
        if (_pPisCofins == null) "$deepArrow Alíquota não informada",
        if (_vPisCofins == null) "$deepArrow Valor não informado",
      ] else ...[
        if (vBC != null) "$deepArrow Valor da base de cálculo não deve ser informado para $pisCofinsTag",
        if (_pPisCofins != null) "$deepArrow Alíquota não deve ser informada para $pisCofinsTag",
        if (_vPisCofins != null) "$deepArrow Valor não deve ser informado para $pisCofinsTag",
      ]
    ];
  }

  double? get vBC => getValueFromNode('vBC');
  set vBC(double? value) => setTextValueForNode('vBC', value?.toStringAsFixed(2));

  double? get _pPisCofins => getValueFromNode('p$pisCofinsTag');
  set _pPisCofins(double? value) => setTextValueForNode('p$pisCofinsTag', value?.toStringAsFixed(4));

  double? get _vPisCofins => getValueFromNode('v$pisCofinsTag');
  set _vPisCofins(double? value) => setTextValueForNode('v$pisCofinsTag', value?.toStringAsFixed(2));

  double? get qBCProd => getValueFromNode('qBCProd');
  set qBCProd(double? value) => setTextValueForNode('qBCProd', value?.toStringAsFixed(4));

  double? get vAliqProd => getValueFromNode('vAliqProd');
  set vAliqProd(double? value) => setTextValueForNode('vAliqProd', value?.toStringAsFixed(4));

  /// Obtém ou define o valor do campo cst.
  int? get cst => getValueFromNode("CST");
  set cst(int? value) => setTextValueForNode("CST", value?.toString());
}

class CofinsTag extends PisCofinsTag {
  CofinsTag(super.tagName) : super();
  CofinsTag.cofins(string sufixo) : super.cofins(sufixo);

  double? get vCOFINS => _vPisCofins;
  set vCOFINS(double? value) => _vPisCofins = value;

  double? get pCOFINS => _pPisCofins;
  set pCOFINS(double? value) => _pPisCofins = value;
}

class PisTag extends PisCofinsTag {
  PisTag(super.tagName) : super();
  PisTag.pis(string sufixo) : super.pis(sufixo);

  double? get vPIS => _vPisCofins;
  set vPIS(double? value) => _vPisCofins = value;

  double? get pPIS => _pPisCofins;
  set pPIS(double? value) => _pPisCofins = value;
}

/// Classe que representa o elemento Total em um documento XML da NFe.
class Total extends TagXml {
  Total() : super.fromTagName("total");

  /// Obtém o elemento ICMSTot.
  ICMSTot? get icmsTot => getTagAs('ICMSTot', () => ICMSTot());
  set icmsTot(ICMSTot? value) => setTagFrom('ICMSTot', value);

  @override
  Iterable<string> validate() {
    return [
      if (icmsTot == null) "$deepArrow Tag ICMSTot não informada" else ...icmsTot!.validate(),
    ];
  }
}

/// Classe que representa a tag ICMSTot em um documento XML.
class ICMSTot extends TagXml {
  ICMSTot() : super.fromTagName("ICMSTot");

  @override
  Iterable<string> validate() {
    return [
      if (vBC == null) "$deepArrow Valor da base de cálculo do ICMS não informado",
      if (vICMS == null) "$deepArrow Valor do ICMS não informado",
      if (vICMSDeson == null) "$deepArrow Valor do ICMS desonerado não informado",
      if (vFCP == null) "$deepArrow Valor do FCP não informado",
      if (vBCST == null) "$deepArrow Valor da base de cálculo do ICMS ST não informado",
      if (vST == null) "$deepArrow Valor do ICMS ST não informado",
      if (vFCPST == null) "$deepArrow Valor do FCP ST não informado",
      if (vFCPSTRet == null) "$deepArrow Valor do FCP ST retido não informado",
      if (vProd == null) "$deepArrow Valor total dos produtos não informado",
      if (vFrete == null) "$deepArrow Valor do frete não informado",
      if (vSeg == null) "$deepArrow Valor do seguro não informado",
      if (vDesc == null) "$deepArrow Valor do desconto não informado",
      if (vII == null) "$deepArrow Valor do II não informado",
      if (vIPI == null) "$deepArrow Valor do IPI não informado",
      if (vPIS == null) "$deepArrow Valor do PIS não informado",
      if (vCOFINS == null) "$deepArrow Valor do COFINS não informado",
      if (vOutro == null) "$deepArrow Outras despesas acessórias não informadas",
      if (vNF == null) "$deepArrow Valor total da NF não informado",
    ];
  }

  /// Obtém o valor da tag vBC.
  double? get vBC => getValueFromNode('vBC');
  set vBC(double? value) => setTextValueForNode('vBC', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vICMS.
  double? get vICMS => getValueFromNode('vICMS');
  set vICMS(double? value) => setTextValueForNode('vICMS', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vICMSDeson.
  double? get vICMSDeson => getValueFromNode('vICMSDeson');
  set vICMSDeson(double? value) => setTextValueForNode('vICMSDeson', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vFCPUFDest.
  double? get vFCPUFDest => getValueFromNode('vFCPUFDest');
  set vFCPUFDest(double? value) => setTextValueForNode('vFCPUFDest', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vICMSUFDest.
  double? get vICMSUFDest => getValueFromNode('vICMSUFDest');
  set vICMSUFDest(double? value) => setTextValueForNode('vICMSUFDest', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vICMSUFRemet.
  double? get vICMSUFRemet => getValueFromNode('vICMSUFRemet');
  set vICMSUFRemet(double? value) => setTextValueForNode('vICMSUFRemet', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vFCP.
  double? get vFCP => getValueFromNode('vFCP');
  set vFCP(double? value) => setTextValueForNode('vFCP', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vBCST.
  double? get vBCST => getValueFromNode('vBCST');
  set vBCST(double? value) => setTextValueForNode('vBCST', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vST.
  double? get vST => getValueFromNode('vST');
  set vST(double? value) => setTextValueForNode('vST', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vFCPST.
  double? get vFCPST => getValueFromNode('vFCPST');
  set vFCPST(double? value) => setTextValueForNode('vFCPST', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vFCPSTRet.
  double? get vFCPSTRet => getValueFromNode('vFCPSTRet');
  set vFCPSTRet(double? value) => setTextValueForNode('vFCPSTRet', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vProd.
  double? get vProd => getValueFromNode('vProd');
  set vProd(double? value) => setTextValueForNode('vProd', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vFrete.
  double? get vFrete => getValueFromNode('vFrete');
  set vFrete(double? value) => setTextValueForNode('vFrete', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vSeg.
  double? get vSeg => getValueFromNode('vSeg');
  set vSeg(double? value) => setTextValueForNode('vSeg', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vDesc.
  double? get vDesc => getValueFromNode('vDesc');
  set vDesc(double? value) => setTextValueForNode('vDesc', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vII.
  double? get vII => getValueFromNode('vII');
  set vII(double? value) => setTextValueForNode('vII', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vIPI.
  double? get vIPI => getValueFromNode('vIPI');
  set vIPI(double? value) => setTextValueForNode('vIPI', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vIPIDevol.
  double? get vIPIDevol => getValueFromNode('vIPIDevol');
  set vIPIDevol(double? value) => setTextValueForNode('vIPIDevol', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vPIS.
  double? get vPIS => getValueFromNode('vPIS');
  set vPIS(double? value) => setTextValueForNode('vPIS', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vCOFINS.
  double? get vCOFINS => getValueFromNode('vCOFINS');
  set vCOFINS(double? value) => setTextValueForNode('vCOFINS', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vOutro.
  double? get vOutro => getValueFromNode('vOutro');
  set vOutro(double? value) => setTextValueForNode('vOutro', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vNF.
  double? get vNF => getValueFromNode('vNF');
  set vNF(double? value) => setTextValueForNode('vNF', value?.toStringAsFixed(2));

  /// Obtém o valor da tag vTotTrib.
  double? get vTotTrib => getValueFromNode('vTotTrib');
  set vTotTrib(double? value) => setTextValueForNode('vTotTrib', value?.toStringAsFixed(2));
}

/// Classe Transp que representa a tag XML Transp.
class Transp extends TagXml {
  Transp() : super.fromTagName("transp");

  /// Obtém o valor do atributo modFrete.
  ModalidadeFreteNFe? get modFrete => getValueFromNode('modFrete');

  /// Define o valor do atributo modFrete.
  set modFrete(ModalidadeFreteNFe? value) => setTextValueForNode('modFrete', value?.value.toString());
}

/// Classe Cobr que representa a tag XML Cobr.
class Cobr extends TagXml {
  Cobr() : super.fromTagName("cobr");

  /// Obtém o objeto Fat.
  Fat? get fat => getTagAs("fat", () => Fat());

  /// Define o objeto Fat.
  set fat(Fat? value) => setTagFrom("fat", value);

  /// Obtém uma lista de objetos Dup.
  Iterable<Dup> get dup => getTagsFrom('dup', () => Dup());
  set dup(Iterable<Dup> value) {
    while (findElements('dup').isNotEmpty) {
      findElements('dup').first.remove();
    }
    for (var dup in value) {
      addDup(dup);
    }
  }

  Dup addDup(Dup dup) {
    children.add(dup);
    return dup;
  }
}

/// Classe que representa as faturas utilizadas na Nota Fiscal Eletrônica (NF-e).
class Fat extends TagXml {
  Fat() : super.fromTagName("fat");

  ///Obtem ou define o número da fatura
  string? get nFat => getValueFromNode('nFat');
  set nFat(String? value) => setTextValueForNode('nFat', value?.toString());

  /// Obtém ou define o valor original da fatura
  double? get vOrig => getValueFromNode('vOrig');
  set vOrig(double? value) => setTextValueForNode('vOrig', value?.toStringAsFixed(2));

  /// Obtém ou define o valor de desconto da fatura
  double? get vDesc => getValueFromNode('vDesc');
  set vDesc(double? value) => setTextValueForNode('vDesc', value?.toStringAsFixed(2));

  /// Obtém ou define o valor liquido da fatura
  double? get vLiq => getValueFromNode('vLiq');
  set vLiq(double? value) => setTextValueForNode('vLiq', value?.toStringAsFixed(2));

  @override
  Iterable<string> validate() {
    return [
      if (nFat == null) '$deepArrow Número da fatura não informado',
      if (vOrig == null) '$deepArrow Valor original da fatura não informado',
      if (vDesc == null) '$deepArrow Valor do desconto da fatura não informado',
      if (vLiq == null) '$deepArrow Valor líquido da fatura não informado',
    ];
  }
}

/// Classe que representa a tag XML <Dup> utilizada na Nota Fiscal Eletrônica (NF-e).
class Dup extends TagXml {
  Dup() : super.fromTagName("dup");

  /// Obtém ou define o numero da parcela
  int? get nDup => getValueFromNode('nDup');
  set nDup(int? value) => setTextValueForNode('nDup', value.fixedLength(3));

  /// Obtém ou define a data de vencimento da parcela
  DateTime? get dVenc => getValueFromNode('dVenc');
  set dVenc(DateTime? value) => setTextValueForNode('dVenc', Brasil.formatarDataXML(value));

  /// Obtém ou define o valor da parcela
  double? get vDup => getValueFromNode('vDup');
  set vDup(double? value) => setTextValueForNode('vDup', value?.toStringAsFixed(2));

  @override
  Iterable<string> validate() {
    return [
      if (nDup == null) '$deepArrow Número da parcela não informado' else if (nDup.toString().length.isBetween(1, 60) == false) '$deepArrow Número da parcela inválido. Deve ter entre 1 e 60 caracteres',
      if (dVenc == null) '$deepArrow Data de vencimento da parcela não informada' else if (dVenc!.isBefore(DateTime(1900)) || dVenc!.isAfter(DateTime(2099))) '$deepArrow Data de vencimento da parcela inválida',
      if (vDup == null) '$deepArrow Valor da parcela não informado' else if (vDup! <= 0) '$deepArrow Valor da parcela não pode ser zero ou negativo',
    ];
  }
}

class Pag extends TagXml {
  Pag() : super.fromTagName("pag");

  /// Retorna um mapa que mapeia cada forma de pagamento com uma lista de valores.
  ///
  /// A chave do mapa representa a forma de pagamento e o valor associado é uma lista de valores.
  /// Os valores são agrupados com base na forma de pagamento usando a função [groupAndMapBy].

  Map<FormaPagamento?, List<Pagamento>> get pagamentos => detPag.groupAndMapBy((e) => e.tPag);
  set pagamentos(Map<FormaPagamento?, List<Pagamento>> value) {
    detPag = [];
    for (var valores in value.entries) {
      for (var valor in valores.value) {
        addDetPag(valor);
      }
    }
  }

  /// Obtém ou define a lista de pagamentos da nota fiscal eletrônica.
  ///
  /// A lista de pagamentos é uma lista de tuplas contendo a forma de pagamento
  /// e o valor correspondente.
  ///
  /// Exemplo:
  /// ```dart
  /// List<(FormaPagamento, double)> listaPagamentos = [
  ///   (FormaPagamento.cartaoCredito, 100.0),
  ///   (FormaPagamento.dinheiro, 50.0),
  /// ];
  /// ```
  List<Pagamento> get listaPagamentos => [
        for (var item in pagamentos.entries) ...[...item.value],
      ];

  set listaPagamentos(List<Pagamento> value) {
    detPag = [];
    for (var item in value) {
      addPagamento(item.tPag, item.vPag, item.vTroco);
    }
  }

  /// Obtém ou define os elementos <detPag> da nota fiscal eletrônica.
  Iterable<DetPag> get detPag => getTagsFrom('detPag', () => DetPag());
  set detPag(Iterable<DetPag> value) {
    removeChildren('detPag');
    for (var detPag in value) {
      addDetPag(detPag);
    }
  }

  /// Adiciona um pagamento à nota fiscal eletrônica.
  DetPag addPagamento(FormaPagamento? formaPagamento, double valor, [double troco = 0]) => addDetPag(DetPag.from(formaPagamento, valor, troco));

  /// Adiciona um pagamento à nota fiscal eletrônica.
  DetPag addDetPag(DetPag detPag) {
    if (detPag.parent != null) {
      detPag.remove();
    }
    children.add(detPag);
    return detPag;
  }

  @override
  Iterable<string> validate() {
    return [
      if (detPag.isEmpty) '$deepArrow Nenhum pagamento informado' else ...detPag.expand((e) => e.validate()),
      if (detPag.length > 100) '$deepArrow Número máximo de pagamentos excedido. O limite é 100 pagamentos',
    ];
  }
}

typedef Pagamento = DetPag;

/// Classe que representa o elemento DetPag de uma nota fiscal eletrônica.
class DetPag extends TagXml {
  DetPag() : super.fromTagName("detPag");

  factory DetPag.from(FormaPagamento? tPag, double vPag, [double vTroco = 0]) => DetPag()
    ..tPag = tPag
    ..vPag = vPag
    ..vTroco = vTroco;

  /// Obtém o índice do DetPag no documento XML.
  int? get indexDetPag => parent?.findElements("detPag").toList(growable: false).indexOf(this) ?? -1;

  @override
  Iterable<string> validate() {
    return [
      if (tPag != FormaPagamento.semPagamento && vPag <= 0) '$deepArrow Valor do pagamento não informado no DetPag $indexDetPag' else if (tPag == FormaPagamento.semPagamento && vPag > 0) 'Forma de pagamento não informada no DetPag $indexDetPag',
      if (vTroco < 0) 'Valor do troco não pode ser negativo no DetPag $indexDetPag',
      if (vPag < vTroco) 'Valor do troco não pode ser maior que o valor do pagamento no DetPag $indexDetPag',
      if (vPag == 0) 'Valor do pagamento não pode ser zero no DetPag $indexDetPag',
    ];
  }

  /// Retorna o valor total do pagamento.
  double get total => vPag - vTroco;

  /// Indicador de pagamento.
  IndicadorFormaPagamento? get indPag => getValueFromNode('indPag', IndicadorFormaPagamento.fromInt);
  set indPag(IndicadorFormaPagamento? value) => setTextValueForNode('indPag', value?.value.toString());

  /// Tipo de pagamento.
  FormaPagamento? get tPag => getValueFromNode('tPag', FormaPagamento.fromInt);
  set tPag(FormaPagamento? value) => setTextValueForNode('tPag', value?.value.toString());

  /// Valor do pagamento.
  double get vPag => getValueFromNode('vPag') ?? 0;
  set vPag(double value) => setTextValueForNode('vPag', value.forcePositive.toStringAsFixed(2));

  double get vTroco => getValueFromNode('vTroco') ?? 0;
  set vTroco(double value) => setTextValueForNode('vTroco', value.forcePositive.nullIfZero?.toStringAsFixed(2));
}

/// Classe que representa o protocolo da Nota Fiscal Eletrônica (NFe).
class ProtNFe extends TagXml {
  ProtNFe() : super.fromTagName("protNFe");

  /// Obtém ou define as informações do protocolo.
  InfProt? get infProt => getTagAs('infProt', () => InfProt());
  set infProt(InfProt? value) => setTagFrom("infProt", value);

  @override
  Iterable<string> validate() {
    return infProt?.validate() ?? [];
  }
}

/// Classe que representa a tag InfProt de um documento XML da Nota Fiscal Eletrônica (NF-e).
class InfProt extends TagXml {
  InfProt() : super.fromTagName("infProt");

  @override
  Iterable<string> validate() {
    return [
      if (chNFe == null) 'Chave de acesso da NF-e não informada' else if (ChaveNFe.validar(chNFe) == false) 'Chave de acesso da NF-e inválida',
      if (dhRecbto == null) 'Data e hora do recebimento da NF-e não informada',
      if (nProt == null) 'Número do protocolo de autorização da NF-e não informado',
      if (digVal == null) 'Valor do digest value da NF-e não informado',
      if (cStat == StatusNFe.desconhecido) 'Código do status da NF-e não informado',
      if (xMotivo == null) 'Descrição do motivo do status da NF-e não informada',
    ];
  }

  /// Tipo de ambiente em que a NF-e foi autorizada.
  TipoAmbiente? get tpAmb => getValueFromNode('tpAmb', TipoAmbiente.fromInt);
  set tpAmb(TipoAmbiente? value) => setTextValueForNode('tpAmb', value?.value.toString());

  /// Versão da aplicação que autorizou a NF-e.
  string? get verAplic => getValueFromNode('verAplic');
  set verAplic(String? value) => setTextValueForNode('verAplic', value?.toString());

  /// Chave de acesso da NF-e.
  ChaveNFe? get chNFe => ChaveNFe.fromString(getValueFromNode('chNFe'));
  set chNFe(ChaveNFe? value) => setTextValueForNode('chNFe', value?.chave);

  /// Data e hora do recebimento da NF-e.
  DateTime? get dhRecbto => getValueFromNode<DateTime?, string>('dhRecbto', (x) => x.nullIfBlank?.toDate());
  set dhRecbto(DateTime? value) => setTextValueForNode('dhRecbto', Brasil.formatarDataXML(value));

  /// Número do protocolo de autorização da NF-e.
  int? get nProt => getValueFromNode('nProt');
  set nProt(int? value) => setTextValueForNode('nProt', value?.toString());

  /// Valor do digest value da NF-e.
  string? get digVal => getValueFromNode('digVal');
  set digVal(String? value) => setTextValueForNode('digVal', value?.toString());

  /// Código do status da NF-e.
  StatusNFe get cStat => getValueFromNode('cStat', StatusNFe.fromInt) ?? StatusNFe.desconhecido;
  set cStat(StatusNFe value) => setTextValueForNode('cStat', value.value.toString());

  /// Descrição do motivo do status da NF-e.
  string? get xMotivo => getValueFromNode('xMotivo');
  set xMotivo(String? value) => setTextValueForNode('xMotivo', value?.toString());

  /// Retorna o status da NF-e com base no código de status.
  string get status => cStat.toString();
}

/// Classe que representa a tag InfAdic em um arquivo XML da NFe.
class InfAdic extends TagXml {
  InfAdic() : super.fromTagName("infAdic");

  @override
  Iterable<string> validate() {
    return [
      if (infCpl != null && infCpl!.length > 2000) 'Campo infCpl deve ter no máximo 2000 caracteres',
      if (infAdFisco != null && infAdFisco!.length > 5000) 'Campo infAdFisco deve ter no máximo 5000 caracteres',
      for (var obs in obsFisco) ...obs.validate(),
      for (var obs in obsCont) ...obs.validate(),
    ];
  }

  /// Obtém ou define o valor do campo infCpl.
  ///
  /// Retorna o valor do campo infCpl da tag InfAdic.
  string? get infCpl => getValueFromNode("infCpl");
  set infCpl(String? value) => setTextValueForNode("infCpl", value?.first(2000));

  /// Obtém ou define o valor do campo infAdFisco.
  /// Retorna o valor do campo infAdFisco da tag InfAdic.
  string? get infAdFisco => getValueFromNode("infAdFisco");
  set infAdFisco(String? value) => setTextValueForNode("infAdFisco", value?.first(5000));

  /// Obtém ou define os valores das tags obsFisco.
  Iterable<ObsFisco> get obsFisco => getTagsFrom("obsFisco", () => ObsFisco());
  set obsFisco(Iterable<ObsFisco> value) {
    removeChildren('obsFisco');
    for (var obs in value) {
      addObsFisco(obs);
    }
  }

  /// Obtém ou define os valores das tags obsCont.
  Iterable<ObsCont> get obsCont => getTagsFrom("obsCont", () => ObsCont());
  set obsCont(Iterable<ObsCont> value) {
    removeChildren('obsCont');
    for (var obs in value) {
      addObsCont(obs);
    }
  }

  /// Obtém ou define os valores das tags obsFisco e obsCont.
  Iterable<ObsBase> get obs => [...obsCont, ...obsFisco];
  set obs(Iterable<ObsBase> value) {
    removeChildren('obsCont');
    removeChildren('obsFisco');
    for (var obs in value) {
      addObs(obs);
    }
  }

  /// Adiciona uma nova observação à tag InfAdic.
  O addObs<O extends ObsBase>(O obs) {
    children.add(obs);
    return obs;
  }

  /// Adiciona uma nova observação do fisco à tag InfAdic.
  ObsFisco addObsFisco(ObsFisco obs) => addObs(obs);

  /// Adiciona uma nova observação do contribuinte à tag InfAdic.
  ObsCont addObsCont(ObsCont obs) => addObs(obs);

  /// Adiciona uma nova observação do fisco à tag InfAdic.
  ObsFisco addObsFiscoFrom(String xCampo, String xTexto) => addObsFisco(ObsFisco(xCampo, xTexto));

  /// Adiciona uma nova observação do contribuinte à tag InfAdic.
  ObsCont addObsContFrom(String xCampo, String xTexto) => addObsCont(ObsCont(xCampo, xTexto));
}

/// Classe que representa uma Observação de Contribuinte.
class ObsCont extends ObsBase {
  ObsCont([string? xCampo, string? xTexto]) : super("obsCont") {
    if (xCampo != null) this.xCampo = xCampo;
    if (xTexto != null) this.xTexto = xTexto;
  }
}

/// Classe que representa uma Observação de Fisco.
class ObsFisco extends ObsBase {
  ObsFisco([string? xCampo, string? xTexto]) : super("obsFisco") {
    if (xCampo != null) this.xCampo = xCampo;
    if (xTexto != null) this.xTexto = xTexto;
  }
}

class ObsBase extends TagXml {
  ObsBase(super.tagName) : super.fromTagName();

  @override
  Iterable<string> validate() {
    return [
      if (xCampo.length < 2) 'Campo xCampo inválido',
      if (xTexto == null) 'Campo xTexto não informado' else if (xTexto!.length < 2) 'Campo xTexto inválido',
    ];
  }

  /// Obtém ou define o valor do campo xCampo.
  ///
  /// Retorna o valor do campo xCampo da tag Obs.
  string get xCampo => getAttribute("xCampo")!;
  set xCampo(String value) => setAttribute("xCampo", value.toString());

  /// Obtém ou define o valor do campo xTexto.
  ///
  /// Retorna o valor do campo xTexto da tag Obs.
  string? get xTexto => getValueFromNode("xTexto");
  set xTexto(String? value) => setTextValueForNode("xTexto", value?.toString());
}

/// Classe que representa a tag InfRespTec em um arquivo XML da NFe.
class InfRespTec extends TagXml {
  InfRespTec() : super.fromTagName("infRespTec");

  @override
  Iterable<string> validate() {
    return [
      if (cnpj == null) '$deepArrow CNPJ do responsável técnico não informado' else if (Brasil.validarCNPJ(cnpj!) == false) '$deepArrow CNPJ do responsável técnico inválido',
      if (xContato == null) '$deepArrow Nome do contato do responsável técnico não informado' else if (xContato!.length < 2) '$deepArrow Nome do contato do responsável técnico inválido',
      if (email == null) '$deepArrow E-mail do responsável técnico não informado' else if (email!.isEmail == false) '$deepArrow E-mail do responsável técnico inválido',
      if (fone == null) '$deepArrow Telefone do responsável técnico não informado' else if (Brasil.validarTelefone(fone) == false) '$deepArrow Telefone do responsável técnico inválido',
    ];
  }

  /// Obtém ou define o valor do campo CNPJ.
  ///
  /// Retorna o valor do campo CNPJ da tag InfRespTec.
  string? get cnpj => getValueFromNode("CNPJ");
  set cnpj(String? value) => setTextValueForNode("CNPJ", value?.toString());

  /// Obtém o valor do campo xContato.
  ///
  /// Retorna o valor do campo xContato da tag InfRespTec.
  string? get xContato => getValueFromNode("xContato");
  set xContato(String? value) => setTextValueForNode("xContato", value?.toString());

  /// Obtém o valor do campo email.
  ///
  /// Retorna o valor do campo email da tag InfRespTec.
  string? get email => getValueFromNode("email");
  set email(String? value) => setTextValueForNode("email", value?.toString());

  /// Obtém o valor do campo fone.
  ///
  /// Retorna o valor do campo fone da tag InfRespTec.
  string? get fone => getValueFromNode("fone");
  set fone(String? value) => setTextValueForNode("fone", value?.toString());
}
