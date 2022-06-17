import 'package:butterfly_project/pages/initial_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    super.initState();
    loading(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                )
            ),
            child: logo()
          ),
        )
    );
  }
}


void loading(context){
  Future.delayed(const Duration(milliseconds: 2000)).then((value) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InitialPage()));
  });
}

logo(){
  Center image = Center(
    child: Image.asset('assets/images/book.png', width: 150,)
  );

  Text texto = const Text(
      'WingBook',
      style: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: 'Exo',
    ),
  );

  MainAxisAlignment alinhar = MainAxisAlignment.center;

  return Center(child: Column(mainAxisAlignment: alinhar, children: [image, texto]));
}