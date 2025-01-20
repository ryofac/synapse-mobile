import 'package:flutter/material.dart';
import 'package:synapse/clasroom/pages/classroom_page.dart';
import 'package:synapse/login/containers/login_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    "Synapse",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Seu aplicativo de gerenciamento de turmas",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: Text(
                          "Faça Login",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (input) => input != null && input.length < 4
                            ? "A senha deve ser maior que 4 caracteres"
                            : null,
                        decoration: InputDecoration(
                          hintText: "Endereço de Email",
                          prefixIcon: Icon(Icons.email,
                              color: Theme.of(context).colorScheme.onPrimary),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: hidePassword,
                        validator: (input) =>
                            input != null && !input.contains("@")
                                ? "Endereço de email inválido"
                                : null,
                        decoration: InputDecoration(
                            hintText: "Senha",
                            prefixIcon: Icon(Icons.lock,
                                color: Theme.of(context).colorScheme.onPrimary),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.2),
                              ),
                            ),
                            suffixIcon: IconButton(
                                color: Theme.of(context).colorScheme.onPrimary,
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                icon: hidePassword
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.all(8.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ClassroomPage()));
                        },
                        child: const Center(child: Text("Entrar")),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
