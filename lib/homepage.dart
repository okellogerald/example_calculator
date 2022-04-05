import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'service.dart';

enum Operators { add, minus, multiply, divide, equal, percent, negate }

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [Icon(Icons.brightness_4)], elevation: 0),
        body: Column(
          children: [
            Expanded(child: _buildShowCase()),
            Expanded(flex: 2, child: _buildKeypad())
          ],
        ));
  }

  Widget _buildShowCase() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(service.getExpression, style: TextStyle(fontSize: 22)),
              Text(service.getResult,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold))
            ]));
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        SizedBox(
            height: 400,
            child: GridView.count(
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _buildTextButton('C'),
                  _buildIconButton(
                      CupertinoIcons.plus_slash_minus, Operators.negate),
                  _buildIconButton(CupertinoIcons.percent, Operators.add),
                  _buildIconButton(CupertinoIcons.divide, Operators.divide),
                  _buildTextButton('7'),
                  _buildTextButton('8'),
                  _buildTextButton('9'),
                  _buildIconButton(CupertinoIcons.multiply, Operators.multiply),
                  _buildTextButton('4'),
                  _buildTextButton('5'),
                  _buildTextButton('6'),
                  _buildIconButton(CupertinoIcons.minus, Operators.minus),
                  _buildTextButton('1'),
                  _buildTextButton('2'),
                  _buildTextButton('3'),
                  _buildIconButton(CupertinoIcons.plus, Operators.add),
                ])),
        Row(
          children: [
            Expanded(flex: 2, child: _buildTextButton('0')),
            Expanded(child: _buildTextButton('.')),
            Expanded(
                child: _buildIconButton(CupertinoIcons.equal, Operators.equal))
          ],
        )
      ],
    );
  }

  Widget _buildTextButton(String value) {
    return Builder(builder: (context) {
      return TextButton(
        onPressed: () {
          service.addValue(value);
          setState(() {});
        },
        child: Text(value, style: const TextStyle(color: Colors.red)),
      );
    });
  }

  Widget _buildIconButton(IconData icon, Operators operator) {
    return IconButton(
        icon: Icon(icon),
        onPressed: () {
          service.addOperator(operator);
          setState(() {});
        });
  }
}
