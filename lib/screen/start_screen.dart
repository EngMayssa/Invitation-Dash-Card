import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key, required this.openDialog}) : super(key: key);
  final Future Function() openDialog;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('images/bird.png'),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          'اهلا وسهلاً بكم في التطبيق الخاص بداش لإرسال دعوات',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Welcome to the Dash\'s App to help him send invitations',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
            onPressed: () async {
              await openDialog();
            },
            child: Text(
              "للبدء",
              style: Theme.of(context).textTheme.headline2,
            ),
            style: OutlinedButton.styleFrom(shape: const StadiumBorder())),
      ],
    );
  }
}

