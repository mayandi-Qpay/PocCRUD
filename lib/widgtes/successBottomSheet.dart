import 'package:flutter/material.dart';

successSheet(context, String amountText) => showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Amount Added Successfully",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Your Entered Amount ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "₹ ${amountText}",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700))
                  ])),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black87)),
                      child: const Text("Ok",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ));
