# Synapse Mobile

[![GitHub Stars](https://img.shields.io/github/stars/ryofac/synapse-mobile?style=social)](https://github.com/ryofac/synapse-mobile)

Synapse Mobile é um gerenciador de salas de aula para Android, construído com o framework Flutter.  Seu objetivo é fornecer uma experiência nativa para interagir com o protocolo de comunicação descentralizado Matrix.

**IMPORTANTE:** Este projeto está em um estágio *muito inicial* de desenvolvimento.  Espere bugs, funcionalidades incompletas e potencial instabilidade. Use-o *apenas para testes e experimentação*.

## Funcionalidades (Atuais e Planejadas)

Esta é uma lista das funcionalidades, categorizadas pelo seu estado atual:

**Implementadas Atualmente (Funcionalidade Básica):**

*   **Interface de Usuário Básica:** Uma interface rudimentar existe, permitindo interação básica.
*   **Login:** Você pode fazer login.
*   **Lista de Salas:** Uma lista básica de salas é exibida.
*   **Logout:** Implementado

**Planejadas/Em Progresso (Não Totalmente Funcionais):**

*   **Funcionalidade Completa da Lista de Salas:** Incluindo detalhes da sala, entrar, sair, etc.
*   **Formatação de Texto Rico:** Suporte para Markdown ou outros formatos de texto rico.
*   **Suporte a Mídia:** Envio e recebimento de imagens, vídeos e outros arquivos.
*   **Notificações:** Notificações push para novas mensagens.
*   **Gerenciamento de Perfil de Usuário:** Editar seu perfil, definir avatares, etc.
*   **Configurações:** Uma tela de configurações para configurar o aplicativo.

## Instalando o projeto

**Pré-requisitos:**

*   **Flutter SDK:** Você *deve* ter o Flutter SDK instalado e configurado. Siga as instruções oficiais: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   **Android Studio ou VS Code (Recomendado):** Embora você possa usar outros editores, estes fornecem a melhor experiência de desenvolvimento Flutter. Instale os plugins Flutter e Dart.
*   **Emulador Android ou Dispositivo Físico:** Você precisará de um emulador Android (configurado através do Android Studio) ou um dispositivo Android físico conectado ao seu computador no modo de desenvolvedor.

**Executando o Aplicativo:**

1.  **Clone o Repositório:**

    ```bash
    git clone https://github.com/ryofac/synapse-mobile.git
    cd synapse-mobile
    ```

2.  **Obtenha as Dependências:**

    ```bash
    flutter pub get
    ```

3.  **Execute o Aplicativo:**

    ```bash
    flutter run
    ```

    Isso construirá o aplicativo e o iniciará em seu dispositivo ou emulador conectado. A primeira compilação pode demorar um pouco.
    
**Solução de Problemas:**

*   **`flutter doctor`:** Execute `flutter doctor` em seu terminal.  Este comando verifica sua instalação do Flutter e identifica quaisquer dependências ausentes ou problemas de configuração.  Resolva quaisquer problemas que ele relatar.
*   **Limpar o Projeto:** Às vezes, artefatos de compilação podem causar problemas. Tente executar `flutter clean` para removê-los e, em seguida, reconstrua com `flutter run`.
*   **Problemas do Emulador:** Certifique-se de que seu emulador esteja configurado corretamente e tenha acesso à internet.
*   **Conexão do Dispositivo:** Se estiver usando um dispositivo físico, certifique-se de que ele esteja conectado no modo de desenvolvedor e que seu computador o reconheça. Verifique `adb devices` (Android Debug Bridge) se você estiver familiarizado com o desenvolvimento Android.
*   **Mensagens de Erro:** Observe atentamente as mensagens de erro no console. O Flutter geralmente fornece mensagens de erro detalhadas que podem ajudar a identificar o problema.
