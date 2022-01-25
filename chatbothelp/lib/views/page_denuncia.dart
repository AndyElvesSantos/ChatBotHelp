import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
//import 'package:icon_text_button/icon_text_button.dart';

HasuraConnect hasuraConnect =
    HasuraConnect("https://polite-tortoise-57.hasura.app/v1/graphql", headers: {
  "x-hasura-admin-secret":
      "Sou79aRVx9tsVHKUr3WZOH27MJJVMT38IYliwiPZO5l4bKyVYF0LMM3RrGvpmsRr"
});

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _telefone = TextEditingController();
  TextEditingController _idade = TextEditingController();
  TextEditingController _numero = TextEditingController();
  TextEditingController _cidade = TextEditingController();
  TextEditingController _bairro = TextEditingController();
  TextEditingController _estado = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  TextEditingController _rua = TextEditingController();
  TextEditingController _nome = TextEditingController();
  int _index = 0;
  String passo_inicial = "Denunciante";
  String sexo = "Feminino";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Página de Denúncia"),
      ),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          setState(() {
            _index += 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },

        //Primeira pergunta - VITIMA OU DENUNCIANTE
        steps: <Step>[
          Step(
            title: const Text('Você é vítima ou apenas denunciante? '),
            content: Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Denunciante"),
                    value: "Denunciante",
                    groupValue: passo_inicial,
                    onChanged: (value) {
                      setState(() {});
                      passo_inicial = value!;
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Vítima"),
                    value: "Vítima",
                    groupValue: passo_inicial,
                    onChanged: (value) {
                      setState(() {});
                      passo_inicial = value!;
                    },
                  ),
                ),
              ],
            ),
          ),

          //Segunda Pergunta - NOME
          Step(
            title: const Text('Digite seu nome: '),
            content: TextField(
              controller: _nome,
            ),
          ),

          //Terceria Pergunta - SEXO
          Step(
            title: const Text('Qual seu sexo? '),
            content: Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Masculino"),
                    value: "Masculino",
                    groupValue: sexo,
                    onChanged: (value) {
                      setState(() {});
                      sexo = value!;
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Feminino"),
                    value: "Feminio",
                    groupValue: sexo,
                    onChanged: (value) {
                      setState(() {});
                      sexo = value!;
                    },
                  ),
                ),
              ],
            ),
          ),
          //Quarta Pergunta - IDADE
          Step(
            title: const Text('Sua idade: '),
            content: TextField(
              controller: _idade,
            ),
          ),
          //Quinta pergunta - TELEFONE
          Step(
            title: const Text('Telefone/Celular: '),
            content: TextField(
              controller: _telefone,
            ),
          ),
          //Sexta pergunta - RUA
          Step(
            title: const Text('Rua: '),
            content: TextField(
              controller: _rua,
            ),
          ),
          //Sétima pergunta - NUMERO
          Step(
            title: const Text('N°: '),
            content: TextField(
              controller: _numero,
            ),
          ),
          //Oitava pergunta - BAIRRO
          Step(
            title: const Text('Bairro: '),
            content: TextField(
              controller: _bairro,
            ),
          ),
          //Nona pergunta - CIDADE
          Step(
            title: const Text('Cidade: '),
            content: TextField(
              controller: _cidade,
            ),
          ),
          //Décima pergunta - ESTADO
          Step(
            title: const Text('Estado: '),
            content: TextField(
              controller: _estado,
            ),
          ),
          //Última/Décima primeria pergunta - RELATO
          Step(
            title: const Text('Faça um breve relato sobre os acontecidos: '),
            content: TextField(
              controller: _descricao,
            ),
          ),
          Step(
            title: Text("Realizar Denuncia"),
            content: FloatingActionButton.extended(
                onPressed: () {
                  RealizarDenuncia();
                },
                label: Text("Denunciar")),
          ),

          //Pergunta final
          //const Step(
          //title: Text('Step 2 title'),
          //content: Text('Content for Step 2'),
          //),
        ],
      ),
    );
  }

  RealizarDenuncia() async {
    String query = """mutation MyMutation {
  insert_Denuncia(objects: {
    bairro: "${_bairro.text}",
    cidade: "${_cidade.text}", 
    descricao: "${_descricao.text}", 
    estado: "${_estado.text}", 
    idade: ${_idade.text}, 
    nome: "${_nome.text}", 
    numero: "${int.parse(_numero.text)}", 
    rua: "${_rua.text}", 
    sexo: "${sexo}", 
    telefone: "${_telefone.text}", 
    usuario: "${passo_inicial}"
    }) {
    affected_rows
  }
}
 """;
    try {
      showDialog(
          context: context,
          builder: (_) {
            return Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          });
      var res = await hasuraConnect.mutation(query);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }
}





/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget IconTextButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      //home: HomePage(title: 'Widget IconTextButton Demo Home Page'),
          children: [
                           FloatingActionButton.extended(
                           onPressed: () async {
                           const url = 'https://www.cvv.org.br/';
                           if (await canLaunch(url)) {
                           await launch(url);
                            } else {
                           throw 'Could not launch $url';
                          }
                           },
                          label: Text(
                           "",
                           style: TextStyle(color: Colors.white),
                           ),
                          backgroundColor: Colors.blue[200],
                           ),
                          SizedBox(
                             width: 5.0,
                          // ),
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
    );
  }
}*/
