# Astrometrica

Astrometrica é uma ferramenta de software interativa para redução de dados astrométricos de grau científico de imagens CCD, com foco em medições dos corpos menores do sistema solar (asteroides, cometas e planetas anões). Sendo desenvolvido por Herbert Raab

# Script
Esse é um simples script que fará a instalação de pacotes necessários (zip, curl, wget e gzip), e tambem fará a instalação do wine, que é o principal método para executar o astrometrica (Sendo que atualmente não existe um suporte direto para linux.)

Se você estiver usando versões muito antigas do Ubuntu, o script perguntará se você quer atualizar para a mais recente (É recomendado que faça a atualização).

# Passo a Passo
1. Abra o terminal e faça o download do script e de permissões de execução para ele
   ```
   wget https://raw.githubusercontent.com/Vaz15k/Astrometrica-Linux/main/astrometrica.sh && chmod +x astrometrica.sh
   ```
2. Execute o script como administrador (sudo)
   ```
   sudo ./astrometrica.sh
   ```
   O script irá verificar atualizações do sistema (caso esteja usando ubuntu, irá perguntar se você quer atualizar), e irá instalar pacotes necessários para a devida execução do programa, juntamente com o Wine
   
3. Execute o  script como usuário padrão (Não sudo)
   ```
   ./astrometrica
   ```
   A primeira execução iria instalar o astrometrica diretamente. A segunda execução em diante, só irá fazer a execução do programa.

## Agradecimentos

- Herbert Raab por [Atrometrica](http://www.astrometrica.at);
- [Minor Planet Center (MPC)](https://minorplanetcenter.net) pela base de dados;
- Desenvolvedores do [WineHQ](https://www.winehq.org)
- [IASC (International Astronomical Search Collaboration)](http://iasc.cosmosearch.org)
- [NASA](https://www.nasa.gov) pelas parcerias e projetos
