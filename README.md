# Astrometrica

Astrometrica é uma ferramenta de software interativa para redução de dados astrométricos de grau científico de imagens CCD, com foco em medições dos corpos menores do sistema solar (asteroides, cometas e planetas anões). Sendo desenvolvido por Herbert Raab

# Script
Esse é um simples script que fará a instalação de pacotes necessários (zip, curl, wget e gzip), e tambem fará a instalação do wine, que é o principal método para executar o astrometrica (Sendo que atualmente não existe um suporte direto para Linux.)

> [!NOTE]
> Caso esteja usando versões antigas do Ubuntu, você terá que habilitar repositorios adcionais, tambem é altamente recomendado que voce faça atulização para o sistema mais recente.
> Esses repositorios podem ser habilitados no aplicativo "Software & Updates" dentro do proprio Ubuntu

# Passo a Passo
1. Abra o terminal e faça o download do script e de permissões de execução para ele
   ```bash
   wget https://raw.githubusercontent.com/Vaz15k/Astrometrica-Linux/main/astrometrica.sh && chmod +x astrometrica.sh
   ```
2. Execute o script como administrador (sudo)
   ```bash
   sudo ./astrometrica.sh
   ```
   O script irá verificar atualizações do sistema, e irá instalar pacotes necessários para a devida execução do programa, juntamente com o Wine
   
3. Execute o  script como usuário padrão (Não sudo)
   ```bash
   ./astrometrica
   ```
   A primeira execução iria instalar o astrometrica diretamente. Após a primeira execução do script, da segunda execução em diante, só irá fazer a atualição da base de dados e a execução do programa.

## Agradecimentos

- Herbert Raab pelo [Atrometrica](http://www.astrometrica.at);
- [Minor Planet Center (MPC)](https://minorplanetcenter.net) pela base de dados;
- Desenvolvedores do [WineHQ](https://www.winehq.org)
- [IASC (International Astronomical Search Collaboration)](http://iasc.cosmosearch.org)
- [NASA](https://www.nasa.gov) pelas parcerias e projetos
