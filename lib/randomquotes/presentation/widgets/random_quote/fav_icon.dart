import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FavIcon extends StatelessWidget {

  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(vertical: 20),
        child:  Center(child: InkWell(
            child: Icon(CupertinoIcons.heart,size: 40,color: Colors.red,)))
    );
  }
}
