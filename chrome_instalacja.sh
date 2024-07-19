#!/bin/bash

# Zaktualizuj listę pakietów
sudo apt update

# Pobierz najnowszą wersję Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Zainstaluj Google Chrome
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# Usuń pobrany plik instalacyjny
rm google-chrome-stable_current_amd64.deb

# Sprawdź, czy Google Chrome został zainstalowany pomyślnie
if command -v google-chrome &> /dev/null
then
    echo "Google Chrome został zainstalowany pomyślnie."
else
    echo "Instalacja Google Chrome nie powiodła się."
fi

