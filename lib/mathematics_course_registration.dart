import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_management/login_page.dart';
import 'package:learning_management/mathematics_course.dart';
import 'package:learning_management/test_page.dart';
import 'home_page.dart';

class MCourseRegistration extends StatefulWidget {
  const MCourseRegistration({Key? key, required String title})
      : super(key: key);

  @override
  State<MCourseRegistration> createState() => _MCourseRegistrationState();
}

class _MCourseRegistrationState extends State<MCourseRegistration> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController couponCodeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Expanded(
        flex: 15,
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          color: Colors.grey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const TestPage(title: "Home Page")));
                    },
                    icon: const Icon(Icons.computer_rounded),
                    iconSize: 50,
                  ),
                  Text(
                    'Learning Management Software',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 20,
        child: Container(
          color: Colors.grey[200],
          width: 500,
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Purchase",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const LoginPage(
                                                title: "Home Page")));
                                  },
                                text: ' Click here to login',
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 65,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.grey[200],
              width: 500,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                  EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: const Text(
                  "Billing Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            buildText('Email Address'),
            buildTextField(emailController),
            buildText('Confirm Email Address'),
            buildTextField(confirmEmailController),
            buildText('Password'),
            buildTextField(passwordController),
            buildText('Confirm Password'),
            buildTextField(confirmPasswordController),
            buildText('First Name'),
            buildTextField(firstNameController),
            buildText('Last Name'),
            buildTextField(lastNameController),
            buildText('Address'),
            buildTextField(addressController),
            buildText('City'),
            buildTextField(cityController),
            buildText('Country'),
            buildTextField(countryController),
            buildText('State'),
            buildTextField(stateController),
            buildText('Pin Code'),
            buildTextField(pinCodeController),
            buildText('Mobile Number'),
            buildTextField(mobileController),
            buildText('Coupon Code'),
            buildTextField(couponCodeController),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              width: 370,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Congratulations!! Now you can Login')),

                    );
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                        .then((value) {
                      print("Successfulyy signed up the user!");
                    } ).catchError((error){
                      print("Failed to Sign up the user!");
                      print(error.toString());
                    });
                  }
                  FirebaseFirestore.instance.collection("students").add(
                      {
                        "firstName": firstNameController.text,
                        "lastName": lastNameController.text,
                        "email": emailController.text,
                        "address": addressController.text,
                        "city": cityController.text,
                        "state": stateController.text,
                        "country": countryController.text,
                        "mobileNumber": mobileController.text,
                        "pinCode": pinCodeController.text

                      }
                  ).then((value){
                    print("successfully added the student");
                  }).catchError((error)
                  {
                   print("Failed to add the student");
                   print(error.toString());
                  });
                },
                child: Text('Buy Now'),
              ),
            )
            ],
          ),
        ),
      ),
    ))]
    ,
    )
    );
  }

  Align buildText(String fieldName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: RichText(
            text: TextSpan(
              text: fieldName,
              style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: const <TextSpan>[
                TextSpan(
                    text: ' * ',
                    style: TextStyle(
                      color: Colors.red,
                    ))
              ],
            )),
      ),
    );
  }

  Padding buildTextField(TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: getTextField(textEditingController),
      ),
    );
  }

  TextFormField getTextField(TextEditingController textEditingController) {
    return TextFormField(
      decoration: const InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        final _emailAddress = emailController.text;
        final _confiremailAddress = confirmEmailController.text;
        final _password = passwordController.text;
        final _confirmPassword = confirmPasswordController.text;
        if(_emailAddress != _confiremailAddress){
          return 'email address and confirm email address are not same';
        }
        if(_password != _confirmPassword){
          return 'password and confirm password are not same';
        }
        if (value == null || value.isEmpty) {
          return 'This Field cannot be empty';
        }
        return null;
      },
      controller: textEditingController,
    );
  }
}
