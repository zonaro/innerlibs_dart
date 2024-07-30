import 'dart:io';

import 'package:flutter/services.dart';
 
import 'package:innerlibs/innerlibs.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<File> salvarPDF(Uint8List pdf, string diretorio, string chave) async {
  await Directory(diretorio).create(recursive: true);
  final file = File('$diretorio\\Cupom-$chave.pdf');
  try {
    await file.writeAsBytes(pdf);
  } catch (e) {
    consoleLog("$e");
  }
  return file;
}

Future<Uint8List> gerarPDFDanfe(NFeProc cupomDanfe, [PdfPageFormat pageFormat = PdfPageFormat.roll80, Uint8List? logo]) async {
  var pdf = Document(
    theme: ThemeData.withFont(
      base: Font.ttf(await rootBundle.load("packages/hes_brasil/assets/consola.ttf")),
      bold: Font.ttf(await rootBundle.load("packages/hes_brasil/assets/consolab.ttf")),
      italic: Font.ttf(await rootBundle.load("packages/hes_brasil/assets/consolai.ttf")),
      boldItalic: Font.ttf(await rootBundle.load("packages/hes_brasil/assets/consolab.ttf")),
    ),
  );

  pdf.addPage(
    Page(
      pageFormat: pageFormat,
      build: (Context context) {
        return DefaultTextStyle(
          style: const TextStyle(fontSize: 6, color: PdfColors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (logo != null) ...[
                Image(MemoryImage(logo), height: 70),
                SizedBox(height: 12),
              ],
              Text(cupomDanfe.nfe?.infNFe?.emit?.xNome ?? ""),
              SizedBox(height: 8),
              Text(
                '${cupomDanfe.nfe?.infNFe?.emit?.enderEmit?.enderecoFormatado} Tel: ${Brasil.formatarTelefone(cupomDanfe.nfe?.infNFe?.emit?.enderEmit?.fone)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('DOCUMENTO AUXILIAR DA NOTA FISCAL DE CONSUMIDOR ELETRÔNICA', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Column(
                children: [
                  for (Det item in cupomDanfe.nfe?.infNFe?.det ?? []) ...[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        computeItem(item, pageFormat.availableWidth, 6),
                      ],
                    ),
                    Divider(borderStyle: BorderStyle.dashed, thickness: 0.5, color: PdfColors.black),
                  ],
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('QTD. TOTAL DE ITENS'),
                  Text(
                    (cupomDanfe.nfe?.infNFe?.det ?? []).sum((x) => x.prod?.qCom ?? 0).obterRealSemSimbolo(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('VALOR TOTAL R\$'),
                  Text((cupomDanfe.nfe?.infNFe?.valorTotal ?? 0).obterRealSemSimbolo(), style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DESCONTOS R\$'),
                  Text((cupomDanfe.nfe?.infNFe?.desconto ?? 0).obterRealSemSimbolo(), style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('VALOR A PAGAR R\$'),
                  Text((cupomDanfe.nfe?.infNFe?.totalPago ?? 0).obterRealSemSimbolo(), style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              for (var item in cupomDanfe.listaPagamentos) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((item.tPag).toString()),
                    Text(item.total.obterRealSemSimbolo(), style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
              SizedBox(height: 16),
              Text("Número ${cupomDanfe.nfe?.infNFe?.ide?.nNF ?? ""} Série  ${cupomDanfe.nfe?.infNFe?.ide?.serie ?? ""} Emissão ${cupomDanfe.nfe?.infNFe?.ide?.dhEmi?.format("dd/MM/yyyy HH:mm:ss")}"),
              Text("Consulte pela Chave de Acesso em"),
              Text(cupomDanfe.uriNFCe?.toString() ?? ""),
              Text("Protocolo de Autorização: ${cupomDanfe.protNFe?.infProt?.nProt ?? "Sem Protocolo"} ${cupomDanfe.protNFe?.infProt?.dhRecbto?.format("dd/MM/yyyy HH:mm:ss") ?? ""}"),
              SizedBox(height: 16),
              if (cupomDanfe.nfe?.infNFe?.dest?.cnpjCpf?.isNotBlank ?? false) ...[
                Text(cupomDanfe.nfe?.infNFe?.dest?.xNome ?? ""),
                Text(Brasil.formatarCPFouCNPJ(cupomDanfe.nfe?.infNFe?.dest?.cnpjCpf ?? "")),
              ] else
                Text("CONSUMIDOR NÃO INDENTIFICADO"),
              SizedBox(height: 16),
              if (cupomDanfe.uriNFCe != null)
                BarcodeWidget(
                  height: 70,
                  width: 70,
                  color: PdfColors.black,
                  barcode: Barcode.qrCode(),
                  data: cupomDanfe.uriNFCe!.toString(),
                )
              else
                Text("Não foi\r\npossivel\r\ngerar o\r\nQR Code", textAlign: TextAlign.center),
              SizedBox(height: 16),
              Text(cupomDanfe.nfe?.infNFe?.infAdic?.infCpl ?? ""),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF file
  return pdf.save();
}

Widget computeItem(Det item, double pageWidth, double fontSize) {
  final Prod? pp = item.prod;
  if (pp == null) {
    return SizedBox();
  }
  var desc = '${pp.cProd} - ${pp.xProd}';
  var price = '${pp.qCom} x ${pp.vUnCom!.obterRealSemSimbolo()} = ${pp.vProd!.obterRealSemSimbolo()}';
  int charCount = desc.length + price.length + 2;
  int charPerLine = (pageWidth / (fontSize * .5)).ceil();

  if (charCount < charPerLine) {
    return SizedBox(
      width: pageWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            desc,
            textAlign: TextAlign.left,
          ),
          Text(
            price,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  } else {
    return SizedBox(
      width: pageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            desc,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            width: pageWidth,
            child: Text(
              price,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
