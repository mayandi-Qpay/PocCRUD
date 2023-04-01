import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poc/widgtes/successBottomSheet.dart';

import '../widgtes/moneyPicker.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  TextEditingController amountText = TextEditingController(text: "0");
  final CollectionReference _cloudCollection =
      FirebaseFirestore.instance.collection('history');
  String amountString = "";
  int amountDouble = 0;
  bool cursorControl = true;

  toast(String status, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor:
            status == "Success" ? Colors.blue[400] : Colors.red[300],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  proceed() {
    if (amountText.text.isEmpty) {
      toast('Fail', "Please enter amount");
    } else if (amountText.text == "0" ||
        amountText.text == "00" ||
        amountText.text == "000" ||
        amountText.text == "0000" ||
        amountText.text == "00000") {
      toast('Fail', "Please enter valid amount");
    } else {
      _cloudCollection.add({
        "name": "",
        "amount": amountText.text,
        "date": DateTime.now().toString()
      });
      successSheet(context, amountText.text);
    }
  }

  addNumber(String value) {
    setState(() {
      cursorControl = false;
    });

    if (amountText.text.isEmpty) {
      setState(() {
        amountText.text = value;
      });
      setState(() {
        amountString = amountText.text;
        amountDouble = int.parse(amountString);
      });
      return;
    }
    amountString = amountText.text;
    amountDouble = int.parse(amountString);
    amountDouble = amountDouble + int.parse(value);

    if (amountDouble <= 99999) {
      amountText.text = amountDouble.toString();
      return;
    } else {
      toast("Fail", "Payment can't be more than ₹ 99,999");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      child: Center(
                        child: Text(
                          'Add Money',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: 200,
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 210),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.black12,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.transparent, spreadRadius: 3),
                              ],
                            ),
                            child: Center(
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                showCursor: cursorControl,
                                onChanged: (str) {
                                  if (amountText.text == "99999") {
                                    toast("Fail",
                                        "Payment can't be more than ₹ 99,999");
                                  }
                                },
                                onEditingComplete: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700),
                                maxLength: 5,
                                controller: amountText,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 13),
                                  fillColor: Colors.transparent,
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MoneyPicker(
                                label: '200',
                                onTap: () {
                                  addNumber("200");
                                },
                              ),
                              MoneyPicker(
                                label: '500',
                                onTap: () {
                                  addNumber("500");
                                },
                              ),
                              MoneyPicker(
                                label: '1000',
                                onTap: () {
                                  addNumber("1000");
                                },
                              ),
                              MoneyPicker(
                                label: '2000',
                                onTap: () {
                                  addNumber("2000");
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              proceed();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "PROCEED",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
