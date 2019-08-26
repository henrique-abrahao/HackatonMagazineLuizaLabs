import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificacaoNova extends StatefulWidget {



  Future<Map> _getList() async {
    http.Response response;

    response = await http
        .get('https://magalu-hackaton-api.herokuapp.com/api/produtos?idCategoria=1');

    print(response.body);

    return json.decode(response.body);
  }
  @override
  _NotificacaoNovaState createState() => _NotificacaoNovaState();
}

class _NotificacaoNovaState extends State<NotificacaoNova> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Atualização de Etiquetas'),),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.print),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: widget._getList(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black),
                            strokeWidth: 3,
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _gerList(context, snapshot);
                  }
                }),
          )
        ],
      ),
    );
  }
  Widget _gerList(BuildContext context, AsyncSnapshot snapshot){
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: (){},
          leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          backgroundImage: NetworkImage(
          snapshot.data['produtos'][index]["imagem"]),
          ),
          title: Text(snapshot.data['produtos'][index]['nome']),
            subtitle: Text('R\$ ${snapshot.data['produtos'][index]['preco']}'),
          ),
        );
      },
    );
  }
}
