import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFiledEditing extends StatelessWidget {
  final String labelName;
  final String hint;
  final Function onChangedFunc;
  TextFiledEditing({this.hint, this.labelName, this.onChangedFunc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (String val) {
          if (val.isEmpty) {
            return 'fill the field';
          }
          return null;
        },
        onChanged: onChangedFunc,
        decoration: InputDecoration(
          border: outlineInputBorder,
          errorBorder: errorOutBorder,
          focusedErrorBorder: errorOutBorder,
          labelText: labelName,
          hintText: hint,
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide(color: Colors.blue),
);

OutlineInputBorder errorOutBorder = outlineInputBorder.copyWith(
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

Future<void> errorWhileSignUp(errorMessage, BuildContext context) {
  return showCupertinoDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Error While Registering'),
            content: Text(errorMessage.toString()),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ));
}
