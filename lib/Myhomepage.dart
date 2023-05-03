import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/Texrcomponet.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Password2 = TextEditingController();
  bool pass = true;
  bool pass2 = true;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Mytextcomponet(
                  hint: "Name",
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                  ),
                  controller: Name,
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name == null || name.trim().isEmpty) {
                      return "Pless Enter Name";
                    }
                    // else
                    //   {
                    //     return null;
                    //   }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Mytextcomponet(
                  hint: "Number",
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  controller: Number,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 10,
                  validator: (number) {
                    if (number == null || number.trim().isEmpty) {
                      return "Pless Enter Number";
                    } else {
                      if (number.startsWith("0")) {
                        return "Pless Enter valid number";
                      } else if (number.length != 10) {
                        return "Pless Enter valid number";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Mytextcomponet(
                  hint: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  controller: Email,
                  validator: (email) {
                    if (email == null || email.trim().isEmpty) {
                      return "Pless Enter Email";
                    } else {
                      Pattern pattern =
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
                      RegExp regexp = RegExp(pattern.toString());

                      if (regexp.hasMatch(email.trim())) {
                        return null;
                      } else if (email.startsWith("@")) {
                        return "Email Do Not Start With '@' ";
                      } else {
                        return "Ples enter valid Email";
                      }
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                Mytextcomponet(
                  hint: "Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        pass = !pass;
                        setState(() {});
                      },
                      icon: pass
                          ? Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                          : Icon(Icons.visibility_off, color: Colors.grey)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: pass,
                  validator: (password) {
                    if (password == null || password.trim().isEmpty) {
                      return "Pless Enter Password";
                    } else {
                      Pattern pattern =
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
                      RegExp regexp = RegExp(pattern.toString());
                      if (regexp.hasMatch(password.trim())) {
                        if (Password.text == Password2.text) {
                          return null;
                        } else {
                          return "Not Matsh Password";
                        }
                        // return null;
                      } else {
                        return "Pless Enter Strond Password";
                      }
                    }
                  },
                  controller: Password,
                ),
                SizedBox(
                  height: 20,
                ),
                Mytextcomponet(
                  hint: "Conform Password",
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                  ),
                  controller: Password2,
                  obscureText: pass2,
                  // suffixIcon: IconButton(onPressed: (){ pass2 =!pass2;setState(() {}); }, icon: pass2?Icon(Icons.visibility,color: Colors.grey,):Icon(Icons.visibility_off,color: Colors.grey)),

                  keyboardType: TextInputType.visiblePassword,
                  validator: (password2) {
                    if (password2 == null || password2.trim().isEmpty) {
                      return "Pless Enter Conform Password";
                    } else {
                      if (Password.text == Password2.text) {
                        return null;
                      } else {
                        return "Not Matsh Password";
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        print("valid");
                      }
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
