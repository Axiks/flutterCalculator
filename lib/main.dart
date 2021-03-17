import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: CalculatorView(),
      ),
    );
  }
}

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorView>{

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: RaisedButton(
        onPressed: (){
          calculation(btntxt);
        },
        child: Text(btntxt,
            style: TextStyle(
              fontSize: 35,
              color: txtcolor,
            )
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bgColorPrim = const Color(0xFFFFBF40);
    const btnColorPrim = Colors.white;
    const bgColorSecond = const Color(0xFF4671D5);
    return Scaffold(
        body: OrientationBuilder(
          builder: (builder, orientation){
            if (orientation == Orientation.portrait){
              return Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),
                      Text(
                        text,
                        style: GoogleFonts.montserrat(
                          fontSize: 100,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(34, 20, 192, 20),
                            onPressed: (){
                              calculation("AC");
                            },
                            child: Text("AC",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: btnColorPrim,
                                )
                            ),
                            shape: StadiumBorder(),
                            color: bgColorPrim,
                          ),
                          calcbutton("/", bgColorSecond, btnColorPrim),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcbutton("1", bgColorPrim, btnColorPrim),
                          calcbutton("2", bgColorPrim, btnColorPrim),
                          calcbutton("3", bgColorPrim, btnColorPrim),
                          calcbutton("*", bgColorSecond, btnColorPrim),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcbutton("4", bgColorPrim, btnColorPrim),
                          calcbutton("5", bgColorPrim, btnColorPrim),
                          calcbutton("6", bgColorPrim, btnColorPrim),
                          calcbutton("+", bgColorSecond, btnColorPrim),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcbutton("7", bgColorPrim, btnColorPrim),
                          calcbutton("8", bgColorPrim, btnColorPrim),
                          calcbutton("9", bgColorPrim, btnColorPrim),
                          calcbutton("-", bgColorSecond, btnColorPrim),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                            onPressed: (){
                              calculation("0");
                            },
                            child: Text("0",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: btnColorPrim,
                                )
                            ),
                            shape: StadiumBorder(),
                            color: bgColorPrim,
                          ),
                          calcbutton(".", bgColorPrim, btnColorPrim),
                          calcbutton("=", bgColorSecond, btnColorPrim),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            } else{
              return Material(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton("1", bgColorPrim, btnColorPrim),
                                calcbutton("2", bgColorPrim, btnColorPrim),
                                calcbutton("3", bgColorPrim, btnColorPrim),
                                calcbutton("+", bgColorSecond, btnColorPrim),
                                calcbutton("*", bgColorSecond, btnColorPrim),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton("4", bgColorPrim, btnColorPrim),
                                calcbutton("5", bgColorPrim, btnColorPrim),
                                calcbutton("6", bgColorPrim, btnColorPrim),
                                calcbutton("-", bgColorSecond, btnColorPrim),
                                calcbutton("/", bgColorSecond, btnColorPrim),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calcbutton("7", bgColorPrim, btnColorPrim),
                                calcbutton("8", bgColorPrim, btnColorPrim),
                                calcbutton("9", bgColorPrim, btnColorPrim),
                                RaisedButton(
                                  padding: EdgeInsets.fromLTRB(34, 20, 96, 20),
                                  onPressed: (){
                                    calculation("AC");
                                  },
                                  child: Text("AC",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: btnColorPrim,
                                      )
                                  ),
                                  shape: StadiumBorder(),
                                  color: bgColorPrim,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RaisedButton(
                                  padding: EdgeInsets.fromLTRB(34, 20, 120, 20),
                                  onPressed: (){
                                    calculation("0");
                                  },
                                  child: Text("0",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: btnColorPrim,
                                      )
                                  ),
                                  shape: StadiumBorder(),
                                  color: bgColorPrim,
                                ),
                                calcbutton(".", bgColorSecond, btnColorPrim),
                                RaisedButton(
                                  padding: EdgeInsets.fromLTRB(34, 20, 120, 20),
                                  onPressed: (){
                                    calculation("=");
                                  },
                                  child: Text("=",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: btnColorPrim,
                                      )
                                  ),
                                  shape: StadiumBorder(),
                                  color: bgColorPrim,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex:4,
                        child:  Text(
                        text,
                        style: GoogleFonts.montserrat(
                          fontSize: 100,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        )
    );
  }
  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    }
    else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;
    }
    else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });

  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (builder, orientation){
          if (orientation == Orientation.portrait){
            return CalculatorView();
          } else{
            return Text("Lanshagt");
          }
          },
      )
    );
  }
}
