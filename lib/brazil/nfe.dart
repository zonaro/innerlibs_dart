import 'package:innerlibs/innerlibs.dart';
import 'package:xml/xml.dart';

class NFeProc extends _Nodeable {
  NFeProc(XmlDocument document) : super(document);

  NFeProc.fromXmlString(String xml) : this(XmlDocument.parse(xml));

  NFe? get nfe => getTagAs<NFe>(node, 'NFe');
  set nfe(NFe? value) => setTagFrom(node, 'NFe', value);

  string get versao => nfe?.node.getAttribute('versao') ?? "";
  string get id => nfe?.node.getAttribute('Id') ?? "";

  ProtNFe? get protNFe => getTagAs<ProtNFe>(node, 'protNFe');
  set protNFe(ProtNFe? value) => setTagFrom(node, 'protNFe', value);

  ChaveNFe? get chaveNota => id.onlyNumbers.isNumber ? ChaveNFe.fromString(id.onlyNumbers) : null;

  Map<string, List<double>> get pagamentos => nfe?.pag?.pagamentos ?? {};

  InfAdic? get infAdic => getTagAs<InfAdic>(node, 'infAdic');
  set infAdic(InfAdic? value) => setTagFrom(node, 'infAdic', value);

  Uri? get uriNFCe {
    var chave = chaveNota;
    if (chave != null) {
      return gerarUriNFCe(
        chNFe: chave.chave,
        nVersao: versao,
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
    return Uri.http(
      'www.homologacao.nfce.fazenda.sp.gov.br',
      '/NFCeConsultaPublica/Paginas/ConsultaQRCode.aspx',
      {
        'chNFe': chNFe,
        'nVersao': nVersao,
        'tpAmb': tpAmb,
        'dhEmi': dhEmi,
        'vNF': vNF,
        'vICMS': vICMS,
        'digVal': digVal,
        'cIdToken': cIdToken,
        'cHashQRCode': cHashQRCode,
      },
    );
  }

  @override
  String toString() => node.outerXml;
}

class NFe extends _Nodeable {
  NFe(super.node);

  double get valorTotal => total?.icmsTot?.vNF.toDouble ?? 0;
  double get desconto => total?.icmsTot?.vDesc.toDouble ?? 0;
  double get totalPago => detPag.sum((x) => x.valorPago);

  Ide? get ide => getTagAs(node, 'ide');

  Emit? get emit => getTagAs(node, 'emit');

  Dest? get dest => getTagAs(node, 'dest');

  Iterable<Det> get det => node.findAllElements('det').map((element) => Det(element));

  Iterable<DetPag> get detPag => pag?.detPag ?? [];

  Total? get total => getTagAs<Total>(node, 'total');

  Transp? get transp => getTagAs(node, "transp");

  Cobr? get cobr => getTagAs(node, "cobr");

  Pag? get pag => getTagAs(node, "pag");
}

class Ide extends _Nodeable {
  Ide(super.node);

  String get cDV => getTextValueFromNode(node, 'cDV');
  set cDV(String? value) => setTextValueForNode(node, 'cDV', value);

  String get cMunFG => getTextValueFromNode(node, 'cMunFG');
  set cMunFG(String? value) => setTextValueForNode(node, 'cMunFG', value);

  String get cNF => getTextValueFromNode(node, 'cNF');
  set cNF(String? value) => setTextValueForNode(node, 'cNF', value);

  String get cUF => getTextValueFromNode(node, 'cUF');
  set cUF(String? value) => setTextValueForNode(node, 'cUF', value);

  String get dhEmi => getTextValueFromNode(node, 'dhEmi');
  set dhEmi(String? value) => setTextValueForNode(node, 'dhEmi', value);

  String get finNFe => getTextValueFromNode(node, 'finNFe');
  set finNFe(String? value) => setTextValueForNode(node, 'finNFe', value);

  String get idDest => getTextValueFromNode(node, 'idDest');
  set idDest(String? value) => setTextValueForNode(node, 'idDest', value);

  String get indFinal => getTextValueFromNode(node, 'indFinal');
  set indFinal(String? value) => setTextValueForNode(node, 'indFinal', value);

  String get indIntermed => getTextValueFromNode(node, 'indIntermed');
  set indIntermed(String? value) => setTextValueForNode(node, 'indIntermed', value);

  String get indPres => getTextValueFromNode(node, 'indPres');
  set indPres(String? value) => setTextValueForNode(node, 'indPres', value);

  String get mod => getTextValueFromNode(node, 'mod');
  set mod(String? value) => setTextValueForNode(node, 'mod', value);

  String get nNF => getTextValueFromNode(node, 'nNF');
  set nNF(String? value) => setTextValueForNode(node, 'nNF', value);

  String get natOp => getTextValueFromNode(node, 'natOp');
  set natOp(String? value) => setTextValueForNode(node, 'natOp', value);

  String get procEmi => getTextValueFromNode(node, 'procEmi');
  set procEmi(String? value) => setTextValueForNode(node, 'procEmi', value);

  String get serie => getTextValueFromNode(node, 'serie');
  set serie(String? value) => setTextValueForNode(node, 'serie', value);

  String get tpAmb => getTextValueFromNode(node, 'tpAmb');
  set tpAmb(String? value) => setTextValueForNode(node, 'tpAmb', value);

  String get tpEmis => getTextValueFromNode(node, 'tpEmis');
  set tpEmis(String? value) => setTextValueForNode(node, 'tpEmis', value);

  String get tpImp => getTextValueFromNode(node, 'tpImp');
  set tpImp(String? value) => setTextValueForNode(node, 'tpImp', value);

  String get tpNF => getTextValueFromNode(node, 'tpNF');
  set tpNF(String? value) => setTextValueForNode(node, 'tpNF', value);

  String get verProc => getTextValueFromNode(node, 'verProc');
  set verProc(String? value) => setTextValueForNode(node, 'verProc', value);
}

class Emit extends _Nodeable {
  Emit(super.node);

  EnderEmit? get enderEmit => getTagAs(node, "enderEmit");

  String get cnpj => getTextValueFromNode(node, 'CNPJ');
  set cnpj(String? value) => setTextValueForNode(node, 'CNPJ', value);

  String get xNome => getTextValueFromNode(node, 'xNome');
  set xNome(String? value) => setTextValueForNode(node, 'xNome', value);

  String get xFant => getTextValueFromNode(node, 'xFant');
  set xFant(String? value) => setTextValueForNode(node, 'xFant', value);

  String get ie => getTextValueFromNode(node, 'IE');
  set ie(String? value) => setTextValueForNode(node, 'IE', value);

  String get crt => getTextValueFromNode(node, 'CRT');
  set crt(String? value) => setTextValueForNode(node, 'CRT', value);
}

class EnderEmit extends _Nodeable {
  EnderEmit(super.node);
  String get xLgr => getTextValueFromNode(node, 'xLgr');
  set xLgr(String? value) => setTextValueForNode(node, 'xLgr', value);

  String get nro => getTextValueFromNode(node, 'nro');
  set nro(String? value) => setTextValueForNode(node, 'nro', value);

  String get xBairro => getTextValueFromNode(node, 'xBairro');
  set xBairro(String? value) => setTextValueForNode(node, 'xBairro', value);

  String get cMun => getTextValueFromNode(node, 'cMun');
  set cMun(String? value) => setTextValueForNode(node, 'cMun', value);

  String get xMun => getTextValueFromNode(node, 'xMun');
  set xMun(String? value) => setTextValueForNode(node, 'xMun', value);

  String get uf => getTextValueFromNode(node, 'UF');
  set uf(String? value) => setTextValueForNode(node, 'UF', value);

  String get cep => getTextValueFromNode(node, 'CEP');
  set cep(String? value) => setTextValueForNode(node, 'CEP', value);

  String get cPais => getTextValueFromNode(node, 'cPais');
  set cPais(String? value) => setTextValueForNode(node, 'cPais', value);

  String get xPais => getTextValueFromNode(node, 'xPais');
  set xPais(String? value) => setTextValueForNode(node, 'xPais', value);

  String get fone => getTextValueFromNode(node, 'fone');
  set fone(String? value) => setTextValueForNode(node, 'fone', value);
}

class Dest extends _Nodeable {
  Dest(super.node);

  EnderDest? get enderDest => getTagAs(node, 'enderDest');
  set enderDest(EnderDest? value) => setTagFrom(node, 'enderDest', value);

  String get cnpj => getTextValueFromNode(node, 'CNPJ');
  set cpf(String? value) => setTextValueForNode(node, 'CPF', value);

  String get cpf => getTextValueFromNode(node, 'CPF');
  set cnpj(String? value) => setTextValueForNode(node, 'CNPJ', value);

  String get xNome => getTextValueFromNode(node, 'xNome');
  set xNome(String? value) => setTextValueForNode(node, 'xNome', value);

  String get indIEDest => getTextValueFromNode(node, 'indIEDest');
  set indIEDest(String? value) => setTextValueForNode(node, 'indIEDest', value);

  String get ie => getTextValueFromNode(node, 'IE');
  set ie(String? value) => setTextValueForNode(node, 'IE', value);
}

class EnderDest extends _Nodeable {
  EnderDest(super.node);

  String get xLgr => getTextValueFromNode(node, 'xLgr');
  set xLgr(String? value) => setTextValueForNode(node, 'xLgr', value);

  String get nro => getTextValueFromNode(node, 'nro');
  set nro(String? value) => setTextValueForNode(node, 'nro', value);

  String get xBairro => getTextValueFromNode(node, 'xBairro');
  set xBairro(String? value) => setTextValueForNode(node, 'xBairro', value);

  String get cMun => getTextValueFromNode(node, 'cMun');
  set cMun(String? value) => setTextValueForNode(node, 'cMun', value);

  String get xMun => getTextValueFromNode(node, 'xMun');
  set xMun(String? value) => setTextValueForNode(node, 'xMun', value);

  String get uf => getTextValueFromNode(node, 'UF');
  set uf(String? value) => setTextValueForNode(node, 'UF', value);

  String get cep => getTextValueFromNode(node, 'CEP');
  set cep(String? value) => setTextValueForNode(node, 'CEP', value);

  String get cPais => getTextValueFromNode(node, 'cPais');
  set cPais(String? value) => setTextValueForNode(node, 'cPais', value);

  String get xPais => getTextValueFromNode(node, 'xPais');
  set xPais(String? value) => setTextValueForNode(node, 'xPais', value);

  String get fone => getTextValueFromNode(node, 'fone');
  set fone(String? value) => setTextValueForNode(node, 'fone', value);
}

class Det extends _Nodeable {
  Det(super.node);

  String get nItem => node.getAttribute('nItem') ?? "";

  Prod? get prod => getTagAs(node, 'prod');

  Imposto? get imposto => getTagAs(node, 'imposto');
}

class Prod extends _Nodeable {
  Prod(super.node);

  double get valorProduto => vProd.toDouble ?? 0.0;

  String get cProd => getTextValueFromNode(node, 'cProd');
  set cProd(String? value) => setTextValueForNode(node, 'cProd', value);

  String get cEAN => getTextValueFromNode(node, 'cEAN');
  set cEAN(String? value) => setTextValueForNode(node, 'cEAN', value);

  String get xProd => getTextValueFromNode(node, 'xProd');
  set xProd(String? value) => setTextValueForNode(node, 'xProd', value);

  String get nCM => getTextValueFromNode(node, 'NCM');
  set nCM(String? value) => setTextValueForNode(node, 'NCM', value);

  String get cFOP => getTextValueFromNode(node, 'CFOP');
  set cFOP(String? value) => setTextValueForNode(node, 'CFOP', value);

  String get uCom => getTextValueFromNode(node, 'uCom');
  set uCom(String? value) => setTextValueForNode(node, 'uCom', value);

  String get qCom => getTextValueFromNode(node, 'qCom');
  set qCom(String? value) => setTextValueForNode(node, 'qCom', value);

  String get vUnCom => getTextValueFromNode(node, 'vUnCom');
  set vUnCom(String? value) => setTextValueForNode(node, 'vUnCom', value);

  String get vProd => getTextValueFromNode(node, 'vProd');
  set vProd(String? value) => setTextValueForNode(node, 'vProd', value);

  String get cEANTrib => getTextValueFromNode(node, 'cEANTrib');
  set cEANTrib(String? value) => setTextValueForNode(node, 'cEANTrib', value);

  String get uTrib => getTextValueFromNode(node, 'uTrib');
  set uTrib(String? value) => setTextValueForNode(node, 'uTrib', value);

  String get qTrib => getTextValueFromNode(node, 'qTrib');
  set qTrib(String? value) => setTextValueForNode(node, 'qTrib', value);

  String get vUnTrib => getTextValueFromNode(node, 'vUnTrib');
  set vUnTrib(String? value) => setTextValueForNode(node, 'vUnTrib', value);

  String get indTot => getTextValueFromNode(node, 'indTot');
  set indTot(String? value) => setTextValueForNode(node, 'indTot', value);
}

class Imposto extends _Nodeable {
  Imposto(super.node);

  ICMS? get icms => getTagAs<ICMS>(node, 'ICMS');
  set icms(ICMS? value) => setTagFrom<ICMS>(node, 'ICMS', value);

  PIS? get pis => getTagAs<PIS>(node, 'PIS');
  set pis(PIS? value) => setTagFrom<PIS>(node, 'PIS', value);

  COFINS? get cofins => getTagAs<COFINS>(node, 'COFINS');
  set cofins(COFINS? value) => setTagFrom<COFINS>(node, 'COFINS', value);
}

class ICMS extends _Nodeable {
  ICMS(super.node);

  ICMS00? get icms00 => getTagAs<ICMS00>(node, 'ICMS00');
  set icms00(ICMS00? value) => setTagFrom<ICMS00>(node, 'ICMS00', value);
}

class ICMS00 extends _Nodeable {
  ICMS00(super.node);

  String get orig => getTextValueFromNode(node, 'orig');
  set orig(String? value) => setTextValueForNode(node, 'orig', value);

  String get cST => getTextValueFromNode(node, 'CST');
  set cST(String? value) => setTextValueForNode(node, 'CST', value);

  String get modBC => getTextValueFromNode(node, 'modBC');
  set modBC(String? value) => setTextValueForNode(node, 'modBC', value);

  String get vBC => getTextValueFromNode(node, 'vBC');
  set vBC(String? value) => setTextValueForNode(node, 'vBC', value);

  String get pICMS => getTextValueFromNode(node, 'pICMS');
  set pICMS(String? value) => setTextValueForNode(node, 'pICMS', value);

  String get vICMS => getTextValueFromNode(node, 'vICMS');
  set vICMS(String? value) => setTextValueForNode(node, 'vICMS', value);
}

class PIS extends _Nodeable {
  PIS(super.node);

  PISNT? get pisnt {
    var n = node.findAllElements('PISNT').singleOrNull;
    if (n != null) return PISNT(n);
    return null;
  }
}

class PISNT extends _Nodeable {
  PISNT(super.node);

  String get cST => getTextValueFromNode(node, 'CST');
  set cST(String? value) => setTextValueForNode(node, 'CST', value);
}

class COFINS extends _Nodeable {
  COFINS(super.node);

  COFINSNT? get cofinsnt => getTagAs(node, 'COFINSNT');
  set cofinsnt(COFINSNT? value) => setTagFrom<COFINSNT>(node, 'COFINSNT', value);
}

class COFINSNT extends _Nodeable {
  COFINSNT(super.node);

  String get cst => getTextValueFromNode(node, "CST");
  set cst(string? value) => setTextValueForNode(node, "CST", value);
}

class Total extends _Nodeable {
  Total(super.node);

  ICMSTot? get icmsTot => getTagAs<ICMSTot>(node, 'ICMSTot');
}

class ICMSTot extends _Nodeable {
  ICMSTot(super.node);

  String get vBC => getTextValueFromNode(node, 'vBC');
  set vBC(String? value) => setTextValueForNode(node, 'vBC', value);

  String get vICMS => getTextValueFromNode(node, 'vICMS');
  set vICMS(String? value) => setTextValueForNode(node, 'vICMS', value);

  String get vICMSDeson => getTextValueFromNode(node, 'vICMSDeson');
  set vICMSDeson(String? value) => setTextValueForNode(node, 'vICMSDeson', value);

  String get vFCP => getTextValueFromNode(node, 'vFCP');
  set vFCP(String? value) => setTextValueForNode(node, 'vFCP', value);

  String get vBCST => getTextValueFromNode(node, 'vBCST');
  set vBCST(String? value) => setTextValueForNode(node, 'vBCST', value);

  String get vST => getTextValueFromNode(node, 'vST');
  set vST(String? value) => setTextValueForNode(node, 'vST', value ?? "");

  String get vFCPST => getTextValueFromNode(node, 'vFCPST');
  set vFCPST(String? value) => setTextValueForNode(node, 'vFCPST', value ?? "");

  String get vFCPSTRet => getTextValueFromNode(node, 'vFCPSTRet');
  set vFCPSTRet(String? value) => setTextValueForNode(node, 'vFCPSTRet', value ?? "");

  String get vProd => getTextValueFromNode(node, 'vProd');
  set vProd(String? value) => setTextValueForNode(node, 'vProd', value ?? "");

  String get vFrete => getTextValueFromNode(node, 'vFrete');
  set vFrete(String? value) => setTextValueForNode(node, 'vFrete', value ?? "");

  String get vSeg => getTextValueFromNode(node, 'vSeg');
  set vSeg(String? value) => setTextValueForNode(node, 'vSeg', value ?? "");

  String get vDesc => getTextValueFromNode(node, 'vDesc');
  set vDesc(String? value) => setTextValueForNode(node, 'vDesc', value ?? "");

  String get vII => getTextValueFromNode(node, 'vII');
  set vII(String? value) => setTextValueForNode(node, 'vII', value ?? "");

  String get vIPI => getTextValueFromNode(node, 'vIPI');
  set vIPI(String? value) => setTextValueForNode(node, 'vIPI', value ?? "");

  String get vIPIDevol => getTextValueFromNode(node, 'vIPIDevol');
  set vIPIDevol(String? value) => setTextValueForNode(node, 'vIPIDevol', value ?? "");

  String get vPIS => getTextValueFromNode(node, 'vPIS');
  set vPIS(String? value) => setTextValueForNode(node, 'vPIS', value ?? "");

  String get vCOFINS => getTextValueFromNode(node, 'vCOFINS');
  set vCOFINS(String? value) => setTextValueForNode(node, 'vCOFINS', value ?? "");

  String get vOutro => getTextValueFromNode(node, 'vOutro');
  set vOutro(String? value) => setTextValueForNode(node, 'vOutro', value ?? "");

  String get vNF => getTextValueFromNode(node, 'vNF');
  set vNF(String? value) => setTextValueForNode(node, 'vNF', value ?? "");
}

class Transp extends _Nodeable {
  Transp(super.node);

  String get modFrete => getTextValueFromNode(node, 'modFrete');
  set modFrete(String? value) => setTextValueForNode(node, 'modFrete', value);
}

class Cobr extends _Nodeable {
  Cobr(super.node);

  Fat? get fat => getTagAs(node, "fat");

  Iterable<Dup> get dup => node.findAllElements('dup').map((element) => Dup(element));
}

class Fat extends _Nodeable {
  Fat(super.node);

  String get nFat => getTextValueFromNode(node, 'nFat');
  set nFat(String? value) => setTextValueForNode(node, 'nFat', value);

  String get vOrig => getTextValueFromNode(node, 'vOrig');
  set vOrig(String? value) => setTextValueForNode(node, 'vOrig', value);

  String get vDesc => getTextValueFromNode(node, 'vDesc');
  set vDesc(String? value) => setTextValueForNode(node, 'vDesc', value);

  String get vLiq => getTextValueFromNode(node, 'vLiq');
  set vLiq(String? value) => setTextValueForNode(node, 'vLiq', value);
}

class Dup extends _Nodeable {
  Dup(super.node);

  String get nDup => getTextValueFromNode(node, 'nDup');
  set nDup(String? value) => setTextValueForNode(node, 'nDup', value);

  String get dVenc => getTextValueFromNode(node, 'dVenc');
  set dVenc(String? value) => setTextValueForNode(node, 'dVenc', value);

  String get vDup => getTextValueFromNode(node, 'vDup');
  set vDup(String? value) => setTextValueForNode(node, 'vDup', value);
}

class Pag extends _Nodeable {
  Pag(super.node);

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

class DetPag extends _Nodeable {
  DetPag(super.node);

  double get valorPago => vPag.toDouble ?? 0.0;

  String get formaPagamento => Pag.formasPagamento[tPag] ?? "Outros";

  String get indPag => getTextValueFromNode(node, 'indPag');
  set indPag(String? value) => setTextValueForNode(node, 'indPag', value);

  String get tPag => getTextValueFromNode(node, 'tPag');
  set tPag(String? value) => setTextValueForNode(node, 'tPag', value);

  String get vPag => getTextValueFromNode(node, 'vPag');
  set vPag(String? value) => setTextValueForNode(node, 'vPag', value);
}

class ProtNFe extends _Nodeable {
  ProtNFe(super.node);

  InfProt? get infProt => getTagAs(node, 'infProt');
  set infProt(InfProt? value) => setTagFrom(node, "infProt", value);
}

class InfProt extends _Nodeable {
  InfProt(super.node);

  date? get dataRecebimento => dhRecbto.toDate();

  String get tpAmb => getTextValueFromNode(node, 'tpAmb');
  set tpAmb(String? value) => setTextValueForNode(node, 'tpAmb', value);

  String get verAplic => getTextValueFromNode(node, 'verAplic');
  set verAplic(String? value) => setTextValueForNode(node, 'verAplic', value);

  String get chNFe => getTextValueFromNode(node, 'chNFe');
  set chNFe(String? value) => setTextValueForNode(node, 'chNFe', value);

  String get dhRecbto => getTextValueFromNode(node, 'dhRecbto');
  set dhRecbto(String? value) => setTextValueForNode(node, 'dhRecbto', value);

  String get nProt => getTextValueFromNode(node, 'nProt');
  set nProt(String? value) => setTextValueForNode(node, 'nProt', value);

  String get digVal => getTextValueFromNode(node, 'digVal');
  set digVal(String? value) => setTextValueForNode(node, 'digVal', value);

  String get cStat => getTextValueFromNode(node, 'cStat');
  set cStat(String? value) => setTextValueForNode(node, 'cStat', value);

  String get xMotivo => getTextValueFromNode(node, 'xMotivo');
  set xMotivo(String? value) => setTextValueForNode(node, 'xMotivo', value);
}

class InfAdic extends _Nodeable {
  InfAdic(super.node);

  String get infCpl => getTextValueFromNode(node, "infCpl");
  set infCpl(String? value) => setTextValueForNode(node, "infCpl", value);
}

class _Nodeable {
  XmlNode node;
  _Nodeable(this.node);

  /// return the text value from specific child node
  string getTextValueFromNode(XmlNode node, String tag) => node.findAllElements(tag).singleOrNull?.innerText ?? "";

  /// set  the text value for specific child node. if tag wont exist, it will be created. if value is null, the node will be removed if exists
  void setTextValueForNode(XmlNode node, string tag, string? value) {
    final element = node.findAllElements(tag).singleOrNull;
    if (value == null) {
      if (element != null) {
        element.remove();
      }
    } else {
      if (element == null) {
        // Se o elemento não existir, cria um novo com o valor fornecido
        final newNode = XmlElement(XmlName(tag));
        newNode.innerText = value;
        node.children.add(newNode);
      } else {
        element.innerText = value;
      }
    }
  }

// do dat shit
  T? getTagAs<T extends _Nodeable>(XmlNode node, String tag) {
    var n = node.findAllElements(tag).singleOrNull;
    if (n != null) return n as T;
    return null;
  }

  void setTagFrom<T extends _Nodeable>(XmlNode node, String tag, T? value) {
    var n = node.findAllElements(tag).singleOrNull;
    if (value != null) {
      if (n == null) {
        final newNode = XmlElement(XmlName(tag));
        newNode.children.add(value.node);
        node.children.add(newNode);
      } else {
        n.children.clear();
        n.children.add(value.node);
      }
    } else {
      if (n != null) {
        n.remove();
      }
    }
  }
}
