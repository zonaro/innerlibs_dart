import 'package:innerlibs/innerlibs.dart';
import 'package:xml/xml.dart';

class NFeProc {
  final XmlDocument document;

  NFeProc(this.document);

  NFeProc.parse(String xml) : document = XmlDocument.parse(xml);

  NFe? get nfe {
    var n = document.findAllElements('NFe').singleOrNull;
    if (n != null) return NFe(n);
    return null;
  }

  String? get versao => nfe?.node.getAttribute('versao') ?? "";
  String? get id => nfe?.node.getAttribute('Id') ?? "";

  ProtNFe? get protNFe {
    var n = document.findAllElements('protNFe').singleOrNull;
    if (n != null) return ProtNFe(n);
    return null;
  }

  ChaveNFe? get chaveNota => id != null && id!.onlyNumbers.isNumber ? ChaveNFe.fromString(id!.onlyNumbers) : null;

  Map<string, List<double>> get pagamentos => nfe?.pag?.pagamentos ?? {};

  InfAdic? get infAdic {
    var n = document.findAllElements('infAdic').singleOrNull;
    if (n != null) return InfAdic(n);
    return null;
  }

  Uri? get uriNFCe {
    var chave = chaveNota;
    if (chave != null) {
      return gerarUriNFCe(
        chNFe: chave.chave,
        nVersao: versao ?? "",
        tpAmb: nfe?.ide?.tpAmb ?? "",
        dhEmi: nfe?.ide?.dhEmi ?? "",
        vNF: nfe?.total?.icmsTot?.vNF ?? "",
        vICMS: nfe?.total?.icmsTot?.vICMS ?? "",
        digVal: protNFe?.infProt?.digVal ?? "",
        cIdToken: "",
        cHashQRCode: "",
      );
    }
    return null;
  }

  static Uri gerarUriNFCe({
    required String chNFe,
    required String nVersao,
    required String tpAmb,
    required String dhEmi,
    required String vNF,
    required String vICMS,
    required String digVal,
    required String cIdToken,
    required String cHashQRCode,
  }) {
    return Uri.parse(
      'https://www.homologacao.nfce.fazenda.sp.gov.br/NFCeConsultaPublica/Paginas/ConsultaQRCode.aspx'
      '?chNFe=$chNFe'
      '&nVersao=$nVersao'
      '&tpAmb=$tpAmb'
      '&dhEmi=${Uri.encodeComponent(dhEmi)}'
      '&vNF=$vNF'
      '&vICMS=$vICMS'
      '&digVal=${Uri.encodeComponent(digVal)}'
      '&cIdToken=$cIdToken'
      '&cHashQRCode=$cHashQRCode',
    );
  }

  @override
  String toString() => document.outerXml;
}

class NFe {
  final XmlNode node;

  NFe(this.node);

  double get valorTotal => total?.icmsTot?.vNF.toDouble ?? 0;
  double get desconto => total?.icmsTot?.vDesc.toDouble ?? 0;
  double get totalPago => detPag.sum((x) => x.valorPago);

  Ide? get ide {
    var n = node.findAllElements('ide').singleOrNull;
    if (n != null) return Ide(n);
    return null;
  }

  Emit? get emit {
    var n = node.findAllElements('emit').singleOrNull;
    if (n != null) return Emit(n);
    return null;
  }

  Dest? get dest {
    var n = node.findAllElements('dest').singleOrNull;
    if (n != null) return Dest(n);
    return null;
  }

  Iterable<Det> get det => node.findAllElements('det').map((element) => Det(element));

  Iterable<DetPag> get detPag => pag?.detPag ?? [];

  Total? get total {
    var n = node.findAllElements('total').singleOrNull;
    if (n != null) return Total(n);
    return null;
  }

  Transp? get transp {
    var n = node.findAllElements('transp').singleOrNull;
    if (n != null) return Transp(n);
    return null;
  }

  Cobr? get cobr {
    var n = node.findAllElements('cobr').singleOrNull;
    if (n != null) return Cobr(n);
    return null;
  }

  Pag? get pag {
    var n = node.findAllElements('pag').singleOrNull;
    if (n != null) return Pag(n);
    return null;
  }
}

class Ide {
  final XmlNode node;

  Ide(this.node);

  String? get cUF => node.findAllElements('cUF').singleOrNull?.innerText;

  String? get cNF => node.findAllElements('cNF').singleOrNull?.innerText;

