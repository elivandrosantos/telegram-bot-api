# Telegram Bot API (Local Server) - Large Files Support

*(For the Portuguese version, [click here](#telegram-bot-api-servidor-local---suporte-a-grandes-arquivos-pt-br) / Para a versão em Português, [clique aqui](#telegram-bot-api-servidor-local---suporte-a-grandes-arquivos-pt-br))*

This repository contains the instructions and configurations to compile and run the **Telegram Bot API** on a local server using Docker. The main goal of this project is to host the Telegram API locally to bypass standard file size limitations, allowing the transmission of files up to 1 GB (the official limit for bots on the public API is 50 MB) and limitless downloads.

This environment was built and successfully validated during the development of a bot specialized in sending files and **cleaning metadata**, ensuring high performance and privacy when handling large volumes of data.

## 📋 Table of Contents
1. [About the Project](#about-the-project)
2. [Security and Environment Variables](#security-and-environment-variables)
3. [Test Report and Performance (Mac Mini 2009)](#test-report-and-performance)
4. [Installation via Docker](#installation-via-docker)
5. [Moving a Bot to a Local Server](#moving-a-bot-to-a-local-server)
6. [License](#license)
7. [Contact / Support](#contact--support)

---

## <a id="about-the-project"></a>🎯 About the Project

The Telegram Bot API provides an HTTP interface to create bots on Telegram. However, using the public API (`api.telegram.org`) comes with strict size limits for uploads and downloads.

By running the API on a local server (using the `--local` flag), we enable advanced features:
- **Download files** without size limits.
- **Upload files** up to 2000 MB (2 GB) - This project is designed to easily support files up to **1 GB**.
- Upload files using their local path and the file URI scheme, avoiding network overhead.
- Advanced configuration of ports and IPs for Webhooks.

### Metadata Bot Integration
This local server was explicitly created to support the needs of a bot focused on sending files and **cleaning metadata** (removing EXIF data from photos, videos, and documents). The local processing of large media requires files to be transferred quickly, making the local API a fundamental piece in the architecture.

---

## <a id="security-and-environment-variables"></a>🔒 Security and Environment Variables

To guarantee server security and prevent exposing sensitive credentials, the project uses **Environment Variables**. It is crucial that you never hardcode your keys directly into the source code.

Required variables that must be set in your environment (`.env` or in `docker-compose`):
- `TELEGRAM_API_ID`: Your application ID (obtained at *my.telegram.org*).
- `TELEGRAM_API_HASH`: Your application Hash.

**Implemented Security Practices:**
- The compilation and execution are completely isolated in a **Docker Container**. This prevents conflicting dependencies from affecting the host OS and isolates bot access.
- The Local API only accepts local HTTP requests. Using a TLS termination proxy is recommended if you expose this API externally. In our case, the metadata bot communicates securely within the internal Docker network.

---

## <a id="test-report-and-performance"></a>🖥️ Test Report and Performance

To prove the efficiency of compiling via Docker and the viability of the project on older hardware, the environment was rigorously tested on the following setup:

- **Machine**: Mac Mini (Year 2009)
- **Processor**: Intel Core 2 Duo (Dual Core) 2.53 GHz
- **Storage**: Mechanical HD (Standard Hard Drive)
- **Test Environment**: Linux Docker Container

**Compilation Results:** 
Due to hardware limitations (older processor and mechanical HD), compiling the C++ source code using CMake took **about two hours**. 

**Test Conclusion:** 
Despite the lengthy compilation time, the creation of the test environment **was concluded with absolute success**. After compilation, the container started, and the local Telegram server ran flawlessly and stably, efficiently processing and forwarding the large files sent and cleaned by our metadata bot.

---

## <a id="installation-via-docker"></a>🐳 Installation via Docker

To ease configuration, standardize the environment, and avoid installing complex dependencies (like OpenSSL, zlib, C++17 compatible compilers, and gperf) directly on the host machine, this project has been fully dockerized.

### Steps to start the server:

1. Clone this repository or navigate to your local project folder.
2. Make sure Docker and Docker Compose are installed in your environment.
3. Configure your API environment variables (via `.env` or securely inside `docker-compose.yml`):
   ```env
   TELEGRAM_API_ID=your_id_here
   TELEGRAM_API_HASH=your_hash_here
   ```
4. Start compiling and running the API with the following command:
   ```bash
   docker compose up -d --build
   ```

*(Note: Keep in mind that, as the 2009 Mac Mini test demonstrated, the `build` stage can be quite time-consuming on modest hardware. Have patience, the end result is worth it!)*

---

## <a id="moving-a-bot-to-a-local-server"></a>🔄 Moving a Bot to a Local Server

To ensure your bot sends large files locally and doesn't conflict with public cloud servers:

1. **Log out** the bot from the official server by calling the `logOut` method on the public API (`https://api.telegram.org/bot<TOKEN>/logOut`).
2. After logging out from the cloud, change the base URL in your bot's code (like the metadata bot) to point to the address of the local server's Docker network (e.g., `http://telegram-bot-api:8081`).
3. Your requests will work transparently, but now taking full advantage of the incredibly expanded local server limits.

---

## <a id="license"></a>📄 License

The Telegram Bot API server source code is licensed under the terms of the **Boost Software License**. See the official `tdlib/telegram-bot-api` repository for more licensing information.

---

## <a id="contact--support"></a>📞 Contact / Support

For questions about implementing this local server, integration with the metadata bot, or additional support, reach out to me on Telegram: **[@ordnavile](https://t.me/ordnavile)**


---
---


# <a id="telegram-bot-api-servidor-local---suporte-a-grandes-arquivos-pt-br"></a>Telegram Bot API (Servidor Local) - Suporte a Grandes Arquivos (PT-BR)

Este repositório contém as instruções e configurações para compilar e executar o **Telegram Bot API** em um servidor local utilizando Docker. O objetivo principal deste projeto é hospedar a API do Telegram localmente para remover as limitações padrão de tamanho de arquivo, permitindo o envio de arquivos de até 1 GB (o limite oficial para bots na API pública é 50 MB) e download sem limite de tamanho.

Este ambiente foi construído e validado com sucesso durante o desenvolvimento de um bot especializado no envio de arquivos e **limpeza de metadados**, garantindo alta performance e privacidade na manipulação de grandes volumes de dados.

## 📋 Sumário
1. [Sobre o Projeto](#sobre-o-projeto-1)
2. [Segurança e Variáveis de Ambiente](#segurança-e-variáveis-de-ambiente-1)
3. [Relato de Teste e Performance (Mac Mini 2009)](#relato-de-teste-e-performance-1)
4. [Instalação via Docker](#instalação-via-docker-1)
5. [Como Mover seu Bot para o Servidor Local](#como-mover-seu-bot-para-o-servidor-local-1)
6. [Licença](#licença-1)
7. [Contato / Suporte](#contato--suporte-1)

---

## <a id="sobre-o-projeto-1"></a>🎯 Sobre o Projeto

O Telegram Bot API fornece uma interface HTTP para criar bots no Telegram. No entanto, usar a API pública (`api.telegram.org`) traz limitações rigorosas de tamanho para upload e download. 

Ao rodar a API em um servidor local (com a flag `--local`), habilitamos recursos avançados:
- **Download de arquivos** sem limite de tamanho.
- **Upload de arquivos** de até 2000 MB (2 GB) - Neste projeto focado em suportar com folga arquivos de até **1 GB**.
- Envio de arquivos usando caminhos locais do sistema operacional, evitando sobrecarga de rede.
- Configuração avançada de portas e IPs para Webhooks.

### Integração com Bot de Metadados
Este servidor local foi criado especificamente para suportar as demandas de um bot focado no envio de arquivos e **limpeza de metadados** (remoção de dados EXIF de fotos, vídeos e documentos). O processamento local de grandes mídias exige que os arquivos sejam transferidos rapidamente, tornando a API local uma peça fundamental na arquitetura.

---

## <a id="segurança-e-variáveis-de-ambiente-1"></a>🔒 Segurança e Variáveis de Ambiente

Para garantir a segurança do servidor e evitar exposição de credenciais sensíveis, o projeto utiliza **Variáveis de Ambiente**. É crucial que você não coloque suas chaves diretamente no código-fonte.

Variáveis obrigatórias que devem ser definidas no seu ambiente (`.env` ou no `docker-compose`):
- `TELEGRAM_API_ID`: O ID do seu aplicativo (obtido em *my.telegram.org*).
- `TELEGRAM_API_HASH`: O Hash do seu aplicativo.

**Práticas de Segurança Implementadas:**
- A compilação e execução são totalmente isoladas em um **Container Docker**. Isso impede que dependências conflitantes afetem o sistema operacional hospedeiro e isola o acesso do bot.
- A API Local aceita apenas requisições HTTP locais, sendo recomendado o uso de um proxy reverso (TLS) caso você exponha essa API externamente. No nosso caso, o bot de metadados se comunica de forma segura na mesma rede interna do Docker.

---

## <a id="relato-de-teste-e-performance-1"></a>🖥️ Relato de Teste e Performance

Para provar a eficiência da compilação via Docker e a viabilidade do projeto em hardwares mais antigos, o ambiente foi rigorosamente testado nas seguintes configurações:

- **Máquina**: Mac Mini (Ano 2009)
- **Processador**: Intel Core 2 Duo (Dual Core) 2.53 GHz
- **Armazenamento**: HD Mecânico (Disco Rígido Padrão)
- **Ambiente de Teste**: Container Docker Linux

**Resultados da Compilação:** 
Devido às limitações de hardware (processador antigo e HD mecânico), o processo de compilação do código-fonte em C++ usando CMake demorou **cerca de duas horas**. 

**Conclusão do Teste:** 
Apesar do longo tempo de compilação, a criação do ambiente de teste **foi concluída com absoluto sucesso**. Após a compilação, o container foi iniciado e o servidor local do Telegram rodou perfeitamente e sem problemas de estabilidade, processando e encaminhando com eficiência os grandes arquivos enviados e limpos pelo nosso bot de metadados.

---

## <a id="instalação-via-docker-1"></a>🐳 Instalação via Docker

Para facilitar a configuração, padronizar o ambiente e evitar a necessidade de instalar dependências complexas (como OpenSSL, zlib, compiladores C++17 e gperf) diretamente na máquina, este projeto foi inteiramente dockerizado.

### Passos para subir o servidor:

1. Clone este repositório ou acesse a pasta do projeto local.
2. Certifique-se de que o Docker e o Docker Compose estão instalados no seu ambiente.
3. Configure suas variáveis de ambiente para a API (via `.env` ou inserindo diretamente no `docker-compose.yml` de forma segura):
   ```env
   TELEGRAM_API_ID=seu_id_aqui
   TELEGRAM_API_HASH=seu_hash_aqui
   ```
4. Inicie a compilação e execução da API com o comando:
   ```bash
   docker compose up -d --build
   ```

*(Nota: Lembre-se de que, conforme o teste no Mac Mini de 2009 demonstrou, a etapa de `build` pode ser bastante demorada em hardwares modestos. Tenha paciência, o resultado final vale a pena!)*

---

## <a id="como-mover-seu-bot-para-o-servidor-local-1"></a>🔄 Como Mover seu Bot para o Servidor Local

Para garantir que o seu bot envie arquivos pesados localmente e não sofra conflitos com os servidores públicos na nuvem:

1. Faça o **Logout** do bot do servidor oficial chamando o método `logOut` na API pública (`https://api.telegram.org/bot<TOKEN>/logOut`).
2. Após o bot ser deslogado da nuvem, altere a URL base no código do seu bot (como o bot de metadados) para apontar para o endereço da rede Docker do servidor local (exemplo: `http://telegram-bot-api:8081`).
3. Seus requests funcionarão de maneira transparente, porém agora aproveitando os incríveis limites expandidos do servidor local.

---

## <a id="licença-1"></a>📄 Licença

O código-fonte original do servidor da Telegram Bot API é licenciado sob os termos da **Boost Software License**. Veja o repositório oficial da `tdlib/telegram-bot-api` para mais informações de licenciamento.

---

## <a id="contato--suporte-1"></a>📞 Contato / Suporte

Para dúvidas sobre a implementação deste servidor local, integração com o bot de metadados ou suporte adicional, entre em contato comigo pelo Telegram: **[@ordnavile](https://t.me/ordnavile)**
