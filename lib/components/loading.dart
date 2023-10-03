import 'package:chatapp/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20,
        height: 20,
        child: CupertinoActivityIndicator(
          color: MyColros.primaryColor,
        ));
  }
}