  String? get natOp => node.findAllElements('natOp').singleOrNull?.innerText;

  String? get mod => node.findAllElements('mod').singleOrNull?.innerText;

  String? get serie => node.findAllElements('serie').singleOrNull?.innerText;

  String? get nNF => node.findAllElements('nNF').singleOrNull?.innerText;

  String? get dhEmi => node.findAllElements('dhEmi').singleOrNull?.innerText;

  String? get tpNF => node.findAllElements('tpNF').singleOrNull?.innerText;

  String? get idDest => node.findAllElements('idDest').singleOrNull?.innerText;

  String? get cMunFG => node.findAllElements('cMunFG').singleOrNull?.innerText;

  String? get tpImp => node.findAllElements('tpImp').singleOrNull?.innerText;

  String? get tpEmis => node.findAllElements('tpEmis').singleOrNull?.innerText;

  String? get cDV => node.findAllElements('cDV').singleOrNull?.innerText;

  String? get tpAmb => node.findAllElements('tpAmb').singleOrNull?.innerText;

  String? get finNFe => node.findAllElements('finNFe').singleOrNull?.innerText;

  String? get indFinal => node.findAllElements('indFinal').singleOrNull?.innerText;

  String? get indPres => node.findAllElements('indPres').singleOrNull?.innerText;

  String? get indIntermed => node.findAllElements('indIntermed').singleOrNull?.innerText;

  String? get procEmi => node.findAllElements('procEmi').singleOrNull?.innerText;

  String? get verProc => node.findAllElements('verProc').singleOrNull?.innerText;
}

class Emit {
  final XmlNode node;

  Emit(this.node);

  String? get cnpj => node.findAllElements('CNPJ').singleOrNull?.innerText;

  String? get xNome => node.findAllElements('xNome').singleOrNull?.innerText;

  String? get xFant => node.findAllElements('xFant').singleOrNull?.innerText;

  EnderEmit? get enderEmit {
    var n = node.findAllElements('enderEmit').singleOrNull;
    if (n != null) return EnderEmit(n);
    return null;
  }

  String? get ie => node.findAllElements('IE').singleOrNull?.innerText;

  String? get crt => node.findAllElements('CRT').singleOrNull?.innerText;
}

class EnderEmit {
  final XmlNode node;

  EnderEmit(this.node);

  String get xLgr {
    return node.findAllElements('xLgr').singleOrNull?.innerText ?? "";
  }

  set xLgr(String? value) {
    node.findAllElements('xLgr').singleOrNull?.innerText = value ?? "";
  }

  String get nro {
    return node.findAllElements('nro').singleOrNull?.innerText ?? "";
  }

  set nro(String? value) {
    node.findAllElements('nro').singleOrNull?.innerText = value ?? "";
  }

  String get xBairro {
    return node.findAllElements('xBairro').singleOrNull?.innerText ?? "";
  }

  set xBairro(String? value) {
    node.findAllElements('xBairro').singleOrNull?.innerText = value ?? "";
  }

  String get cMun {
    return node.findAllElements('cMun').singleOrNull?.innerText ?? "";
  }

  set cMun(String? value) {
    node.findAllElements('cMun').singleOrNull?.innerText = value ?? "";
  }

  String get xMun {
    return node.findAllElements('xMun').singleOrNull?.innerText ?? "";
  }

  set xMun(String? value) {
    node.findAllElements('xMun').singleOrNull?.innerText = value ?? "";
  }

  String get uf {
    return node.findAllElements('UF').singleOrNull?.innerText ?? "";
  }

  set uf(String? value) {
    node.findAllElements('UF').singleOrNull?.innerText = value ?? "";
  }

  String get cep {
    return node.findAllElements('CEP').singleOrNull?.innerText ?? "";
  }

  set cep(String? value) {
    node.findAllElements('CEP').singleOrNull?.innerText = value ?? "";
  }

  String get cPais {
    return node.findAllElements('cPais').singleOrNull?.innerText ?? "";
  }

  set cPais(String? value) {
    node.findAllElements('cPais').singleOrNull?.innerText = value ?? "";
  }

  String get xPais {
    return node.findAllElements('xPais').singleOrNull?.innerText ?? "";
  }

  set xPais(String? value) {
    node.findAllElements('xPais').singleOrNull?.innerText = value ?? "";
  }

  String get fone {
    return node.findAllElements('fone').singleOrNull?.innerText ?? "";
  }

