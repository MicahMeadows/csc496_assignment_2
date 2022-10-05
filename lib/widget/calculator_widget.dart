import 'package:csc496_assignment_2/widget/elevated_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

const offColor = Color(0xFF6880FE);

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String leftNum = "0";
  String rightNum = "";
  String? operator;
  double? result;

  String get genTopText {
    return '$leftNum ${operator ?? ''} $rightNum';
  }

  void setNum(String num) {
    if (operator == null) {
      if (leftNum == "0") {
        leftNum = "";
      }
      setState(() {
        leftNum = '$leftNum$num';
      });
    } else {
      setState(() {
        rightNum = '$rightNum$num';
      });
    }
    print('$leftNum $operator $rightNum');
  }

  void setOperator(String op) {
    setState(() {
      operator = op;
    });
  }

  void clear() {
    setState(() {
      leftNum = "";
      rightNum = "";
      operator = null;
      result = null;
    });
  }

  void resolve() {
    double lNum = double.parse(leftNum);
    double rNum = double.parse(rightNum);
    double? res;
    try {
      if (operator == null) throw Exception("No operator.");
      if (rightNum == "") throw Exception("No right number.");

      switch (operator as String) {
        case "/":
          res = lNum / rNum;
          break;
        case "x":
          res = lNum * rNum;
          break;
        case "-":
          res = lNum - rNum;
          break;
        case "+":
          res = lNum + rNum;
          break;
      }
      setState(() {
        clear();
        leftNum = res.toString();
      });
    } catch (e) {}
  }

  Widget bText(String btnTxt) {
    return Text(
      btnTxt,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 6,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5,
            strokeAlign: StrokeAlign.inside,
          ),
          color: const Color(0xFF50FEB1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              offset: Offset(4, 4),
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              constraints: const BoxConstraints(
                maxHeight: 90,
              ),
              child: Center(
                child: Text(
                  genTopText,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedCircleButton(
                        child: bText('7'),
                        onTap: () => setNum('7'),
                      ),
                      ElevatedCircleButton(
                        child: bText('8'),
                        onTap: () => setNum('8'),
                      ),
                      ElevatedCircleButton(
                        child: bText('9'),
                        onTap: () => setNum('9'),
                      ),
                      ElevatedCircleButton(
                        child: bText('/'),
                        color: offColor,
                        onTap: () => setOperator('/'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedCircleButton(
                        child: bText('4'),
                        onTap: () => setNum('4'),
                      ),
                      ElevatedCircleButton(
                        child: bText('5'),
                        onTap: () => setNum('5'),
                      ),
                      ElevatedCircleButton(
                        child: bText('6'),
                        onTap: () => setNum('6'),
                      ),
                      ElevatedCircleButton(
                        child: bText('x'),
                        color: offColor,
                        onTap: () => setOperator('x'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedCircleButton(
                        child: bText('1'),
                        onTap: () => setNum('1'),
                      ),
                      ElevatedCircleButton(
                        child: bText('2'),
                        onTap: () => setNum('2'),
                      ),
                      ElevatedCircleButton(
                        child: bText('3'),
                        onTap: () => setNum('3'),
                      ),
                      ElevatedCircleButton(
                        child: bText('-'),
                        color: offColor,
                        onTap: () => setOperator('-'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedCircleButton(
                        child: bText('0'),
                        onTap: () => setNum('0'),
                      ),
                      ElevatedCircleButton(
                        child: bText('C'),
                        onTap: () => clear(),
                      ),
                      ElevatedCircleButton(
                        child: bText('='),
                        onTap: () => resolve(),
                      ),
                      ElevatedCircleButton(
                        child: bText('+'),
                        color: offColor,
                        onTap: () => setOperator('+'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
