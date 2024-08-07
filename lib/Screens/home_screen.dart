import 'package:calculator/Data/button_text.dart';
import 'package:calculator/Widgets/my_buttons.dart';
import 'package:calculator/Widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion = '';
  var finalAns = '';

  @override
  Widget build(BuildContext context) {
    final myTextStyle = TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.06,
        color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: MediaQuery.of(context).size.height * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue.shade300,
      ),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Responsive(
            portait: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.02,
                    ),
                    alignment: Alignment.bottomRight,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            userQuestion,
                            style: myTextStyle,
                          ),
                          if (userQuestion.isNotEmpty)
                            Text(
                              "=$finalAns",
                              style: myTextStyle,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: buttonText.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 16 / 13),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return MyButtons(
                          onTap: () {
                            setState(() {
                              userQuestion = '';
                              finalAns = '';
                            });
                          },
                          buttonColor: Colors.red,
                          textColor: Colors.white,
                          buttonText: buttonText[index],
                        );
                      } else if (index == 1) {
                        return MyButtons(
                          onTap: () {
                            setState(() {
                              if (userQuestion.isNotEmpty) {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              }
                              if (userQuestion == '') {
                                finalAns = '';
                              }
                            });
                          },
                          buttonColor: Colors.green,
                          textColor: Colors.white,
                          buttonText: buttonText[index],
                        );
                      } else if (index == buttonText.length - 1) {
                        return MyButtons(
                          onTap: () {
                            setState(() {
                              equalExpress();
                            });
                          },
                          buttonColor: Colors.green,
                          textColor: Colors.white,
                          buttonText: buttonText[index],
                        );
                      } else if (index == buttonText.length - 2) {
                        return MyButtons(
                          onTap: () {
                            setState(() {
                              equalExpress();
                            });
                          },
                          buttonColor: Colors.white,
                          textColor: Colors.deepPurple[400]!,
                          buttonText: buttonText[index],
                        );
                      } else {
                        return MyButtons(
                          onTap: () {
                            setState(() {
                              userQuestion += buttonText[index];
                            });
                          },
                          buttonColor: isOperator(buttonText[index])
                              ? Colors.deepPurple
                              : Colors.white,
                          textColor: isOperator(buttonText[index])
                              ? Colors.white
                              : Colors.deepPurple[400]!,
                          buttonText: buttonText[index],
                        );
                      }
                    },
                  ),
                )
              ],
            ),
            landscape: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .01),
                    alignment: Alignment.bottomRight,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            userQuestion,
                            style: myTextStyle,
                          ),
                          if (userQuestion.isNotEmpty)
                            Text(
                              "=$finalAns",
                              style: myTextStyle,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buttonText.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 16 / 9),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                userQuestion = '';
                                finalAns = '';
                              });
                            },
                            buttonColor: Colors.red,
                            textColor: Colors.white,
                            buttonText: buttonText[index],
                          );
                        } else if (index == 1) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                if (userQuestion.isNotEmpty) {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                }
                                if (userQuestion == '') {
                                  finalAns = '';
                                }
                              });
                            },
                            buttonColor: Colors.green,
                            textColor: Colors.white,
                            buttonText: buttonText[index],
                          );
                        } else if (index == buttonText.length - 1) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                equalExpress();
                              });
                            },
                            buttonColor: Colors.green,
                            textColor: Colors.white,
                            buttonText: buttonText[index],
                          );
                        } else if (index == buttonText.length - 2) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                equalExpress();
                              });
                            },
                            buttonColor: Colors.white,
                            textColor: Colors.deepPurple[400]!,
                            buttonText: buttonText[index],
                          );
                        } else {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                userQuestion += buttonText[index];
                              });
                            },
                            buttonColor: isOperator(buttonText[index])
                                ? Colors.deepPurple
                                : Colors.white,
                            textColor: isOperator(buttonText[index])
                                ? Colors.white
                                : Colors.deepPurple[400]!,
                            buttonText: buttonText[index],
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalExpress() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel contextModel = ContextModel();
    double ans = exp.evaluate(EvaluationType.REAL, contextModel);
    finalAns = ans.toString();
  }
}