  set fone(String? value) {
    node.findAllElements('fone').singleOrNull?.innerText = value ?? "";
  }
}

class Dest {
  final XmlNode node;

  Dest(this.node);

  String? get cnpj => node.findAllElements('CNPJ').singleOrNull?.innerText;

  String? get cpf => node.findAllElements('CPF').singleOrNull?.innerText;

  String? get xNome => node.findAllElements('xNome').singleOrNull?.innerText;

  EnderDest? get enderDest {
    var n = node.findAllElements('enderDest').singleOrNull;
    if (n != null) return EnderDest(n);
    return null;
  }

  String? get indIEDest => node.findAllElements('indIEDest').singleOrNull?.innerText;

  String? get ie => node.findAllElements('IE').singleOrNull?.innerText;
}

class EnderDest {
  final XmlNode node;

  EnderDest(this.node);

  String get xLgr {
    return node.findAllElements('xLgr').singleOrNull?.innerText ?? "";
  }

  set xLgr(String? value) {
    node.findAllElements('xLgr').singleOrNull?.innerText = value ?? "";
  }

  String get nro {
    return node.findAllElements('nro').singleOrNull?.innerText ?? "";
  }

  set nro(String? value) {
    node.findAllElements('nro').singleOrNull?.innerText = value ?? "";
  }

  String get xBairro {
    return node.findAllElements('xBairro').singleOrNull?.innerText ?? "";
  }

  set xBairro(String? value) {
    node.findAllElements('xBairro').singleOrNull?.innerText = value ?? "";
  }

  String get cMun {
    return node.findAllElements('cMun').singleOrNull?.innerText ?? "";
  }

  set cMun(String? value) {
    node.findAllElements('cMun').singleOrNull?.innerText = value ?? "";
  }

  String get xMun {
    return node.findAllElements('xMun').singleOrNull?.innerText ?? "";
  }

  set xMun(String? value) {
    node.findAllElements('xMun').singleOrNull?.innerText = value ?? "";
  }

  String get uf {
    return node.findAllElements('UF').singleOrNull?.innerText ?? "";
  }

  set uf(String? value) {
    node.findAllElements('UF').singleOrNull?.innerText = value ?? "";
  }

  String get cep {
    return node.findAllElements('CEP').singleOrNull?.innerText ?? "";
  }

  set cep(String? value) {
    node.findAllElements('CEP').singleOrNull?.innerText = value ?? "";
  }

  String get cPais {
    return node.findAllElements('cPais').singleOrNull?.innerText ?? "";
  }

  set cPais(String? value) {
    node.findAllElements('cPais').singleOrNull?.innerText = value ?? "";
  }

  String get xPais {
    return node.findAllElements('xPais').singleOrNull?.innerText ?? "";
  }

  set xPais(String? value) {
    node.findAllElements('xPais').singleOrNull?.innerText = value ?? "";
  }

  String get fone {
    return node.findAllElements('fone').singleOrNull?.innerText ?? "";
  }

  set fone(String? value) {
    node.findAllElements('fone').singleOrNull?.innerText = value ?? "";
  }
}

class Det {
  final XmlNode node;

  Det(this.node);

  String? get nItem => node.getAttribute('nItem') ?? "";

  Prod? get prod {
    var n = node.findAllElements('prod').singleOrNull;
    if (n != null) return Prod(n);
    return null;
  }

  Imposto? get imposto {
    var n = node.findAllElements('imposto').singleOrNull;
    if (n != null) return Imposto(n);
    return null;
  }
}

class Prod {
  final XmlNode node;

  Prod(this.node);

  double get valorProduto => vProd.toDouble ?? 0.0;

  String get cProd {
    return node.findAllElements('cProd').singleOrNull?.innerText ?? "";
  }

  set cProd(String? value) {
    node.findAllElements('cProd').singleOrNull?.innerText = value ?? "";
  }

  String get cEAN {
    return node.findAllElements('cEAN').singleOrNull?.innerText ?? "";
  }

  set cEAN(String? value) {
    node.findAllElements('cEAN').singleOrNull?.innerText = value ?? "";
  }

  String get xProd {
    return node.findAllElements('xProd').singleOrNull?.innerText ?? "";
  }

  set xProd(String? value) {
    node.findAllElements('xProd').singleOrNull?.innerText = value ?? "";
  }

