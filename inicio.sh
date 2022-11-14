#!/bin/bash
clear
git init
git config user.name "Walter Ismael Sagástegui Lescano"
git config user.email "datasagamadrid@gmail.com"
git add .
git commit -m "TITULO"
git branch -M main
git remote add origin https://github.com/DATASAGASTEGUI/PROJECTWEBJAVACERTIFICADO.git
git push -u origin main