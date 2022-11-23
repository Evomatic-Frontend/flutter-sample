import 'package:flutter/material.dart';
import 'utils/utils.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // -- LOGO
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/images/evomatic_logo.png'),
              ),
            ),

            // -- USERNAME
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),

            // -- PASSWORD
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter a password'),
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Recupera password',
                      //style: TextStyle(color: Colors.white, fontSize: 25),
                    ))),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton(
                  onPressed: () async {
                    final r = await login();
                    print(r);
                    //if (r == 200)
                    //Navigator.push(context,
                    //    MaterialPageRoute(builder: (_) => const MyApp()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
