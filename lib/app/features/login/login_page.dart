import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff2D9A8D),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                          color: const Color(0xffBBFFF7), fontSize: 48),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffD9D9D9),
                                prefixIcon:
                                    Icon(Icons.key, color: Colors.black),
                                hintText: 'Hasło',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            cursorColor: Colors.black)),
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        child: TextField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xffD9D9D9),
                              prefixIcon:
                                  Icon(Icons.check, color: Colors.black),
                              hintText: 'Powtórz hasło',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            cursorColor: Colors.black),
                      ),
                    ],
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<RootCubit>().notCreatingAccount();
                          },
                          child: Text(
                            'Masz już konto? Zaloguj się',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                    if (state.isCreatingAccount == false) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<RootCubit>().creatingAccount();
                          },
                          child: Text(
                            'Nie masz konta? Zarejestruj się',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: const Color(0xffff40ac),
                      ),
                      onPressed: () async {
                        if (state.isCreatingAccount == true) {
                          // rejestracja
                          context.read<RootCubit>().register(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        } else {
                          // logowanie
                          context.read<RootCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: Text(
                        state.isCreatingAccount == true
                            ? 'Zarejestruj się'
                            : 'Zaloguj się',
                        style:
                            GoogleFonts.teko(color: Colors.black, fontSize: 32),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.errorMessage,
                        style:
                            GoogleFonts.teko(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
