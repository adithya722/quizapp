import 'package:flutter/material.dart';

class TextBoxWidget extends StatefulWidget {
  final String text;
  final IconData iconName;

  final TextEditingController txtcontroller;
  final dynamic validator;
  final bool hideText;
  const TextBoxWidget(
      {super.key,
      required this.text,
      required this.iconName,
      required this.txtcontroller,
      required this.validator,
      required this.hideText});

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  late bool show = widget.hideText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(17)),
      child: TextFormField(
        controller: widget.txtcontroller,
        validator: widget.validator,
        obscureText: show,
        decoration: InputDecoration(
          hintText: widget.text,
          // border: const OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(90))),
          icon: Icon(
            widget.iconName,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          suffixIcon: widget.hideText
              ? IconButton(
                  icon: Icon(show ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
