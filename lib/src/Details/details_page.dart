import 'dart:convert';
import 'package:magazinelu/src/QrCode/qrcode_page.dart';
import 'package:toast/toast.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  String codeFinal;

  DetailsPage({@required this.codeFinal});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String url = 'http://localhost:3001/api/produtos/';

  Future<Map> _getDetailsProd() async {
    try {
      http.Response response;
      response = await http.get(
          "https://magalu-hackaton-api.herokuapp.com/api/produtos/${widget.codeFinal}");

      return json.decode(response.body);
    } catch (e) {
      print('-----------------------------dsadsadsda-------------$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),

      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder(
                    future: _getDetailsProd(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                              strokeWidth: 3,
                            ),
                          );
                        default:
                          if (snapshot.hasError)
                            return Text('deuruim');
                          else
                            return _produto(context, snapshot);
                      }
                    })),
          ],
        ),
      ),
    );
  }

  Widget _produto(BuildContext context, AsyncSnapshot snapshot) {
    Map produto = snapshot.data["produto"];

    if(produto == null){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Código não encontrado!!'),
            RaisedButton(
                onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (builder)=> QrCode()));},
                child: Text('Escanear novamente'),
            )
          ],
        ),
      );
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 350,
            child: Image.network(produto['imagem']),
          ),
        ),
        Text(produto["nome"], style: TextStyle(fontSize: 18), textAlign: TextAlign.start,),
        Text('R\$ ${produto["precoParcelado"]}'),
        Text('15x de R\$ ${produto["parcelas"]} sem juros'),
        Text.rich(TextSpan( children: <TextSpan>[
          TextSpan(text: "R\$ ${produto['preco']}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          TextSpan(text: ' à vista')
        ])),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonTheme(
            height: 60,
            child: RaisedButton(
              onPressed: () { Toast.show('Item ${produto['nome']} inserido à sacola', context,);},
              color: Colors.green,
              textColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 48),
                      child: Icon(
                        Icons.local_mall,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ADICIONAR À SACOLA',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16),
          child: ButtonTheme(
              height: 60,
              minWidth: double.infinity,
              child: RaisedButton(
                  onPressed: () {
                        launch('https://magalu-hackaton-api.herokuapp.com/api/etiqueta-gerar/${produto['id']}');
                  },
                  textColor: Colors.white,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 48),
                          child: Icon(
                            Icons.print,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'IMPRIMIR ETIQUETA',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),)),
        )
      ],
    );
  }
}
