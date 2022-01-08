import 'package:flutter/material.dart';
import 'package:chatbothelp/views/home.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageContatos extends StatefulWidget {
  const PageContatos({Key? key}) : super(key: key);

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<PageContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Telefones Úteis - Contatos de Ajuda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue[200],
        ),
        backgroundColor: Colors.white,
        body: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30.0,
          ),
          Card(
              color: Colors.grey.shade300,
              child: SizedBox(
                width: 500,
                height: 450.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "ENTENDA SEU CASO, E LIGUE!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //CONTATO 1
                      Text(
                        'DISQUE 100,',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'O Disque Direitos Humanos (Disque 100) é um serviço de disseminação de informações sobre'
                        ' direitos de grupos vulneráveis e de denúncias de violações de direitos humanos.',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FloatingActionButton.extended(
                          // onPressed: () async {
                          // const url = 'https://www.cvv.org.br/';
                          // if (await canLaunch(url)) {
                          //   await launch(url);
                          //  } else {
                          // throw 'Could not launch $url';
                          //}
                          // },
                          //label: Text(
                          // "",
                          // style: TextStyle(color: Colors.white),
                          // ),
                          // backgroundColor: Colors.blue[200],
                          // ),
                          SizedBox(
                            width: 5.0,
                          ),
                          /*IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 50.0,
                              color: Colors.blue[200],
                            ),
                            onPressed: () async {
                              const url =
                                  'https://www.instagram.com/abusosexual.liberdade/?hl=pt-br';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          )*/
                        ],
                      ),
                      SizedBox(
                        height: 45.0,
                      ),
                      /*Text(
                        'Psicologos de Plantão',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Plantão Psicológico Voluntário e Psicoterapia Social. Atendimento Online.',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),*/
                      SizedBox(
                        height: 10.0,
                      ),
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          size: 50.0,
                          color: Colors.blue[200],
                        ),
                        onPressed: () async {
                          const url =
                              'https://www.instagram.com/psicologosdeplantao_/?hl=pt-br';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                      /**/
                    ],
                  ),
                ),
              ))
        ])));
  }
}
