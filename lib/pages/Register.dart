import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmonkey/helpers/TrianglePainter.dart';
import 'package:foodmonkey/utils/Api.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();

  var _nameController = TextEditingController();
  var _nameError = "";

  var _phoneController = TextEditingController();
  var _phoneError = "";

  var _emailController = TextEditingController();
  var _emailError = "";

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
                      "Register",
                      style: TextStyle(fontSize: 35, color: normal),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                 _errorMsg.add("Name can't be empty");
                                 return "Name can't be empty";
                                }else{
                                  return null;
                                }
                                
                              },
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    _nameError = "Name can't be empty";
                                  });
                                } else {
                                  _nameError = "";
                                }
                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  errorText: _nameError,
                                  labelText: "Username",
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
                                if(value == null || value.isEmpty){
                                  _errorMsg.add("Phone can't be empty");
                                  return "Phone can't be empty";
                                }else{
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                if(value.length < 7 || value.length > 11){
                                  setState(() {
                                    _phoneError = "Phone number have be between 7 and 11";
                                  });
                                }else{
                                  setState(() {
                                    _phoneError = "";
                                  });
                                }
                              },
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                if(value == null || value.isEmpty){
                                  _errorMsg.add("Email can't be empty");
                                  return "Email can't be empty";
                                }else{
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                if(value.length < 7){
                                  setState(() {
                                    _emailError="Email can't be empty";
                                  });
                                }else{
                                  setState(() {
                                    _emailError = "";
                                  });
                                }
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                  errorText: _emailError,
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "Email",
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
                                if(value == null || value.isEmpty){
                                  _errorMsg.add("Password can't be empty");
                                  return "Password can't be empty";
                                }else{
                                  return null;
                                }
                              },
                              onChanged: (value){
                                if(value.length < 8){
                                  setState(() {
                                    _passwordError = "Password must be more than 8 digits";
                                  });
                                }else{
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
                                      var con = _formKey.currentState?.validate();
                                      if(con==null|| con){
                                      var name = _nameController.text;
                                      var phone = _phoneController.text;
                                      var email = _emailController.text;
                                      var password = _passwordController.text;

                                      Api.userRegister(
                                          name, email, phone, password);
                                      }else{
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
                                            "Register",
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
