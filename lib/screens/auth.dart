import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;
  var _enteredEmail='';
  var _enteredPassword='';
  final _formKey=GlobalKey<FormState>();
  void _submit()
  {
   final isValid= _formKey.currentState!.validate();
   if(isValid)
   {
   _formKey.currentState!.save();
   print(_enteredEmail);
   print(_enteredPassword);
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Register here'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                width: 200,
                child: Image.asset(
                  'assets/images/chat.png',
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, //column elements will contain only that space which they require
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Email address'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredEmail=newValue!;
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().length<6) {
                                return 'Password should be at least of 6 characters';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredPassword=newValue!;
                            },
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            onPressed: _submit,
                            child: Text(_isLogin ? 'Login' : 'Signup'),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin; //_isLogin?false:true;
                                });
                              },
                              child: Text(_isLogin
                                  ? 'Create account'
                                  : 'I already have an account'))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
