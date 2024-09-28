#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
RESET='\e[0m'



if [ "$1" == "" ]

then 

ip=$(curl -s https://meuip.com/api/meuip.php)

echo -e " ${BLUE}
          _______________    
      ==c(___(o(______(_()    
              \=\'              
               )=\'                  ${RESET}Telescanner${BLUE}
              //|\'\'                      ${RESET}Created By${BLUE} 
             //|| \'\'                          Christopher Rissardi
            // ||  \'\'              
           //  ||   \'\'                  
          //         \'\'          ${RESET}YOUR PUBLIC IP ADDRESS: ${BLUE}$ip           
${RESET}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo -e "[${BLUE}?${RESET}] Método de uso: digite ./telescanner.sh e o IP do seu GATEWAY."
echo -e "[${BLUE}!${RESET}] Exemplo de uso: ./telescanner.sh 192.168.0.1"
echo ""
echo -e "Para falicitar a sua vida... o seu IP privado é: ${BLUE}$(ip a | grep "inet" | grep -v "inet6" | cut -d " " -f 6 | sed 's#/.*##' | grep -v "127.0.0.1")${RESET}"

ip_privado=$(ip a | grep "inet" | grep -v "inet6" | cut -d " " -f 6 | sed 's#/.*##' | grep -v "127.0.0.1")
gateway=$(ip a | grep "inet" | grep -v "inet6" | cut -d " " -f 6 | sed 's#/.*##' | grep -v "127.0.0.1" | sed 's/\.[0-9]\{1,3\}$/\.1/')

echo ""
echo -e "${RESET}[${BLUE}!${RESET}] Se o seu IP privado é o ${BLUE}$ip_privado, ${RESET}logo seu Gateway será o ${BLUE}$gateway. ${RESET}Não é regra... porém grande parte das redes domésticas são assim!"
echo -e "${RESET}ESPERO TER AJUDADO! AGORA INSIRA O SEU GATEWAY ${BLUE}$gateway ${RESET}NA FERRAMENTA E ELA IRÁ SCANEAR A REDE EM BUSCA DE HOSTS ATIVOS!"
else

etherface=$(ifconfig | grep ":" | grep -v "inet" | grep -v "ether" | cut -d ":" -f1 | grep -v "lo")
ip=$(curl -s https://meuip.com/api/meuip.php)

echo -e " ${BLUE}
          _______________    
      ==c(___(o(______(_()    
              \=\'              
               )=\'                  ${RESET}Telescanner${BLUE}
              //|\'\'                      ${RESET}Created By${BLUE} 
             //|| \'\'                          Christopher Rissardi
            // ||  \'\'              
           //  ||   \'\'                  
          //         \'\'          ${RESET}YOUR PUBLIC IP ADDRESS: ${BLUE}$ip           
${RESET}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo ""
fping -a -g -q $1/24
echo ""
echo -e "[${BLUE}+${RESET}] Todos os IPs acima foram encontrados pela ferramenta com base no protocolo ICMP."
echo -e "[${BLUE}*${RESET}] Buscando por hosts ativos através da tabela ARP. Por favor, aguarde."
echo ""
sleep 5
sudo arp-scan --interface=$etherface --localnet | grep -v "Starting" | grep -v "received"
echo ""
echo -e "[${BLUE}+${RESET}] Foram encontrados os hosts acimas com base na verificação de protocolo ARP."
fi
