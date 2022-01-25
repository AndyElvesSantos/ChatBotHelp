import 'package:flutter/material.dart';
import 'package:chatbothelp/views/home.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required String title}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Informações Básicas - Guia de Ajuda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
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
                width: 300.0,
                height: 350.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "EU ACREDITO EM VOCÊ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'A pagina do Instagran, "Eu acredito em você" é um dos exemplos,'
                        'de luta e combate ao abuso sexual. Ela assim como outras busca mostrar as vítimas,'
                        ' que elas não estão sozinhas e muito menos desacreditadas.  ',
                        style: TextStyle(
                          color: Colors.black,
                          //fontStyle: FontStyle.italic,
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
                          Text(
                            "Clique no ícone abaixo, para conhecer:",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 5.0,
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
                                  'https://www.instagram.com/abusosexual.liberdade/?hl=pt-br';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 45.0,
                      ),
                      Text(
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
                          //fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
