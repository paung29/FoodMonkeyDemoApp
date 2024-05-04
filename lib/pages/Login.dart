import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmonkey/helpers/TrianglePainter.dart';
import 'package:foodmonkey/utils/Api.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();



  var _phoneController = TextEditingController();
  var _phoneError = "";



  var _passwordController = TextEditingController();
  var _passwordError = "";

  var _errorMsg = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(msize: size),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 80, right: 87, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "lib/assets/images/Logo.jpeg",
                          scale: 100,
                        ),
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 35, color: normal),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _errorMsg.add("Phone can't be empty");
                                  return "Phone can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                if (value.length < 7 || value.length > 11) {
                                  setState(() {
                                    _phoneError =
                                        "Phone number have be between 7 and 11";
                                  });
                                } else {
                                  setState(() {
                                    _phoneError = "";
                                  });
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  errorText: _phoneError,
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: "Phone",
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _errorMsg.add("Password can't be empty");
                                  return "Password can't be empty";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                if (value.length < 8) {
                                  setState(() {
                                    _passwordError =
                                        "Password must be more than 8 digits";
                                  });
                                } else {
                                  setState(() {
                                    _passwordError = "";
                                  });
                                }
                              },
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorText: _passwordError,
                                  prefixIcon: Icon(Icons.key),
                                  labelText: "Password",
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    onPressed: () {
                                      var con =
                                          _formKey.currentState?.validate();
                                      if (con == null || con) {
                                        
                                        var phone = _phoneController.text;
                                      
                                        var password = _passwordController.text;

                                        Api.userRegisterLogin(phone, password);
                                      } else {
                                        print(_errorMsg);
                                      }
                                    },
                                    icon: Container(
                                      color: secondary,
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: 30,
                                          ),
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 30, color: primary),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
