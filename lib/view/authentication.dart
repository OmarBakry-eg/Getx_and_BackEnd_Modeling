import 'package:e_learning/backend managament/database/local.dart';
import 'package:e_learning/state%20managament/controller/control_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import 'package:get/get.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('E-Learning Project'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: SingleChildScrollView(
                child: AuthCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final AuthInAction controller = Get.put(AuthInAction());
  AnimationController animationController;
  Animation<double> fadeAnimation;
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DataInLocal.useValueToNavigate(context);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GetX<AuthInAction>(builder: (e) {
        return Column(
          children: [
            Text(
              e.authModeling.value.isSignUp ? 'SIGN UP' : 'LoOoGIN',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFiledEditing(
              labelName: 'E-mail',
              hint: 'type your email',
              onChangedFunc: (String val) {
                e.authModeling.value.email = val;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFiledEditing(
              labelName: 'Password',
              hint: 'type your pass',
              onChangedFunc: (String val) {
                e.authModeling.value.password = val;
              },
            ),
            SizedBox(
              height: e.authModeling.value.isSignUp ? 20 : 5,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              constraints: BoxConstraints(
                minHeight: e.authModeling.value.isSignUp ? 60 : 0,
                maxHeight: e.authModeling.value.isSignUp ? 120 : 0,
              ),
              child: FadeTransition(
                opacity: fadeAnimation,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Re-Enter your pass',
                    hintText: 'type your pass again',
                    focusedBorder: outlineInputBorder.copyWith(
                      borderSide: BorderSide(
                        color:
                            e.authModeling.value.ok ? Colors.blue : Colors.red,
                      ),
                    ),
                    enabledBorder: outlineInputBorder.copyWith(
                      borderSide: BorderSide(
                        color:
                            e.authModeling.value.ok ? Colors.grey : Colors.red,
                      ),
                    ),
                  ),
                  onChanged: (String val) {
                    e.typing(val);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                print(e.authModeling.value.isSignUp);
                if (_formKey.currentState.validate()) {
                  if (e.authModeling.value.isSignUp == false) {
                    e.login(context);
                  } else {
                    print(e.authModeling.value.password);
                    print(e.authModeling.value.passwordConfirm);
                  }
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: e.authModeling.value.isSignUp ||
                        e.authModeling.value.spinner
                    ? 300
                    : 100,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: e.authModeling.value.spinner
                      ? Text(
                          'Waiting....',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : Text(
                          e.authModeling.value.isSignUp
                              ? 'Create Account'
                              : 'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FlatButton(
              onPressed: () {
                e.chooseMode(animationController);
              },
              child: Text(
                e.authModeling.value.isSignUp
                    ? 'Have an account ?'
                    : 'Don\'t have an account ?',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
