import 'package:ecommerce_sample/src/features/home/presentation/screens/home.dart';
import 'package:ecommerce_sample/src/features/onboarding/presentation/screens/onboarding.dart';
import 'package:ecommerce_sample/src/helpers/extensions.dart';
import 'package:ecommerce_sample/src/helpers/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const String route = '/login';
  static const String name = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: Image.asset('assets/cartalogo.png'),
        backgroundColor: Colors.transparent,
        toolbarHeight: screensize.height * 0.3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: TopRoundedContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: validatorFormFields,
                        controller: _userController,
                        decoration: const InputDecoration(
                          labelText: 'Ingresar cualquier correo',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: validatorFormFields,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Ingresar cualquier contraseña',
                          suffixIcon: IconButton(
                            icon: showPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: showPassword,
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(OnboardingScreen.route);
                          },
                          child: const Text('Crear cuenta'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: screensize.width * 0.8,
        child: ElevatedButton(
          onPressed: () => validateForm(context),
          child: Text(
            context.l10n.login,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  String? validatorFormFields(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else {
      return null;
    }
  }

  void validateForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      GoRouter.of(context).go(Home.route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Debe ingresar el usuario y la contraseña, para continuar"),
        ),
      );
    }
  }
}
