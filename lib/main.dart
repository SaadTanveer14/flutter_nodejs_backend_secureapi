// import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterdesign/env.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;


void main() {
  runApp(const MyApp());
}

Uint8List? bytes;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState

    // getimagedata();
    
    super.initState();

    // getImage("https://9c1e-182-180-50-4.in.ngrok.io/image.jpg");
    
    
  }

  Future<Uint8List?> getidata() async{

    await Future.delayed(
        const Duration(seconds: 8)
      );

    var imageData = await getImage("https://d8bc-182-180-50-4.in.ngrok.io/image.jpg");
    
    print(imageData['data']);
    
    bytes = base64.decode(imageData['data']);
    
    print(bytes.runtimeType);

    return bytes!;
  }

  // getimagedata() async {
        
        


        
        // var data = await importData['data'];

        
      
        
  // }

  void _incrementCounter() {
    setState(() {

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body:    
      Column(
        children:[
          SizedBox(height: 100,),

            // ElevatedButton(onPressed:set , child: Text("Button 1")),

          if(bytes!=null)
            Text("data"),

            FutureBuilder<Uint8List?>(
                future: getidata(),
                builder: ((context, snapshot) {
                  if(snapshot.hasError){

                    return const Text("Error");

                  }
                  else if(snapshot.hasData)
                  {

                    print(snapshot.data);
                    // dev.debugger();
                    var img = MemoryImage(snapshot.data!);
                   return Image.memory(snapshot.data!);

                    // return(const Text('Data has been received'));

                  }
                  else{

                    return(const Text('Waiting'));

                  }
                })
              )
            // Image.memory(bytes),
        
          
          // Expanded(child: grid()),
        ],
         
      ),
      
      
      
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Color(0xff000000),
        child: const Icon(Icons.add,color:Color(0xFFF1FF0A),),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   color: Colors.teal[100],
          //   child: const Text("He'd have you all unravel at the"),
          // ),

      for(int i=0;i<10;i++)
         if (bytes!=null)
            
            Cards(),


      
        ],
      );
  }
}


class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async{



        print("Hello");
        
      }),
      child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),

      elevation: 0,

      color: const Color(0xFFF1FF0A),
        
      // child:Column(

      // )
     
      // child: SizedBox(
        // width: 50,
        // height: 200,
        
        
        // child: Image.memory(bytes),
      

      // ),
    ),
    );
    
  }
}

// // getting image for api server from vanilla js server

// Future<Uint8List> getImage(String url) async {
//   try {
//     var response = await http.get(url);
//     if (response.statusCode != HttpStatus.ok) {
//       throw Exception('Failed to load image');
//     }
//     return response.bodyBytes;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }



// // getting image for api server in base64 from vanilla js server

Future<Map<String,dynamic>> getImage(String url) async {

  print(Env.imageAPI);
  String url1 = Env.imageAPI;
  dev.debugger();
  Map<String,dynamic> ret= {};
  try {

    var URL = Uri.parse(url1);
    var response = await http.get(URL);
    final json = jsonDecode(response.body);
    

    
    print(json['data']);


    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load image');
    }

    Map<String, dynamic> res= json as Map<String, dynamic>;
    // String res = response.body ;
     dev.debugger();
     print(res);
    return res;
  } catch (e) {
    print(e);
    return ret;
  }
}


// getImage()
// {
//   NetworkImage()
// }











