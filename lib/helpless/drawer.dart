import 'package:flutter/material.dart';
import 'package:magazinelu/src/Notificacao/notificacao_page.dart';
import 'package:magazinelu/src/QrCode/qrcode_page.dart';
import 'package:magazinelu/src/Home/home_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: Container(
          color: Color(0xf5f5f5),
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Padding(
                    padding: EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, size: 38,),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Entre agora', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Confira seus pedidos, endereços \ne etc...', style: TextStyle(color: Color(0xff8c8c8c)),)
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));},
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Padding(
                        child: Icon(Icons.home, size: 30, color: Color(0xff8c8c8c),),
                        padding: EdgeInsets.only(left: 28, right: 25),
                        ),
                        Text('Inicio')
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => QrCode() ));},
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          child: Icon(Icons.crop_free, size: 28, color: Color(0xff8c8c8c),),
                          padding: EdgeInsets.only(left: 33, right: 25),
                        ),
                        Text('Buscar Produto')
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => NotificacaoNova() ));},
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          child: Icon(Icons.local_offer, size: 30, color: Color(0xff8c8c8c),),
                          padding: EdgeInsets.only(left: 28, right: 25),
                        ),
                        Text('Atualizações dos Preços')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