  String get nCM {
    return node.findAllElements('NCM').singleOrNull?.innerText ?? "";
  }

  set nCM(String? value) {
    node.findAllElements('NCM').singleOrNull?.innerText = value ?? "";
  }

  String get cFOP {
    return node.findAllElements('CFOP').singleOrNull?.innerText ?? "";
  }

  set cFOP(String? value) {
    node.findAllElements('CFOP').singleOrNull?.innerText = value ?? "";
  }

  String get uCom {
    return node.findAllElements('uCom').singleOrNull?.innerText ?? "";
  }

  set uCom(String? value) {
    node.findAllElements('uCom').singleOrNull?.innerText = value ?? "";
  }

  String get qCom {
    return node.findAllElements('qCom').singleOrNull?.innerText ?? "";
  }

  set qCom(String? value) {
    node.findAllElements('qCom').singleOrNull?.innerText = value ?? "";
  }

  String get vUnCom {
    return node.findAllElements('vUnCom').singleOrNull?.innerText ?? "";
  }

  set vUnCom(String? value) {
    node.findAllElements('vUnCom').singleOrNull?.innerText = value ?? "";
  }

  String get vProd {
    return node.findAllElements('vProd').singleOrNull?.innerText ?? "";
  }

  set vProd(String? value) {
    node.findAllElements('vProd').singleOrNull?.innerText = value ?? "";
  }

  String get cEANTrib {
    return node.findAllElements('cEANTrib').singleOrNull?.innerText ?? "";
  }

  set cEANTrib(String? value) {
    node.findAllElements('cEANTrib').singleOrNull?.innerText = value ?? "";
  }

  String get uTrib {
    return node.findAllElements('uTrib').singleOrNull?.innerText ?? "";
  }

  set uTrib(String? value) {
    node.findAllElements('uTrib').singleOrNull?.innerText = value ?? "";
  }

  String get qTrib {
    return node.findAllElements('qTrib').singleOrNull?.innerText ?? "";
  }

  set qTrib(String? value) {
    node.findAllElements('qTrib').singleOrNull?.innerText = value ?? "";
  }

  String get vUnTrib {
    return node.findAllElements('vUnTrib').singleOrNull?.innerText ?? "";
  }

  set vUnTrib(String? value) {
    node.findAllElements('vUnTrib').singleOrNull?.innerText = value ?? "";
  }

  String get indTot {
    return node.findAllElements('indTot').singleOrNull?.innerText ?? "";
  }

  set indTot(String? value) {
    node.findAllElements('indTot').singleOrNull?.innerText = value ?? "";
  }
}

class Imposto {
  final XmlNode node;

  Imposto(this.node);

  ICMS? get icms {
    var n = node.findAllElements('ICMS').singleOrNull;
    if (n != null) return ICMS(n);
    return null;
  }

  PIS? get pis {
    var n = node.findAllElements('PIS').singleOrNull;
    if (n != null) return PIS(n);
    return null;
  }

  COFINS? get cofins {
    var n = node.findAllElements('COFINS').singleOrNull;
    if (n != null) return COFINS(n);
    return null;
  }
}

class ICMS {
  final XmlNode node;

  ICMS(this.node);

  ICMS00? get icms00 {
    var n = node.findAllElements('ICMS00').singleOrNull;
    if (n != null) return ICMS00(n);
    return null;
  }
}

class ICMS00 {
  final XmlNode node;

  ICMS00(this.node);

  String get orig {
    return node.findAllElements('orig').singleOrNull?.innerText ?? "";
  }

  set orig(String value) {
    node.findAllElements('orig').singleOrNull?.innerText = value;
  }

  String get cST {
    return node.findAllElements('CST').singleOrNull?.innerText ?? "";
  }

  set cST(String value) {
    node.findAllElements('CST').singleOrNull?.innerText = value;
  }

  String get modBC {
    return node.findAllElements('modBC').singleOrNull?.innerText ?? "";
  }

  set modBC(String value) {
    node.findAllElements('modBC').singleOrNull?.innerText = value;
  }

  String get vBC {
    return node.findAllElements('vBC').singleOrNull?.innerText ?? "";
  }

  set vBC(String value) {
    node.findAllElements('vBC').singleOrNull?.innerText = value;
  }

  String get pICMS {
    return node.findAllElements('pICMS').singleOrNull?.innerText ?? "";
  }

  set pICMS(String value) {
    node.findAllElements('pICMS').singleOrNull?.innerText = value;
  }

