import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RandomButton extends StatelessWidget {

   RandomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: Colors.white54, width: 0.5)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(CupertinoIcons.refresh_thick,size: 20,color: Colors.white,),
        ));
  }
}
