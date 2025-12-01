import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Ação rápida (apenas exemplo)
  void _onQuickAction(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label acionado'),
        duration: const Duration(milliseconds: 900),
      ),
    );
  }

  // Card reutilizável
  Widget _infoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // Mini cards horizontais
  Widget _miniCard(
    IconData icon,
    String title,
    String subtitle,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => _onQuickAction(context, title),
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.blueAccent),
            const Spacer(),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, size: 32, color: Colors.white70),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Bem vindo de volta,",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Kaique",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => _onQuickAction(context, "Notificações"),
                    icon: const Icon(Icons.notifications_none, size: 28),
                    color: Colors.grey,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              const Text(
                "Seu resumo rápido",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // CARD DE PROGRESSO
              _infoCard(
                child: Row(
                  children: [
                    // Círculo
                    Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "45m",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Texto
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Treino hoje",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Você treinou 45 minutos — ótimo trabalho!",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                    // BOTÃO INICIAR (ATUALIZADO)
                    ElevatedButton(
                      onPressed: () =>
                          _onQuickAction(context, "Iniciar Treino"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Text(
                        "Iniciar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // MINI CARDS CARROSSEL
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _miniCard(
                      Icons.local_drink,
                      "Água",
                      "Registrar água",
                      context,
                    ),
                    _miniCard(
                      Icons.restaurant,
                      "Refeições",
                      "Adicionar comida",
                      context,
                    ),
                    _miniCard(
                      Icons.favorite,
                      "Progresso",
                      "Ver métricas",
                      context,
                    ),
                    _miniCard(
                      Icons.self_improvement,
                      "Alongamento",
                      "5 min",
                      context,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // AÇÕES RÁPIDAS
              _infoCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ActionItem(
                      icon: Icons.add,
                      label: "Adicionar",
                      onTap: () => _onQuickAction(context, "Adicionar"),
                    ),
                    _ActionItem(
                      icon: Icons.history,
                      label: "Histórico",
                      onTap: () => _onQuickAction(context, "Histórico"),
                    ),
                    _ActionItem(
                      icon: Icons.bar_chart,
                      label: "Métricas",
                      onTap: () => _onQuickAction(context, "Métricas"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  "Recomendação do dia",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),

              _infoCard(
                child: const Text(
                  "Hoje: experimente um treino leve de 20 minutos para recuperação.",
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// Componente de ação rápida
class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 84,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.blueAccent),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
