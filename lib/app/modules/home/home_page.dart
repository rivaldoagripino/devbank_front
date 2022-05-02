import 'package:devbank_front/app/modules/home/controllers/home_controller.dart';
import 'package:devbank_front/app/modules/home/controllers/home_state.dart';
import 'package:devbank_front/app/modules/home/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = Modular.get();
    homeController.getExtract();
  }

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
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Material(
                                color: Theme.of(context).primaryColorLight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 30.h,
                                    color: Theme.of(context).primaryColorLight,
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Form(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label: Text('Value'),
                                                    ),
                                                    onChanged: (value) {
                                                      homeController
                                                              .moneyRequest
                                                              .value =
                                                          int.parse(value);
                                                    },
                                                  ),
                                                  SizedBox(height: 10),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label:
                                                          Text('Description'),
                                                    ),
                                                    onChanged: (value) {
                                                      homeController
                                                          .moneyRequest
                                                          .description = value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(
                                                    width: 120,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(),
                                                      onPressed: () {
                                                        homeController
                                                            .postIncrementMoney(
                                                                homeController
                                                                    .moneyRequest);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Pay'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Material(
                                color: Theme.of(context).primaryColorLight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 30.h,
                                    color: Theme.of(context).primaryColorLight,
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Form(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label: Text('Value'),
                                                    ),
                                                    onChanged: (value) {
                                                      homeController
                                                              .moneyRequest
                                                              .value =
                                                          int.parse(value);
                                                    },
                                                  ),
                                                  SizedBox(height: 10),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      label:
                                                          Text('Description'),
                                                    ),
                                                    onChanged: (value) {
                                                      homeController
                                                          .moneyRequest
                                                          .description = value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(
                                                    width: 120,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(),
                                                      onPressed: () {
                                                        homeController
                                                            .postDecrementMoney(
                                                                homeController
                                                                    .moneyRequest);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('To spend'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: AnimatedBuilder(
            animation: homeController,
            builder: (context, _) {
              final state = homeController.extractState;
              if (state is HomeStateLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is HomeStateSuccess) {
                return Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      homeController.hideValue == false
                                          ? '****'
                                          : 'R\$ ${state.extractResponse.finalBalance ?? 0}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (homeController.hideValue ==
                                              true) {
                                            homeController.hideValue = false;
                                          } else {
                                            homeController.hideValue = true;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        homeController.hideValue == false
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        homeController.getExtract();
                                      },
                                      child: Text(
                                        "ALL",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        homeController
                                            .getExtractWithType("CREDIT");
                                      },
                                      child: Text(
                                        "CREDIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        homeController
                                            .getExtractWithType("DEBIT");
                                      },
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
                                        'FINAL DATE',
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
                              child: ListView.builder(
                                itemCount:
                                    state.extractResponse.extract!.length,
                                itemBuilder: (context, index) {
                                  if (state.extractResponse.extract == null) {
                                    return Container();
                                  } else {
                                    return CustomCardWidget(
                                        type:
                                            "${state.extractResponse.extract![index].type}",
                                        user:
                                            "${state.extractResponse.extract![index].description}",
                                        value:
                                            "R\$ ${state.extractResponse.extract![index].value}");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
