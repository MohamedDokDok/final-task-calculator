import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#b7f44c'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor('#408d4d'),
                    HexColor('#b7f44c'),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      equation,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        result == '' ? '' : '\n =',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(30.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF484848),
                      Color(0xFF212121),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      padding: EdgeInsets.only(
                        top: 17,
                      ),
                      child: Table(
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[800],
                              ),
                              children: [
                                buttonBuilder(
                                    context: context,
                                    numberOfButton: 'AC',
                                    size: 1,
                                    color: Colors.green),
                                buttonBuilder(
                                    context: context,
                                    numberOfButton: '⌫',
                                    size: 1,
                                    color: Colors.green),
                                buttonBuilder(
                                    context: context,
                                    numberOfButton: '%',
                                    size: 1,
                                    color: Colors.green),
                              ]),
                          TableRow(children: [
                            buttonBuilder(
                                context: context,
                                numberOfButton: '1',
                                size: 1.2),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '2',
                                size: 1.2),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '3',
                                size: 1.2),
                          ]),
                          TableRow(children: [
                            buttonBuilder(
                                context: context,
                                numberOfButton: '4',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '5',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '6',
                                size: 1.5),
                          ]),
                          TableRow(children: [
                            buttonBuilder(
                                context: context,
                                numberOfButton: '7',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '8',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '9',
                                size: 1.5),
                          ]),
                          TableRow(children: [
                            buttonBuilder(
                                context: context,
                                numberOfButton: '.',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '0',
                                size: 1.5),
                            buttonBuilder(
                                context: context,
                                numberOfButton: '00',
                                size: 1.5),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[800]),
                        child: Column(
                          children: [
                            Expanded(
                              child: buttonBuilder(
                                  context: context,
                                  numberOfButton: '÷',
                                  size: 1.0,
                                  color: Colors.green),
                            ),
                            Expanded(
                              child: buttonBuilder(
                                  context: context,
                                  numberOfButton: '×',
                                  size: 1.0,
                                  color: Colors.green),
                            ),
                            Expanded(
                              child: buttonBuilder(
                                  context: context,
                                  numberOfButton: '+',
                                  size: 1.0,
                                  color: Colors.green),
                            ),
                            Expanded(
                              child: buttonBuilder(
                                  context: context,
                                  numberOfButton: '-',
                                  size: 1.0,
                                  color: Colors.green),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(colors: [
                                  HexColor('#408d4d'),
                                  HexColor('#b7f44c'),
                                ], end: AlignmentDirectional.topEnd),
                              ),
                              child: buttonBuilder(
                                  context: context,
                                  numberOfButton: '=',
                                  size: 1.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonBuilder({
    required BuildContext context,
    required String numberOfButton,
    required double size,
    Color color = Colors.white,
  }) =>
      MaterialButton(
        height: MediaQuery.of(context).size.height * .08 * size,
        onPressed: () {
          buttonPressed(numberOfButton);
          if (result != "" && result != "Error") {
            if (numberOfButton == "+" ||
                numberOfButton == "-" ||
                numberOfButton == "%" ||
                numberOfButton == "×" ||
                numberOfButton == "÷") {
                setState(() {
                  equation = result;
                  result = "";
                  equation+=numberOfButton;
                });
            }
          }
        },
        child: Text(
          numberOfButton,
          style: TextStyle(fontSize: 30, color: color),
        ),
      );

  String equation = "";
  String result = "";
  String expression = "";

  buttonPressed(String text) {
    setState(() {
      if (text == "AC") {
        equation = "";
        result = "";
      } else if (text == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "";
          result = "";
        }
      } else if (text == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          var temp = double.parse(result);
          result = temp.toStringAsFixed(3).toString();
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "") {
          equation = text;
        } else {
          equation = equation + text;
        }
      }
    });
  }
}
