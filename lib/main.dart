import 'dart:io';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/shared/componant/constance.dart';
import 'package:lavie/shared/network/remote/Dio_Helper.dart';
import 'package:lavie/shared/shared_preference/cachHelper.dart';
import 'package:lavie/shared/styles/thems.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'blocObserver.dart';
import 'layout/homeLayout.dart';
import 'modules/Home_Layout/Cubit/homeCubit.dart';
import 'modules/login_screen/cubit/cubit.dart';
import 'modules/login_screen/cubit/status.dart';
import 'layout/homeLogin.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = MyHttpOverrides();
  BlocOverrides.runZoned(
        () {},
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();
  late Widget startWidget;
  accessToken=CacheHelper.getdata(key: 'accesstoken')??null;
  refreshToken=CacheHelper.getdata(key: 'refreshToken')??null;
  userId=CacheHelper.getdata(key: 'userId')??null;
  print(accessToken);
  if(accessToken != null )startWidget=HomeLayout();
  else startWidget=HomeLogin();
  FlutterNativeSplash.remove();
  runApp(MyApp(startWidget:startWidget));
}

class MyApp extends StatelessWidget {
  final startWidget;
   MyApp({super.key,this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>LoginCubit()),
      BlocProvider(create: (context)=>HomeCubit()..getProduct()..getDataFB(context)..getBlogs()),
    ],
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
                child,
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: Color(0xFFF5F5F5))),
            initialRoute: "/",
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme:theme,

            home:startWidget,
          );
        },

      ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}