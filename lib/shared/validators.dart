String? usernameValidator(String? input) {
  final usernameRegex = RegExp(r'^[a-zA-Z0-9_.]{3,15}$');

  if (input == null || input.isEmpty) {
    return 'O nome de usuário não pode estar vazio.';
  } else if (!usernameRegex.hasMatch(input)) {
    return 'O nome de usuário deve ter entre 3 e 15 caracteres e pode conter letras, números, underscores e pontos.';
  }
  return null;
}

String? passwordValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'A senha não pode estar vazia.';
  } else if (input.length <= 4) {
    return 'A senha deve ter mais que 4 caracteres.';
  }
  return null;
}

String? nameValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'O nome não pode estar vazio.';
  } else if (!RegExp(r'^[a-zA-Zà-úÀ-Ú\s]+$').hasMatch(input)) {
    return 'O nome só pode conter letras e espaços.';
  }
  return null;
}

String? emailValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'O email não pode estar vazio.';
  } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
      .hasMatch(input)) {
    return 'Por favor, insira um email válido.';
  }
  return null;
}
