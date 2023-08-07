import 'package:flutter/material.dart';

//why we avoid setState in this file and use of provider will be in main2.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget
{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

   String data="Abhireet";

   void changeValue(String dataChange)
   {
      setState(() {
        data=dataChange;
      });
   }

  @override
  Widget build(BuildContext context) {
    print("MainPage");
    return Scaffold(
      appBar: AppBar(title: Text(data),
      ),
      body: Screen2(data: data,changeData: changeValue,),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key, required this.data, required this.changeData});
  final String data;
  final Function(String) changeData;

  @override
  Widget build(BuildContext context) {
    print("Screen 2");
    return Container(
      child: Screen3(data: data,changeData: changeData,),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key,required this.data,required this.changeData});

  final String data;
  final Function(String) changeData;

  @override
  Widget build(BuildContext context) {
    print("Screen 3");
    return Container(
      child: Screen4(data: data,changeData: changeData,),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({super.key,required this.data,required this.changeData});

  final String data;
  final Function(String) changeData;

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    print("Screen 4");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.data),
          ElevatedButton(onPressed: (){
            setState(() {
              // widget.data="gedv";  //we can't directly change the data which has come from MainPage
              widget.changeData("AbhiRit");
            });
          }, child: Text("Change data"))
        ],
      ),
    );
  }
}

