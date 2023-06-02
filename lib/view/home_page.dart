import 'package:app_numerico/components/alert_dialog.dart';
import 'package:app_numerico/components/app_bar.dart';
import 'package:app_numerico/components/main_button.dart';
import 'package:app_numerico/controller/number_controller.dart';
import 'package:app_numerico/model/number.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;
  String textResult = 'Este número é par';

  void calculateNumber(String operator, int value) {
    int calculatedNumber =
        NumberController.instance.calculateNumber(operator, value);

    setState(() {
      number = calculatedNumber;
      updateTextResult();
    });

    if (calculatedNumber < 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert(
                context, 'Erro', 'O número exibido tem valor negativo');
          });
    }
  }

  void resetNumber() {
    if (number == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert(context, 'Erro', 'O número já está zerado');
          });
    }
    Number.instance.setNumber(0);
    setState(() {
      number = 0;
      updateTextResult();
    });
  }

  void updateTextResult() {
    if (number % 2 == 0) {
      textResult = 'Este número é par';
    } else {
      textResult = 'Este número é ímpar';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Número',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            textResult,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainButton(
                  funcao: () {
                    calculateNumber('+', 5);
                  },
                  texto: '+ 5',
                  cor: const Color(0xFF558B2F)),
              const SizedBox(
                width: 10,
              ),
              mainButton(
                  funcao: () {
                    calculateNumber('-', 5);
                  },
                  texto: '- 5',
                  cor: const Color(0xFFD32F2F)),
              const SizedBox(
                width: 10,
              ),
              mainButton(
                  funcao: () {
                    calculateNumber('*', 2);
                  },
                  texto: 'x 2',
                  cor: const Color(0xFF00ACC1)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          mainButton(
              funcao: () {
                resetNumber();
              },
              texto: 'Zerar Número'),
        ],
      )),
    );
  }
}
