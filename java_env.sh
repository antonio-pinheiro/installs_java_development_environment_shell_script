#!/bin/bash

distro=$(lsb_release -i | cut -f 2-)
user=$(whoami)

instalar_spring(){
    echo "Essa função irá instalar em seu sistema a IDE Spring Tool Suite 4"
    wget https://download.springsource.com/release/STS4/4.13.1.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.1.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz
    mkdir -p /home/$user/Documents/springtoolsuite4
    tar -xvzf spring-tool*.tar.gz -C /home/$user/Documents/springtoolsuite4
    echo "export PATH=$PATH:/home/$user/Documents/springtoolsuite4/sts-4.13.1.RELEASE" >> /home/$user/.bashrc
    cd /home/$user
    source .bashrc
    rm spring-tool-suite*
    echo "Spring Tool Suite 4 instalado com sucesso!"
    echo "Execute através do comando SpringToolSuite4 no terminal!"
    echo
    exit
}

instalar_eclipse(){
    echo "Essa função irá instalar em seu sistema a IDE Eclipse no formato Flatpak"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.eclipse.Java
}

instalar_netbeans(){
    echo "Essa função irá instalar em seu sistema a IDE Netbeans no formato Flatpak"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.apache.netbeans
}

instalar_open_jdk(){
    echo
    echo "Qual versão do Open JDK deseja instalar?"
    echo "Exemplo: 11, 17"
    echo "informe apenas o número da versão"
    echo
    read versao

    if [[ $distro == "Fedora" ]]; then
      sudo dnf install java-$versao-openjdk*.x86_64
      exit
    
    elif [[ $distro == "Linuxmint" ]] || [[ $distro == "Ubuntu" ]] || [[ $distro == "Debian" ]]; then
      sudo apt install openjdk-$versao*
      exit
    
    else
      echo "Sua distro não é compátivel com esse script"
      echo "Encerrando"
      exit
    fi
}

funcao_principal(){
echo
echo "Selecione uma opção"
echo
echo "1  - Instalar Spring Tool Suite 4"
echo "2  - Instalar Eclipse"
echo "3  - Instalar Netbeans"
echo "4  - Instalar JDK - Implementação Open JDK"
echo "5  - Exit"
echo

while :
do
  read select_option
  case $select_option in

    1)  instalar_spring;;
	
    2)  instalar_eclipse;;

    3)  instalar_netbeans;;

    4)  instalar_open_jdk;;
    
    5)  exit

  esac
done
}

funcao_principal
