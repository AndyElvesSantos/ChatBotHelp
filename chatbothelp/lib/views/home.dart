import 'app_body.dart';
import 'package:flutter/material.dart';
import 'package:chatbothelp/views/info_page.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:chatbothelp/views/page_denuncia.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:chatbothelp/views/page_contatos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  //Conexão com o Banco
  HasuraConnect hasuraConnect = HasuraConnect(
    "https://polite-tortoise-57.hasura.app/v1/graphql",
  );

  String doQuery = """
    subscription Denuncia {
      denuncia (order_by: {id: id_denuncia}) {
        usuario
        nome
        sexo
        idade
        telefone
        rua
        numero
        bairro
        cidade
        estado
        descricao 
      }
    }
  """;

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DialogFlowtter.fromFile(
      path: "assets/credentials.json",
      projectId: "chatbothelp-bkil",
    ).then((instance) {
      dialogFlowtter = instance;
      _iniciarConversa();
    });
  }

  void _iniciarConversa() async {
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: "Ola")),
    );
    if (response.message == null) return;
    setState(
      () {
        addMessage(response.message!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            //Botão de ajuda
            IconButton(
          icon: Icon(Icons.info_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InfoPage(
                      title: 'Ajuda',
                    )));
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.title ?? 'Chatbot Help',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.blue[200],
        actions: [
          //Botão de Denúncia
          IconButton(
            icon: Icon(Icons.assignment_late_outlined),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CampoTexto()));
            },
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: AppBody(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: Colors.blue,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                //Botão enviar mensagem
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send_outlined),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),

                //Botão de Contatos
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PageContatos()));
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    // dialogFlowtter.projectId = "deimos-apps-0905";

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}

//parte nova
