import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sneaky Shopper',
          style: GoogleFonts.teko(fontSize: 36),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff03675B),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        shadowColor: Colors.black,
        elevation: 16,
      ),
      backgroundColor: const Color(0xff2D9A8D),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/logo.png'),
                width: 144,
              ),
              Text(
                'Sneaky Shopper',
                style: GoogleFonts.teko(
                  color: const Color(0xffBBFFF7),
                  fontSize: 48,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    hintText: 'E-mail',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: TextField(
                  controller: widget.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    hintText: 'Hasło',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              if (isCreatingAccount == true)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                  child: TextField(
                    controller: widget.confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      prefixIcon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      hintText: 'Powtórz hasło',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: const Color(0xff11DDC4),
                ),
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    // rejestracja
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(
                        () {
                          errorMessage = error.toString();
                        },
                      );
                    }
                  } else {
                    // logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(
                        () {
                          errorMessage = error.toString();
                        },
                      );
                    }
                  }
                },
                child: Text(
                  isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się',
                  style: GoogleFonts.teko(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              if (isCreatingAccount == false) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff11DDC4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: Text(
                      'Utwórz konto',
                      style: GoogleFonts.teko(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
              if (isCreatingAccount == true) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff11DDC4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: Text(
                      'Masz już konto? Zaloguj się',
                      style: GoogleFonts.teko(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