  String get vICMS {
    return node.findAllElements('vICMS').singleOrNull?.innerText ?? "";
  }

  set vICMS(String value) {
    node.findAllElements('vICMS').singleOrNull?.innerText = value;
  }
}

class PIS {
  final XmlNode node;

  PIS(this.node);

  PISNT? get pisnt {
    var n = node.findAllElements('PISNT').singleOrNull;
    if (n != null) return PISNT(n);
    return null;
  }
}

class PISNT {
  final XmlNode node;

  PISNT(this.node);

  String get cST {
    return node.findAllElements('CST').singleOrNull?.innerText ?? "";
  }

  set cST(String? value) {
    node.findAllElements('CST').singleOrNull?.innerText = value ?? "";
  }
}

class COFINS {
  final XmlNode node;

  COFINS(this.node);

  COFINSNT? get cofinsnt {
    var n = node.findAllElements('COFINSNT').singleOrNull;
    if (n != null) return COFINSNT(n);
    return null;
  }
}

class COFINSNT {
  final XmlNode node;

  COFINSNT(this.node);

  String get cST {
    return node.findAllElements('CST').singleOrNull?.innerText ?? "";
  }

  set cST(String? value) {
    node.findAllElements('CST').singleOrNull?.innerText = value ?? "";
  }
}

class Total {
  final XmlNode node;

  Total(this.node);

  ICMSTot? get icmsTot {
    var n = node.findAllElements('ICMSTot').singleOrNull;
    if (n != null) return ICMSTot(n);
    return null;
  }
}

class ICMSTot {
  final XmlNode node;

  ICMSTot(this.node);

  String get vBC {
    return node.findAllElements('vBC').singleOrNull?.innerText ?? "";
  }

  set vBC(String? value) {
    node.findAllElements('vBC').singleOrNull?.innerText = value ?? "";
  }

  String get vICMS {
    return node.findAllElements('vICMS').singleOrNull?.innerText ?? "";
  }

  set vICMS(String? value) {
    node.findAllElements('vICMS').singleOrNull?.innerText = value ?? "";
  }

  String get vICMSDeson {
    return node.findAllElements('vICMSDeson').singleOrNull?.innerText ?? "";
  }

  set vICMSDeson(String? value) {
    node.findAllElements('vICMSDeson').singleOrNull?.innerText = value ?? "";
  }

  String get vFCP {
    return node.findAllElements('vFCP').singleOrNull?.innerText ?? "";
  }

  set vFCP(String? value) {
    node.findAllElements('vFCP').singleOrNull?.innerText = value ?? "";
  }

  String get vBCST {
    return node.findAllElements('vBCST').singleOrNull?.innerText ?? "";
  }

  set vBCST(String? value) {
    node.findAllElements('vBCST').singleOrNull?.innerText = value ?? "";
  }

  String get vST {
    return node.findAllElements('vST').singleOrNull?.innerText ?? "";
  }

  set vST(String? value) {
    node.findAllElements('vST').singleOrNull?.innerText = value ?? "";
  }

  String get vFCPST {
    return node.findAllElements('vFCPST').singleOrNull?.innerText ?? "";
  }

  set vFCPST(String? value) {
    node.findAllElements('vFCPST').singleOrNull?.innerText = value ?? "";
  }

  String get vFCPSTRet {
    return node.findAllElements('vFCPSTRet').singleOrNull?.innerText ?? "";
  }

  set vFCPSTRet(String? value) {
    node.findAllElements('vFCPSTRet').singleOrNull?.innerText = value ?? "";
  }

  String get vProd {
    return node.findAllElements('vProd').singleOrNull?.innerText ?? "";
  }

  set vProd(String? value) {
    node.findAllElements('vProd').singleOrNull?.innerText = value ?? "";
  }

  String get vFrete {
    return node.findAllElements('vFrete').singleOrNull?.innerText ?? "";
  }

  set vFrete(String? value) {
    node.findAllElements('vFrete').singleOrNull?.innerText = value ?? "";
  }

  String get vSeg {
    return node.findAllElements('vSeg').singleOrNull?.innerText ?? "";
  }

  set vSeg(String? value) {
    node.findAllElements('vSeg').singleOrNull?.innerText = value ?? "";
  }

  String get vDesc {
    return node.findAllElements('vDesc').singleOrNull?.innerText ?? "";
  }

