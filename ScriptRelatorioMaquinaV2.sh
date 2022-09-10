#######################################
#
#Desenvolvedor: Jean Henrique
#
#E-mail: jean.jhenri@gmail.com
#
#Objetivo: Puxa as informaões básicas do sistema linux.
#
######################################

#!/bin/bash

clear

echo "----------INFORMAÇÕES BÁSICAS DA MÁQUINA----------"
echo ""

###########VÁRIAVEIS#############

SISTEMAOPERACIONAL=$(uname -s)

NOMEMAQUINA=$(hostname)

DTHRATUAL=$(date +%a; date +%b; date +%d; date +%T; date +%m; date +%Y)

TIMEON=$(uptime -s)

VERSAOKERNEL=$(uname -r)

QNTCPUS=$(grep 'cpu cores' /proc/cpuinfo | rev | cut -c1-2 | head -1)

MODELOCPU=$(grep 'model name' /proc/cpuinfo | head -1 | tr -d 'modelname:')

MEMORIARAM=$(grep 'MemFree' /proc/meminfo | tr -d 'MemFree:')

PARTICOES=$(df)

##########PRINT################

echo "Sistema Operacional: $SISTEMAOPERACIONAL"

echo ""

echo "Nome da Máquina: $NOMEMAQUINA"

echo ""

echo "Máquina ativa desde: $TIMEON"

echo ""

echo "Versão Kernel: $VERSAOKERNEL"

echo ""

echo "----------INFORMAÇÕES DO HARDWARE----------"

echo ""

echo "Quantidade de CPUs/CORE: $QNTCPUS"

echo ""

echo "Modelo da CPU: $MODELOCPU"

echo ""

echo "Total de Memória RAM disponível: $MEMORIARAM"

echo ""

echo "Partições:"

echo "$PARTICOES"
