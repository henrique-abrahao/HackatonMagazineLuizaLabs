import 'package:flutter/material.dart';
import 'package:magazinelu/helpless/drawer.dart';
import 'package:magazinelu/src/Notificacao/notificacao_page.dart';

int cont = 0;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Magalu',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.local_mall),
          )
        ],
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xffdedede),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff32b6f7),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4b0488),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff000000),
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xffffe3e7),
                          radius: 30,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xff009ffd),
                          radius: 30,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
                    child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        'image/promo3.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
                    child: Container(
                      child: Image.asset(
                        'image/promo2.jpeg',
                        fit: BoxFit.cover,
                      ),
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
                    child: Container(
                      child: Image.asset(
                        'image/promo1.jpeg',
                        fit: BoxFit.cover,
                      ),
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                            EdgeInsets.only(left: 30, top: 15, bottom: 20),
                            child: Text(
                              'Olá, vem ser feliz!',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              'Aproveite ofertas incríveis e veja se você '
                                  '\nfaz parte do Clube da Lu, o clube de '
                                  '\nvantagens do Magalu.',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff5f5f5f)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30, top: 25, bottom: 25),
                            child: ButtonTheme(
                              minWidth: double.infinity,
                              height: 48,
                              child: RaisedButton(
                                onPressed: () {},
                                textColor: Colors.white,
                                color: Color(0xff0086ff),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void initState() {
    super.initState();
    if(cont != 1){
      cont = 1;
      _showDialog();
    }
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 8000));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Atualizações nos Preços"),
            content: new Text("Setor Informáticas"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Me leva até lá"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>NotificacaoNova()));
                },
              )
            ],
          );
        });
  }


}