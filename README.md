# 🛰️ HOSTSCAN 

Ferramenta criada com o intúito de verificar hosts ativos na rede.

![aaaaaaa](https://github.com/user-attachments/assets/514ecfef-12d9-41e5-8218-4984aec43e39)


A ferramenta faz a verificação de hosts (clientes) ativos na rede e mostra quais são os endereços IPs de cada host que está ativo. Essa verificação é feita através de `ping`, ou seja, através do protocolo de mensagens `ICMP`. O script em si é simples mas extremamente útil, podendo ser ajustado facilmente e podendo ajudar muito em um pentest interno.

### Atualização

Recentemente atualizei o script e ele está infinitamente melhor em relação a versão anterior, tanto nas funcionalidades quanto no visual bonito, simples e didático.
Antes a ferramenta demorava cerca de 30 minutos para verificar todos os hosts ativos, agora não demora nem 10 segundos! Deixarei a nota de atualização abaixo.

1. Melhorias no código fonte
    - Acelerado o tempo de respostas na procura por hosts ativos no protocolo `ICMP`.
    - Implementação de procura através do protocolo `ARP`.
    - Implementação de MACVendors para os endereços físicos encontrados pela ferramenta.
    - Correções de Bugs e falhas de falso positivo no código fonte.
    - Ajuste de visual e alteração do banner principal.
    - Correções de erros de delimitadores nas consultas.
    - Melhores tecnologias adicionadas como o `fping`, protocolo mais rápido de consultas.
2. Melhorias na estética
    - O visual foi ajustado incluindo cores para deixar a ferramenta mais bonita e completa.
    - O nome foi alterado. Não é mais hostscan e a partir de agora passa a ser Telescanner.

Com essas melhorias, facilita em 1000% o uso em pentest interno já que os hosts serão encontrados em alguns minutos (CLARO, DEPENDE TAMBÉM DA PROPORÇÃO DA REDE/EMPRESA EM QUESTÃO).

OBS:

Como a ferramenta em questão utiliza o protocolo `ICMP` para verificar os hosts ativos, pode haver falsos positivos principalmente em sistemas Windows, o qual muitas vezes o protocolo vem desabilitado por padrão para evitar respostas para outros hosts ativos na rede, então atente-se nesse quesito... 

## ✔️ Requisitos para uso

Apenas ter um dispositivo Linux. Nada específico.

## ⛏️ Como usar

1. Clone este repositório usando a ferramenta do [git](https://git-scm.com/) ou baixe o repositório em ZIP clicando em `<> Code`
```bash
git clone https://github.com/christopherrissardi/Telescanner.git
```

2. Entre na pasta do repositório clonado

```bash
cd Telescanner
```

3. De permissão de execução ao script usando o terminal.

```bash
sudo chmod +x ./telescanner.sh
```

4. Execute o script passando o endereço GATEWAY da rede que deseja fazer a varredura.

```bash
./telescanner.sh 10.0.0.1
```

Observação: não precisa passar mais passar o range de IP, agora somente é necessário o IP do Gateway ou até mesmo do dispositivo em que você esteja utilizando.

Os endereços IPs não retornados simplesmente não foi encontrados pelo protocolo.

---
## 👁️‍🗨️ Observações finais

Caso queira criar um script próprio, fique a vontade para modificar e estudar. 
Se possível deixe os créditos, ficarei extremamente feliz :).
