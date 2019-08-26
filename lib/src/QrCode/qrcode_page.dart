import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:magazinelu/src/Details/details_page.dart';
import 'package:magazinelu/src/Home/home_page.dart';

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {


  @override
  Widget build(BuildContext context) {
    return Home();
  }


  String _code,_value = '';

  Future _scan() async{

    _code = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true);

    _value = _code;
   _value != '' ? Navigator.push(context, MaterialPageRoute(builder: (builder) => DetailsPage(codeFinal: _value,)))
       :  null;

  }

  @override
  void initState() {
    super.initState();
        _scan();
  }
}

