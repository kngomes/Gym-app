# NutriFit App

Aplicativo Flutter minimalista para gerenciamento de treinos e nutrição.

## 📱 Funcionalidades

- **Login / Sign Up** com imagem de fundo e blur
- **Home Page** com:
  - Resumo rápido do treino
  - Cards de água, refeições, progresso e alongamento
  - Ações rápidas (Adicionar, Histórico, Métricas)
- **Treinos**:
  - Card do Treino do Dia
  - Histórico dos últimos treinos
- **Bottom Navigation** para alternar entre Home, Treinos, Nutrição e Perfil
- **Banco de dados local (sqflite)** para CRUD rápido de treinos (to-do list de treinos)

## 🛠 Tecnologias

- Flutter / Dart
- SQLite (via `sqflite` e `path`)
- Material Design

## 💾 Banco de dados

Usamos **sqflite** para salvar os treinos localmente no dispositivo, com operações CRUD:

- **C**reate: Adicionar um treino
- **R**ead: Listar treinos
- **U**pdate: Atualizar informações de treinos
- **D**elete: Remover treino

## 🚀 Como executar

1. Clone o projeto:
```bash
git clone https://github.com/SEU_USUARIO/REPO.git
