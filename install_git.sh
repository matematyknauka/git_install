#!/bin/bash

# Skrypt do instalacji Git na Chromebooku

# Aktualizacja listy pakietów
sudo apt update

# Instalacja Git
sudo apt install git -y

# Sprawdzenie zainstalowanej wersji Git
git --version

echo "Git został pomyślnie zainstalowany."

