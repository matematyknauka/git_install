#!/bin/bash

# Ustawienia
GIT_REPO="https://github.com/matematyknauka/git_install.git"
COMMIT_MESSAGE="Dodano plik upload_to_github.sh"
GIT_EMAIL="matematyknauka@gmail.com"
GIT_USERNAME="matematyknauka"

# Pobranie ścieżki do pliku, znajdującego się w tej samej lokalizacji co skrypt
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
FILE_NAME="upload_to_github.sh"
FILE_PATH="$SCRIPT_DIR/$FILE_NAME"

# Przejdź do katalogu roboczego repozytorium
cd "$SCRIPT_DIR"

# Sprawdzenie czy podany plik istnieje
if [ ! -f "$FILE_PATH" ]; then
  echo "Plik $FILE_PATH nie istnieje. Skrypt zostanie zakończony."
  exit 1
fi

# Krok 1: Inicjalizacja repozytorium Git (jeśli jeszcze nie zainicjowane)
if [ ! -d ".git" ]; then
  echo "Inicjalizacja nowego repozytorium Git w katalogu roboczym ($SCRIPT_DIR)."
  git init --quiet
fi

# Ustawienie danych użytkownika Git dla bieżącego repozytorium
git config user.email "$GIT_EMAIL"
git config user.name "$GIT_USERNAME"

# Sprawdzenie, czy zdalne repozytorium 'origin' już istnieje
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "Dodawanie zdalnego repozytorium 'origin'."
  git remote add origin "$GIT_REPO"
fi

# Sprawdzenie, czy gałąź 'main' istnieje, jeśli nie, zmień nazwę gałęzi
if ! git branch | grep -q "main"; then
  if git branch | grep -q "master"; then
    echo "Gałąź 'master' wykryta. Zmieniam nazwę na 'main'."
    git branch -M main
  else
    echo "Tworzenie gałęzi 'main'."
    git checkout -b main
  fi
fi

# Krok 2: Dodanie pliku do lokalnego repozytorium
echo "Dodawanie pliku $FILE_NAME do lokalnego repozytorium Git."
git add "$FILE_NAME"

# Krok 3: Utworzenie commita
git commit -m "$COMMIT_MESSAGE" --quiet

# Krok 4: Wysłanie zmian do zdalnego repozytorium
echo "Wysyłanie zmian do repozytorium na GitHub: $GIT_REPO."
git push -u origin main --quiet

echo "Operacja zakończona."

# Wyświetlenie zmiennych
echo "=== Informacje o zmiennych ==="
echo "GIT_REPO: $GIT_REPO"
echo "COMMIT_MESSAGE: $COMMIT_MESSAGE"
echo "GIT_EMAIL: $GIT_EMAIL"
echo "GIT_USERNAME: $GIT_USERNAME"
echo "FILE_PATH: $FILE_PATH"
echo "SCRIPT_DIR: $SCRIPT_DIR"
echo "=============================="
