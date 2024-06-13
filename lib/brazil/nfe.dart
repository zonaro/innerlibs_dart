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

  @override
  String toString() => document.outerXml;
}

class NFe {
  final XmlNode node;

  NFe(this.node);

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

  String? get xLgr => node.findAllElements('xLgr').singleOrNull?.innerText;

  String? get nro => node.findAllElements('nro').singleOrNull?.innerText;

  String? get xBairro => node.findAllElements('xBairro').singleOrNull?.innerText;

  String? get cMun => node.findAllElements('cMun').singleOrNull?.innerText;

  String? get xMun => node.findAllElements('xMun').singleOrNull?.innerText;

  String? get uf => node.findAllElements('UF').singleOrNull?.innerText;

  String? get cep => node.findAllElements('CEP').singleOrNull?.innerText;

  String? get cPais => node.findAllElements('cPais').singleOrNull?.innerText;

  String? get xPais => node.findAllElements('xPais').singleOrNull?.innerText;

  String? get fone => node.findAllElements('fone').singleOrNull?.innerText;
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

  String? get xLgr => node.findAllElements('xLgr').singleOrNull?.innerText;

  String? get nro => node.findAllElements('nro').singleOrNull?.innerText;

  String? get xBairro => node.findAllElements('xBairro').singleOrNull?.innerText;

  String? get cMun => node.findAllElements('cMun').singleOrNull?.innerText;

  String? get xMun => node.findAllElements('xMun').singleOrNull?.innerText;

  String? get uf => node.findAllElements('UF').singleOrNull?.innerText;

  String? get cep => node.findAllElements('CEP').singleOrNull?.innerText;

  String? get cPais => node.findAllElements('cPais').singleOrNull?.innerText;

  String? get xPais => node.findAllElements('xPais').singleOrNull?.innerText;

  String? get fone => node.findAllElements('fone').singleOrNull?.innerText;
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

  String? get cProd => node.findAllElements('cProd').singleOrNull?.innerText;

  String? get cEAN => node.findAllElements('cEAN').singleOrNull?.innerText;

  String? get xProd => node.findAllElements('xProd').singleOrNull?.innerText;

  String? get nCM => node.findAllElements('NCM').singleOrNull?.innerText;

  String? get cFOP => node.findAllElements('CFOP').singleOrNull?.innerText;

  String? get uCom => node.findAllElements('uCom').singleOrNull?.innerText;

  String? get qCom => node.findAllElements('qCom').singleOrNull?.innerText;

  String? get vUnCom => node.findAllElements('vUnCom').singleOrNull?.innerText;

  String? get vProd => node.findAllElements('vProd').singleOrNull?.innerText;

  String? get cEANTrib => node.findAllElements('cEANTrib').singleOrNull?.innerText;

  String? get uTrib => node.findAllElements('uTrib').singleOrNull?.innerText;

  String? get qTrib => node.findAllElements('qTrib').singleOrNull?.innerText;

  String? get vUnTrib => node.findAllElements('vUnTrib').singleOrNull?.innerText;

  String? get indTot => node.findAllElements('indTot').singleOrNull?.innerText;
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

  String? get orig => node.findAllElements('orig').singleOrNull?.innerText;

  String? get cST => node.findAllElements('CST').singleOrNull?.innerText;

  String? get modBC => node.findAllElements('modBC').singleOrNull?.innerText;

  String? get vBC => node.findAllElements('vBC').singleOrNull?.innerText;

  String? get pICMS => node.findAllElements('pICMS').singleOrNull?.innerText;

  String? get vICMS => node.findAllElements('vICMS').singleOrNull?.innerText;
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

  String? get cST => node.findAllElements('CST').singleOrNull?.innerText;
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

  String? get cST => node.findAllElements('CST').singleOrNull?.innerText;
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

  String? get vBC => node.findAllElements('vBC').singleOrNull?.innerText;

  String? get vICMS => node.findAllElements('vICMS').singleOrNull?.innerText;

  String? get vICMSDeson => node.findAllElements('vICMSDeson').singleOrNull?.innerText;

  String? get vFCP => node.findAllElements('vFCP').singleOrNull?.innerText;

  String? get vBCST => node.findAllElements('vBCST').singleOrNull?.innerText;

  String? get vST => node.findAllElements('vST').singleOrNull?.innerText;

  String? get vFCPST => node.findAllElements('vFCPST').singleOrNull?.innerText;

  String? get vFCPSTRet => node.findAllElements('vFCPSTRet').singleOrNull?.innerText;

  String? get vProd => node.findAllElements('vProd').singleOrNull?.innerText;

  String? get vFrete => node.findAllElements('vFrete').singleOrNull?.innerText;

  String? get vSeg => node.findAllElements('vSeg').singleOrNull?.innerText;

  String? get vDesc => node.findAllElements('vDesc').singleOrNull?.innerText;

  String? get vII => node.findAllElements('vII').singleOrNull?.innerText;

  String? get vIPI => node.findAllElements('vIPI').singleOrNull?.innerText;

  String? get vIPIDevol => node.findAllElements('vIPIDevol').singleOrNull?.innerText;

  String? get vPIS => node.findAllElements('vPIS').singleOrNull?.innerText;

  String? get vCOFINS => node.findAllElements('vCOFINS').singleOrNull?.innerText;

  String? get vOutro => node.findAllElements('vOutro').singleOrNull?.innerText;

  String? get vNF => node.findAllElements('vNF').singleOrNull?.innerText;
}

class Transp {
  final XmlNode node;

  Transp(this.node);

  String? get modFrete => node.findAllElements('modFrete').singleOrNull?.innerText;
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

  String? get nFat => node.findAllElements('nFat').singleOrNull?.innerText;

  String? get vOrig => node.findAllElements('vOrig').singleOrNull?.innerText;

  String? get vDesc => node.findAllElements('vDesc').singleOrNull?.innerText;

  String? get vLiq => node.findAllElements('vLiq').singleOrNull?.innerText;
}

class Dup {
  final XmlNode node;

  Dup(this.node);

  String? get nDup => node.findAllElements('nDup').singleOrNull?.innerText;

  String? get dVenc => node.findAllElements('dVenc').singleOrNull?.innerText;

  String? get vDup => node.findAllElements('vDup').singleOrNull?.innerText;
}

class Pag {
  final XmlNode node;

  Pag(this.node);

  DetPag? get detPag {
    var n = node.findAllElements('detPag').singleOrNull;
    if (n != null) return DetPag(n);
    return null;
  }
}

class DetPag {
  final XmlNode node;

  DetPag(this.node);

  String? get indPag => node.findAllElements('indPag').singleOrNull?.innerText;

  String? get tPag => node.findAllElements('tPag').singleOrNull?.innerText;

  String? get vPag => node.findAllElements('vPag').singleOrNull?.innerText;
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

  String? get tpAmb => node.findAllElements('tpAmb').singleOrNull?.innerText;

  String? get verAplic => node.findAllElements('verAplic').singleOrNull?.innerText;

  String? get chNFe => node.findAllElements('chNFe').singleOrNull?.innerText;

  String? get dhRecbto => node.findAllElements('dhRecbto').singleOrNull?.innerText;

  String? get nProt => node.findAllElements('nProt').singleOrNull?.innerText;

  String? get digVal => node.findAllElements('digVal').singleOrNull?.innerText;

  String? get cStat => node.findAllElements('cStat').singleOrNull?.innerText;

  String? get xMotivo => node.findAllElements('xMotivo').singleOrNull?.innerText;
}
