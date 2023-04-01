import 'package:flutter/material.dart';

class MoneyPicker extends StatefulWidget {
  const MoneyPicker({
    super.key,
    required this.onTap,
    required this.label,
  });
  final onTap;
  final String label;

  @override
  State<MoneyPicker> createState() => _MoneyPickerState();
}

class _MoneyPickerState extends State<MoneyPicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Row(
                children: [
                  const Center(
                    child: Icon(
                      Icons.currency_rupee,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Text(
                    widget.label,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
