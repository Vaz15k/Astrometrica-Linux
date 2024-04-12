#!/bin/bash

## Limpa o terminal
clear

## Obtem o nome do usuario
username=$(whoami)

## Pacotes do Ubuntu
install_packages_ubuntu() {
    echo "Atualizando e instalando pacotes no Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y gzip zip curl wine-stable wine-mono wine-gecko 
}

## Pacotes do Arch Linux
install_packages_arch() {
    echo "Atualizando e instalando pacotes no Arch Linux..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm gzip zip unzip curl wine wine-mono wine-gecko
}

## Pacotes do Fedora
install_packages_fedora() {
    echo "Atualizando e instalando pacotes no Fedora..."
    sudo dnf update -y
    sudo dnf install -y gzip zip curl wine
    ## Fedora pode requerer repositórios adicionais para wine-mono e wine-gecko
}

## Função para atualizar Ubuntu para a versão mais recente
upgrade_ubuntu() {
    echo "Verificando a versão do Ubuntu..."
    echo "Deseja verificar e aplicar a atualização do Ubuntu para a versão mais recente disponível? (s/n)"
    read resposta

    if [[ "${resposta,,}" == "s" ]]; then
        echo "Preparando para atualizar o Ubuntu..."
        sudo apt-get install -y update-manager-core
        sudo do-release-upgrade
    fi
}

## Instalador / Executor do Astrometrica
install_astrometrica() {
    if [ ! -d "$HOME/.wine/drive_c/Astrometrica" ]; then

        echo "Astrometrica não encontrado. Preparando para instalação..."
        wget -c http://iasc.cosmosearch.org/Content/Distributables/astrometrica-setup-v1.4.exe -O "$HOME/Astrometrica.exe"

        if [ -f "$HOME/Astrometrica.exe" ]; then
            wine "$HOME/Astrometrica.exe"
            rm "$HOME/Astrometrica.exe"
            mkdir "$HOME/.wine/drive_c/users/$username/AppData/Local/Astrometrica"
        else
            echo "Falha no download do Astrometrica."
        fi

    else
		clear
        echo "Executando Astrometrica..."
		cd "$HOME/.wine/drive_c/Astrometrica" || { echo "Falha ao acessar o diretório Astrometrica"; exit 1; }
        curl --insecure "https://minorplanetcenter.net/iau/MPCORB/MPCORB.DAT.gz" -o "MPCORB.DAT.gz"
        gzip -d -f MPCORB.DAT.gz
        mv MPCORB.DAT Catalogs/
        wine Astrometrica.exe
    fi
}

## Checa se o script está sendo executado como root
if [ "$(id -u)" -eq 0 ]; then

    ## Determina o tipo de sistema e instala/atualiza os pacotes
    if grep -qi ubuntu /etc/os-release; then
		clear
        install_packages_ubuntu || { echo "Falha ao atualizar os pacotes do Ubuntu"; exit 1; }
        upgrade_ubuntu || { echo "Falha ao atualizar o Ubuntu"; exit 1; }

    elif grep -qi arch /etc/os-release; then
		clear
        install_packages_arch || { echo "Falhar ao atualizar os pacotes do Arch Linux"; exit 1; }

    elif grep -qi fedora /etc/os-release; then
		clear
        install_packages_fedora || { echo "Falha ao atualizar o Fedora"; exit 1; }
    fi

	echo "Atualização do sistema efetuada"
	echo "Excute o script como não sudo"
    
else

    ## Verificar a pasta e instala ou executa o Astrometrica
    install_astrometrica || { echo "Erro ao executar/instalar o Astrometrica"; exit 1; }

fi
