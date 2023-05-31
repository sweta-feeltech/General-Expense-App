import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


import '../../Utils/colors.dart';

class PdfViewerScreen extends StatefulWidget {
  static String routeName = '/pdfViewerScreen';
  final String path;
  const PdfViewerScreen({Key? key, required this.path}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your onPressed logic here
              ///for notification
            },
          ),
        ],
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
        //   onPressed: () {
        //     // widget.backPressCallback.call();
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        // ),
        titleSpacing: 15,
        title: Text(
          "PDF Viewer",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SfPdfViewer.network(
          enableTextSelection: false,
          canShowPaginationDialog: true,
          canShowHyperlinkDialog: true,
          canShowScrollStatus: true,
          pageSpacing: 5,
          pageLayoutMode: PdfPageLayoutMode.continuous,
          '${widget.path}',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
