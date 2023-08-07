import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MainPage extends StatelessWidget
{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("MainPage");
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      builder: (context, child){
        return Scaffold(
          appBar: AppBar(title: Consumer<AppData>(builder: (context,value,child){
            return Text(value.name);
          },
            // child: Text(
                // Provider.of<AppData>(context,listen: true).name
              // context.watch<AppData>().name
            // ),
          ),
          ),
          body: Screen2(),
        );
      }
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    print("Screen 2");
    return Container(
      child: Screen3(),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    print("Screen 3");
    return Container(
      child: Screen4(),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

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
          Consumer<AppData>(builder: (context,value,child){
            return Text(value.name);
          }),
          // Text(Provider.of<AppData>(context,listen: true).name),
          // Text(context.watch<AppData>().name),
          // we can use context.watch<AppData>().name ,in it listen is by default true
          ElevatedButton(onPressed: (){
     //here listen must be false so we use context.read<AppData>().name where listen is bydefalut false
     //        Provider.of<AppData>(context,listen: false).changeData("Abhireet");
            context.read<AppData>().changeData("Abhireet");
          }, child: Text("Change data"))
        ],
      ),
    );
  }
}

//model class- we will write all the data here using mixin which will change after sometime.
class AppData with ChangeNotifier
{
  String _name = "Abhi ultra pro max";

  void changeData(String data)
  {
    _name=data;
    notifyListeners();
  }
  String get name => _name;
}

