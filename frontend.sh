#!/bin/zsh

exibir_porcentagem() {
    local progresso=$1
    local largura=50
    local preenchimento=$((progresso * largura / 100))
    local vazio=$((largura - preenchimento))

    echo -ne "Progresso: [$([[ $preenchimento -gt 0 ]] && printf '=%.0s' {1..$preenchimento})$([[ $vazio -gt 0 ]] && printf ' %.0s' {1..$vazio})] $progresso%\r"

    if [[ $progresso -eq 100 ]]; then
        echo -e "\nAbrindo o navegador..."
    fi
}

# Configura o ambiente do Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Navega até a pasta
cd ~/documents/projeto/

pwd

# Verifica a versão do npm
echo "Versão do npm:"
npm -v

# Verifica a versão do Node
echo "Versão do Node:"
node -v

# Abre o Visual Studio Code
code .

# Aguarda 1 segundo
sleep 1

# Abre uma segunda janela do terminal e executa um comando específico
gnome-terminal -- zsh -c "sudo ./comando.sh; zsh"

# Define o total de etapas do progresso
total_etapas=20

# Realiza as etapas do progresso
for ((i = 1; i <= total_etapas; i++)); do
    sleep 0.5
    progresso=$((i * 100 / total_etapas))
    exibir_porcentagem $progresso
done

# Aguarda mais alguns segundos antes de abrir o Chrome
sleep 10

# Adiciona uma mensagem final
echo "Tudo pronto!"

# Abre o Chrome com a URL www.google.com
nohup google-chrome-stable http://localhost:8080 &


