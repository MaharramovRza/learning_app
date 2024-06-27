import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/pages.dart';
import 'package:learning_app/firebase_options.dart';
import 'package:learning_app/pages/bloc_providers.dart';
import 'common/values/colors.dart';
import 'common/routes/routes.dart';
import 'global.dart';




void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[...AppPages.allBlocProviders(context)], //Problem var
        child:ScreenUtilInit(
            builder: (context,child)=> MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color:AppColors.primaryText
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white
                )
              ),
              //home:const Welcome(),
              onGenerateRoute: AppPages.GenerateRouteSettings,
              // routes: {
              //   "myHomePage":(context)=>const MyHomePage(title: '',),
              //   "signIn":(context)=>const SignIn(),
              //   "register":(context)=>const Register(),
              // },
            )
        ) ,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }
//
//   @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//   //       title: Text(widget.title),
//   //     ),
//   //     body: Center(
//   //       child: BlocBuilder<AppBlocs,AppStates>(builder: (BuildContext context, AppStates state) {
//   //         return Column(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: <Widget>[
//   //             const Text(
//   //               'You have pushed the button this many times:',
//   //             ),
//   //             Text(
//   //               '${state.counter}',
//   //               style: Theme.of(context).textTheme.headlineMedium,
//   //             ),
//   //           ],
//   //         );
//   //       },),
//   //     ),
//   //     floatingActionButton: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //       children: [
//   //         FloatingActionButton(
//   //           heroTag: "heroTag1",
//   //           onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Increment()),
//   //           tooltip: 'Increment',
//   //           child: const Icon(Icons.add),
//   //         ),
//   //         FloatingActionButton(
//   //           heroTag: "heroTag2",
//   //           onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Decrement()),
//   //           tooltip: 'Decrement',
//   //           child: const Icon(Icons.minimize),
//   //         )
//   //       ],
//   //     ), // This trailing comma makes auto-formatting nicer for build methods.
//   //   );
//   // }
// }