  set vDesc(String? value) {
    node.findAllElements('vDesc').singleOrNull?.innerText = value ?? "";
  }

  String get vII {
    return node.findAllElements('vII').singleOrNull?.innerText ?? "";
  }

  set vII(String? value) {
    node.findAllElements('vII').singleOrNull?.innerText = value ?? "";
  }

  String get vIPI {
    return node.findAllElements('vIPI').singleOrNull?.innerText ?? "";
  }

  set vIPI(String? value) {
    node.findAllElements('vIPI').singleOrNull?.innerText = value ?? "";
  }

  String get vIPIDevol {
    return node.findAllElements('vIPIDevol').singleOrNull?.innerText ?? "";
  }

  set vIPIDevol(String? value) {
    node.findAllElements('vIPIDevol').singleOrNull?.innerText = value ?? "";
  }

  String get vPIS {
    return node.findAllElements('vPIS').singleOrNull?.innerText ?? "";
  }

  set vPIS(String? value) {
    node.findAllElements('vPIS').singleOrNull?.innerText = value ?? "";
  }

  String get vCOFINS {
    return node.findAllElements('vCOFINS').singleOrNull?.innerText ?? "";
  }

  set vCOFINS(String? value) {
    node.findAllElements('vCOFINS').singleOrNull?.innerText = value ?? "";
  }

  String get vOutro {
    return node.findAllElements('vOutro').singleOrNull?.innerText ?? "";
  }

  set vOutro(String? value) {
    node.findAllElements('vOutro').singleOrNull?.innerText = value ?? "";
  }

  String get vNF {
    return node.findAllElements('vNF').singleOrNull?.innerText ?? "";
  }

  set vNF(String? value) {
    node.findAllElements('vNF').singleOrNull?.innerText = value ?? "";
  }
}

class Transp {
  final XmlNode node;

  Transp(this.node);

  String get modFrete {
    return node.findAllElements('modFrete').singleOrNull?.innerText ?? "";
  }

  set modFrete(String? value) {
    node.findAllElements('modFrete').singleOrNull?.innerText = value ?? "";
  }
}

class Cobr {
  final XmlNode node;

  Cobr(this.node);

  Fat? get fat {
    var n = node.findAllElements('fat').singleOrNull;
    if (n != null) return Fat(n);
    return null;
  }

  Iterable<Dup> get dup => node.findAllElements('dup').map((element) => Dup(element));
}

class Fat {
  final XmlNode node;

  Fat(this.node);

  String get nFat {
    return node.findAllElements('nFat').singleOrNull?.innerText ?? "";
  }

  set nFat(String? value) {
    node.findAllElements('nFat').singleOrNull?.innerText = value ?? "";
  }

  String get vOrig {
    return node.findAllElements('vOrig').singleOrNull?.innerText ?? "";
  }

  set vOrig(String? value) {
    node.findAllElements('vOrig').singleOrNull?.innerText = value ?? "";
  }

  String get vDesc {
    return node.findAllElements('vDesc').singleOrNull?.innerText ?? "";
  }

  set vDesc(String? value) {
    node.findAllElements('vDesc').singleOrNull?.innerText = value ?? "";
  }

  String get vLiq {
    return node.findAllElements('vLiq').singleOrNull?.innerText ?? "";
  }

  set vLiq(String? value) {
    node.findAllElements('vLiq').singleOrNull?.innerText = value ?? "";
  }
}

class Dup {
  final XmlNode node;

  Dup(this.node);

  String get nDup {
    return node.findAllElements('nDup').singleOrNull?.innerText ?? "";
  }

  set nDup(String? value) {
    node.findAllElements('nDup').singleOrNull?.innerText = value ?? "";
  }

  String get dVenc {
    return node.findAllElements('dVenc').singleOrNull?.innerText ?? "";
  }

  set dVenc(String? value) {
    node.findAllElements('dVenc').singleOrNull?.innerText = value ?? "";
  }

  String get vDup {
    return node.findAllElements('vDup').singleOrNull?.innerText ?? "";
  }

  set vDup(String? value) {
    node.findAllElements('vDup').singleOrNull?.innerText = value ?? "";
  }
}

class Pag {
  final XmlNode node;

  Pag(this.node);

  Map<string, List<double>> get pagamentos => detPag.groupAndRemapValuesBy((e) => e.formaPagamento, (x) => x.vPag.toDouble ?? 0.0);

