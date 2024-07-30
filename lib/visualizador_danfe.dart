// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:download/download.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/gerar_pdf_danfe.dart';
import 'package:innerlibs/nfe.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class VisualizadorDanfe extends StatefulWidget {
  const VisualizadorDanfe({
    super.key,
    this.xmlDanfe,
    this.imageLogo,
    this.diretorio,
    this.exibirBotaoAbrirXml = false,
    this.pageFormats = const {
      "80 mm": PdfPageFormat.roll80,
      "57 mm": PdfPageFormat.roll57,
      //TODO: fazer o layout A4
    },
  });

  final NFeProc? xmlDanfe;
  final Uint8List? imageLogo;
  final Map<string, PdfPageFormat> pageFormats;
  final Directory? diretorio;
  final bool exibirBotaoAbrirXml;
  @override
  State<VisualizadorDanfe> createState() => _VisualizadorDanfeState();
}

class _VisualizadorDanfeState extends State<VisualizadorDanfe> {
  NFeProc? xmlDanfe;

  @override
  void initState() {
    xmlDanfe = widget.xmlDanfe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (xmlDanfe == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(child: const Text("Nenhuma NFe carregada").centerText()),
            const SizedBox(height: 16),
            TextButton.icon(
                onPressed: () async {
                  await abrirDanfe();
                  setState(() {});
                },
                label: const Text("Abrir XML"),
                icon: const Icon(Icons.open_in_new)),
          ],
        ),
      );
    } else {
      return PdfPreview(
        initialPageFormat: widget.pageFormats.values.firstOrNull,
        pageFormats: widget.pageFormats,
        canChangeOrientation: false,
        canChangePageFormat: true,
        allowPrinting: true,
        allowSharing: true,
        pdfFileName: "${xmlDanfe?.nomeArquivoDistribuicao ?? "nfe"}.pdf",
        canDebug: kDebugMode,
        onPageFormatChanged: (x) {
          setState(() {});
        },
        actions: [
          if (widget.exibirBotaoAbrirXml)
            IconButton(
                onPressed: () async {
                  await abrirDanfe();
                },
                icon: const Icon(Icons.open_in_new)),
          IconButton(
            tooltip: "Salvar XML",
            icon: const Icon(Icons.save),
            onPressed: () async {
              if (xmlDanfe == null) {
                context.showSnackBar("Nenhuma NFe carregada");
                return;
              } else {
                await context.showTaskLoader(
                    loadingText: "Gerando XML...",
                    task: () async {
                      final stream = Stream.fromIterable(xmlDanfe.toString().codeUnits);
                      string caminho = "";
                      if (!isWeb) {
                        Directory? dir = widget.diretorio;
                        if (dir == null) {
                          dir = await getApplicationDocumentsDirectory();
                          if (isWindows || isLinux) {
                            dir = (await getDownloadsDirectory()) ?? dir;
                          }
                        }
                        await dir.create(recursive: true);
                        caminho = dir.path;
                      }

                      caminho = "$caminho\\${xmlDanfe!.nomeArquivoDistribuicao}".removeFirstEqual("\\");
                      await download(stream, caminho);
                      context.showSnackBar("XML salvo em $caminho");
                    });
              }
            },
          ),
        ],
        build: (format) async => gerarPDFDanfe(xmlDanfe!, format, widget.imageLogo),
      );
    }
  }

  Future<void> abrirDanfe() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xml'],
    );

    if (result != null) {
      final File file = File(result.files.single.path!);
      var xml = await file.readAsString();
      if (xml.flatContains("NFeProc")) {
        xmlDanfe = NFeProc.fromXmlString(xml);
      } else {
        xmlDanfe = NFeProc.comNota(NFe.fromXmlString(xml));
      }
    }
  }
}
