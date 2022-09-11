#################################################################
#								#
#Desenvolvedor: Jean Henrique					#
#								#
#E-mail: jean.jhenri@gmail.com					#
#								#
#Objetivo: Script gera um relatório com as principais           #
#	   informações do servidor				#
#################################################################

#!/bin/bash

#Versão do Kernel
KERNEL=$(uname -r)

#Nome da máquina
HOSTNAME=$(hostname)

#Faz uma pesquisa no arquivo "cpuinfo" | Filtra somente as linhas "model name" | Conta a quatidade de linhas)
CPU=$(cat /proc/cpuinfo | grep "model name" | wc -l)

#Faz uma pesquisa no arquivo "cpuinfo" | Filtra somente as linhas 'model name" | Puxa somente a primeira linha | Mostra na tela somente a partir do caractere 14
CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)

#Faz uma pesquisa no arquivo "cpuinfo" | Filtra somente a linha que mostra a memória total | Remove os espaços | Traz somente o que tiver depois dos ":" | Remove o Kb |
#Divide por 1024 para MB
MEMTOTAL=$(expr $(cat /proc/meminfo | grep 'MemTotal' | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024)

#Mostra as  informações do sistema de arquivos | Remove as informações (tmpfs|udev)
FILESYS=$(df -h | egrep -v '(tmpfs|udev)')

#Mostra quanto tempo a máquina está ativa
UPTIME=$(uptime -s)

clear

echo "==========================================================================================================="
echo "Relatório da Máquina: $HOSTNAME"
echo "Data/Hora: $(date)"
echo "==========================================================================================================="
echo ""
echo "Máquina ativa desde: $UPTIME"
echo ""
echo "Versão do Kernel: $KERNEL"
echo ""
echo "CPUs"
echo "Quantidade de CPUs/CORE: $CPU"
echo "Modelo da CPU: $CPUMODEL"
echo ""
echo "Memória Total: $MEMTOTAL MB"
echo ""
echo "Partições"
echo "$FILESYS"
echo ""
echo "============================================================================================================="