  static Map<String, dynamic> get formasPagamento => {
        "01": "Dinheiro",
        "02": "Cheque",
        "03": "Cartao de Credito",
        "04": "Cartao de Debito",
        "05": "Credito Loja",
        "10": "Vale Alimentacao",
        "11": "Vale Refeicao",
        "12": "Vale Presente",
        "13": "Vale Combustivel",
        "14": "Duplicata Mercantil",
        "15": "Boleto Bancario",
        "16": "Depósito Bancário",
        "17": "PIX",
        "18": "Transferência bancária, Carteira Digital",
        "19": "Cashback, Cartão Fidelidade",
        "90": "Sem Pagamento",
        "99": "Outros",
      };

  Iterable<DetPag> get detPag => node.findAllElements('detPag').map((element) => DetPag(element));
}

class DetPag {
  final XmlNode node;

  DetPag(this.node);

  double get valorPago => vPag.toDouble ?? 0.0;

  string get formaPagamento => Pag.formasPagamento[tPag] ?? "Outros";

  String get indPag {
    return node.findAllElements('indPag').singleOrNull?.innerText ?? "";
  }

  set indPag(String? value) {
    node.findAllElements('indPag').singleOrNull?.innerText = value ?? "";
  }

  String get tPag {
    return node.findAllElements('tPag').singleOrNull?.innerText ?? "";
  }

  set tPag(String? value) {
    node.findAllElements('tPag').singleOrNull?.innerText = value ?? "";
  }

  String get vPag {
    return node.findAllElements('vPag').singleOrNull?.innerText ?? "";
  }

  set vPag(String? value) {
    node.findAllElements('vPag').singleOrNull?.innerText = value ?? "";
  }
}

class ProtNFe {
  final XmlNode node;

  ProtNFe(this.node);

  InfProt? get infProt {
    var n = node.findAllElements('infProt').singleOrNull;
    if (n != null) return InfProt(n);
    return null;
  }
}

class InfProt {
  final XmlNode node;

  InfProt(this.node);

  date? get dataRecebimento => dhRecbto.toDate();

  String get tpAmb {
    return node.findAllElements('tpAmb').singleOrNull?.innerText ?? "";
  }

  set tpAmb(String value) {
    node.findAllElements('tpAmb').singleOrNull?.innerText = value;
  }

  String get verAplic {
    return node.findAllElements('verAplic').singleOrNull?.innerText ?? "";
  }

  set verAplic(String value) {
    node.findAllElements('verAplic').singleOrNull?.innerText = value;
  }

  String get chNFe {
    return node.findAllElements('chNFe').singleOrNull?.innerText ?? "";
  }

  set chNFe(String value) {
    node.findAllElements('chNFe').singleOrNull?.innerText = value;
  }

  String get dhRecbto {
    return node.findAllElements('dhRecbto').singleOrNull?.innerText ?? "";
  }

  set dhRecbto(String value) {
    node.findAllElements('dhRecbto').singleOrNull?.innerText = value;
  }

  String get nProt {
    return node.findAllElements('nProt').singleOrNull?.innerText ?? "";
  }

  set nProt(String value) {
    node.findAllElements('nProt').singleOrNull?.innerText = value;
  }

  String get digVal {
    return node.findAllElements('digVal').singleOrNull?.innerText ?? "";
  }

  set digVal(String value) {
    node.findAllElements('digVal').singleOrNull?.innerText = value;
  }

  String get cStat {
    return node.findAllElements('cStat').singleOrNull?.innerText ?? "";
  }

  set cStat(String value) {
    node.findAllElements('cStat').singleOrNull?.innerText = value;
  }

  String get xMotivo {
    return node.findAllElements('xMotivo').singleOrNull?.innerText ?? "";
  }

  set xMotivo(String value) {
    node.findAllElements('xMotivo').singleOrNull?.innerText = value;
  }
}

class InfAdic {
  final XmlNode node;

  InfAdic(this.node);

  String get infCpl {
    return node.findAllElements('infCpl').singleOrNull?.innerText ?? "";
  }

  set infCpl(String value) {
    final element = node.findAllElements('infCpl').singleOrNull;
    if (element == null) {
      // Se o elemento não existir, cria um novo com o valor fornecido
      final newNode = XmlElement(XmlName('infCpl'));
      newNode.innerText = value;
      node.children.add(newNode);
    } else {
      element.innerText = value;
    }
  }
}
