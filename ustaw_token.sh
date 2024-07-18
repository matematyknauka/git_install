#!/bin/bash

# Ustawienia
GIT_USERNAME="matematyknauka"
PERSONAL_ACCESS_TOKEN="WPISZ TOKEN WYGENEROWANY NA https://github.com/settings/personal-access-tokens/new"

# Sprawdzenie, czy zmienne są ustawione
if [ -z "$PERSONAL_ACCESS_TOKEN" ]; then
  echo "Błąd: Token dostępu osobistego nie jest ustawiony."
  exit 1
fi

# Konfiguracja Git do używania tokenu
echo "Konfiguracja Git do używania tokenu dostępu osobistego..."

# Ustawienie tokenu w pliku konfiguracyjnym
echo "https://$GIT_USERNAME:$PERSONAL_ACCESS_TOKEN@github.com" > ~/.git-credentials

# Sprawdzenie zawartości pliku, aby upewnić się, że token został zapisany
echo "Zawartość pliku ~/.git-credentials:"
cat ~/.git-credentials

# Ustawienie helpera do przechowywania danych uwierzytelniających
git config --global credential.helper store

echo "Konfiguracja zakończona. Teraz Git powinien używać tokenu do uwierzytelniania."

