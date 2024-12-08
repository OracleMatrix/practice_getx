import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_getx/Controllers/auth_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final AuthController c = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: FlutterLogo(
                  size: 150,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter your email'),
                  controller: c.emailController.value,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter your password'),
                  controller: c.passwordController.value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: Get.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        bool response = await c.getUser(
                            c.emailController.value.text,
                            c.passwordController.value.text);
                        if (response) {
                          Get.showSnackbar(const GetSnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                            title: 'Login',
                            message: 'Welcome',
                          ));
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                            title: 'Login',
                            message: 'Error',
                          ));
                        }
                      }
                    },
                    child: Obx(() => c.isLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Login')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
