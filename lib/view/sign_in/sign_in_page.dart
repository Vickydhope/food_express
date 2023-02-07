import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_express/res/drawables.dart';
import 'package:food_express/view/dashboard/dashboard_page.dart';
import 'package:food_express/view/sign_up/sign_up_page.dart';
import 'package:food_express/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const ScreenBackground(),
          SafeArea(
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              logoWithName,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.redAccent,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text(
                        "Or Continue With",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.withOpacity(0.3),
                                    ),
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(logoGoogle),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Text(
                                    "Google",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.withOpacity(0.3),
                                    ),
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(logoFacebook),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Text(
                                    "Facebook",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text(
                        "Forgot Your Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.3),
                              ),
                            ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
