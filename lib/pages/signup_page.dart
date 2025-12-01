import 'dart:ui';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo imagem
          Positioned.fill(
            child: Image.asset("assets/gym-login.png", fit: BoxFit.cover),
          ),

          // Blur + escurecimento
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: Colors.black.withValues(alpha: 0.35)),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              // evita bugs de scroll
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Crie sua conta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    const SizedBox(height: 8),
                    const Text(
                      "Seja bem-vindo ao NutriFit!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),

                    const SizedBox(height: 40),

                    campo("Nome"),
                    const SizedBox(height: 16),
                    campo("Email"),
                    const SizedBox(height: 16),
                    campo("Senha", obscure: true),

                    const SizedBox(height: 28),

                    // Botão Criar Conta
                    GestureDetector(
                      onTap: () {
                        // depois aqui coloca funcionalidade real
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        "Já tenho conta",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget campo(String label, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: Colors.blueAccent,
    );
  }
}
