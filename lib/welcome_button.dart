import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  WelcomeButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.pink,
      splashColor: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.explore,
              color: Colors.amber,
            ),
            SizedBox(width: 8.0,),
            Text(
              "WELCOME",
              style: TextStyle(color: Colors.white,
              ),
            ),
          ],
        ),
        
      ),
      
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}