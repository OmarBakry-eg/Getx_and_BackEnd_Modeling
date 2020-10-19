// Future<String> read() {
//   final Future<String> token = DataInLocal.readFromLocal();
//   return token;
// }

//
// class LoginState extends StatefulWidget {
//   final String email, password;
//   final bool spinning;
//   final GlobalKey<FormState> _formKey;
//   LoginState({this.email, this.password, GlobalKey<FormState> formKey, this.spinning}) : _formKey = formKey;
//   @override
//   _LoginStateState createState() => _LoginStateState(email: email,password: password,formKey: _formKey,spinner: spinning);
// }
//
// class _LoginStateState extends State<LoginState> {
//    String email, password;
//    bool spinner;
//    GlobalKey<FormState> _formKey;
//    _LoginStateState({GlobalKey<FormState> formKey,this.spinner,this.password,this.email}) : _formKey = formKey;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         TextFiledEditing(
//           labelName: 'Email',
//           hint: 'Type your Email',
//           onChangedFunc: (String val) {
//             email = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextFiledEditing(
//           labelName: 'Password',
//           hint: 'type pass',
//           onChangedFunc: (String val) {
//             password = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         RaisedButton(
//           onPressed: () async {
//             if (_formKey.currentState.validate()) {
//               setState(() {
//                 spinner = true;
//               });
//               await AuthController.authFunc(
//                 email: email,
//                 password: password,
//                 login: true,
//               );
//               print('validate');
//               setState(() {
//                 spinner = false;
//               });
//             }
//             Urls.errorMessage == 'no'
//                 ? Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           ViewDetails(token: AuthController.authModel.token),
//                     ),
//                   )
//                 : errorWhileSignUp(Urls.errorMessage, context);
//           },
//           child: Text('Sign In'),
//         ),
//       ],
//     );
//   }
// }
//
// class RegisteringState extends StatefulWidget {
//   final String email, password ,gender , username;
//   final bool spinning;
//   final GlobalKey<FormState> _formKey;
//   RegisteringState ({this.email, this.password, GlobalKey<FormState> formKey, this.spinning ,this.gender,this.username}) : _formKey = formKey;
//   @override
//   _RegisteringStateState createState() => _RegisteringStateState(email: email,password: password,formKey: _formKey,spinner: spinning , gender: gender, username: username);
// }
//
// class _RegisteringStateState extends State<RegisteringState> {
//   String email, password , gender ,username;
//   bool spinner;
//   GlobalKey<FormState> _formKey;
//   _RegisteringStateState({GlobalKey<FormState> formKey,this.spinner,this.password,this.email,this.gender,this.username}) : _formKey = formKey;
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         TextFiledEditing(
//           labelName: 'Email',
//           hint: 'Type your Email',
//           onChangedFunc: (String val) {
//             email = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextFiledEditing(
//           labelName: 'Password',
//           hint: 'type pass',
//           onChangedFunc: (String val) {
//             password = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextFiledEditing(
//           labelName: 'Gender',
//           hint: 'your gender',
//           onChangedFunc: (String val) {
//             gender = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextFiledEditing(
//           labelName: 'username',
//           hint: 'name',
//           onChangedFunc: (String val) {
//             username = val;
//           },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         RaisedButton(
//           onPressed: () async {
//             if (_formKey.currentState.validate()) {
//               setState(() {
//                 spinner = true;
//               });
//               await AuthController.authFunc(
//                 email: email,
//                 password: password,
//                 username: username,
//                 gender: gender,
//                 login: false,
//               );
//               print('validate');
//               setState(() {
//                 spinner = false;
//               });
//             }
//             Urls.errorMessage == 'no'
//                 ? Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ViewDetails(
//                     token: AuthController.authModel.token),
//               ),
//             )
//                 : errorWhileSignUp(Urls.errorMessage, context);
//           },
//           child: Text('Sign up'),
//         ),
//       ],
//     );
//   }
// }

// await AuthController.authFunc(
// email: email,
// password: password,
// username: username,
// gender: gender,
// login: false,
// );

// Urls.errorMessage == 'no'
// ? Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => ViewDetails(
// token: AuthController.authModel.token),
// ),
// )
// : errorWhileSignUp(Urls.errorMessage, context);

// setState(() {
//   spinner = true;
// });
// await AuthController.authFunc(
//   email: email,
//   password: password,
//   login: true,
// );
// print('validate');
// setState(() {
//   spinner = false;
// });
// Urls.errorMessage == 'no'
//     ? Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ViewDetails(
//             token: AuthController.authModel.token,
//           ),
//         ),
//       )
//     : errorWhileSignUp(Urls.errorMessage, context);
