import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
    this.user,
    this.value,
    this.type,
  });

  final String? user;
  final String? value;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 15.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 3, offset: Offset(2, 3))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DESCRIPTION"),
                  Text(user!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("VALUE"),
                  Text(value!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TYPE"),
                  Text(type!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
