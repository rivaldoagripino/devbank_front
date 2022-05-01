import 'package:devbank_front/app/modules/home/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: [
              Container(
                width: 90.w,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3,
                        offset: Offset(2, 3))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'R$ 3260.20',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.remove_red_eye_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 4,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "ALL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "CREDIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "DEBIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3,
                                    offset: Offset(2, 3))
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'START DATE',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3,
                                    offset: Offset(2, 3))
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'START DATE',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50.h,
                      child: ListView(
                        children: const [
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                          CustomCardWidget(
                              type: "CREDIT", user: "rivaldo", value: "R30.00"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
