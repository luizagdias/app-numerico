import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {Function()? funcao,
    String texto = '',
    Color cor = const Color(0xFFFBC02D)}) {
  return ElevatedButton(
    onPressed: funcao,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(cor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(15))),
    child: Text(
      texto,
      style: const TextStyle(
        fontSize: 15,
      ),
    ),
  );
}
