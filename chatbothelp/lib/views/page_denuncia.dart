import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _editingController = TextEditingController();
  int _index = 0;
  String passo_inicial = "Denunciante";
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
          Step(
            title: const Text('Digite seu nome: '),
            content: TextField(),
          ),
          const Step(
            title: Text('Step 2 title'),
            content: Text('Content for Step 2'),
          ),
        ],
      ),
    );
  }
}
