      ███████╗███╗   ███╗ ██████╗ ██╗  ██╗███████╗
      ██╔════╝████╗ ████║██╔═══██╗██║ ██╔╝██╔════╝
      ███████╗██╔████╔██║██║   ██║█████╔╝ █████╗
      ╚════██║██║╚██╔╝██║██║   ██║██╔═██╗ ██╔══╝
      ███████║██║ ╚═╝ ██║╚██████╔╝██║  ██╗███████╗
      ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
      
      ███╗   ███╗██╗██████╗ ██████╗  ██████╗ ██████╗
      ████╗ ████║██║██╔══██╗██╔══██╗██╔═══██╗██╔══██╗
      ██╔████╔██║██║██████╔╝██████╔╝██║   ██║██████╔╝
      ██║╚██╔╝██║██║██╔══██╗██╔══██╗██║   ██║██╔══██╗
      ██║ ╚═╝ ██║██║██║  ██║██║  ██║╚██████╔╝██║  ██║
      ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝

SmokerMirror la aplicación para tus IAs Locales con Ollama
Instaladores:

📱 Teléfono Android	SmokeMirror_v1.apk	📱


💻 Linux (Ubuntu, Mint, Debian)	SmokeMirror_v1_amd64.deb	🐧


💻 Linux (Fedora, CentOS, RHEL)	SmokeMirror-v1.x86_64.rpm	🐧


💻 Linux (cualquiera, sin instalar)	SmokeMirror_v1_amd64.AppImage	🐧


🪟 Windows (instalador normal)	SmokeMirror_v1_x64-setup.exe	🪟


🪟 Windows (instalador profesional)	SmokeMirror_v1_x64.msi	🪟


📦 ¿Qué es Ollama y por qué estos ajustes?

Ollama es un programa que te permite usar inteligencia artificial como ChatGPT en tu propia computadora, sin necesidad de internet.

Pero por defecto, Ollama solo funciona dentro de tu computadora como si hablara en voz baja solo para ti Estos ajustes lo que hacen es:

    Permitir que otros dispositivos en tu red (como tu celular o tablet) también puedan hablar con Ollama.

    Evitar problemas de seguridad que podrían bloquear el acceso.

🪟 Para usuarios de Windows
Paso 1: Abrir las variables de entorno

    Presiona la tecla Windows (la del logo) + R (al mismo tiempo).

    Escribe sysdm.cpl y presiona Enter.

    Ve a la pestaña Opciones avanzadas → haz clic en Variables de entorno.

Paso 2: Crear la variable OLLAHOST

    En la sección Variables de usuario (arriba), haz clic en Nueva.

    En Nombre de la variable escribe: OLLAMA_HOST

    En Valor de la variable escribe: 0.0.0.0 (esto significa "escucha todas las direcciones de tu red")

    Haz clic en Aceptar.

Paso 3: Crear la variable OLLAMA_ORIGINS

    Vuelve a hacer clic en Nueva (otra vez en Variables de usuario).

    En Nombre escribe: OLLAMA_ORIGINS

    En Valor escribe: * (el asterisco significa "permite conexiones desde cualquier lugar")

    Haz clic en Aceptar y cierra todas las ventanas.

✅ Importante: Reinicia Ollama (ciérralo y ábrelo de nuevo) para que los cambios funcionen.
🐧 Para usuarios de Linux (Ubuntu, Debian, etc.)
Paso 1: Configurar temporalmente (para probar)

    Abre la Terminal (es como el Símbolo del sistema de Windows).

    Escribe este comando y presiona Enter:
    bash

    launchctl setenv OLLAMA_ORIGINS "*"

    (Esto le dice a Ollama: "permite conexiones de cualquier web")

Paso 2: Hacer que el cambio sea permanente

    Escribe:

    sudo systemctl edit ollama.service

    (Te pedirá tu contraseña de usuario)

    Se abrirá un editor de texto. Borra todo lo que aparezca y escribe exactamente esto:
    text

    [Service]
    Environment="OLLAMA_HOST=0.0.0.0"

    (Esto significa: "Ollama, escucha todas las direcciones de tu red")

    Guarda el archivo. En el editor nano (el más común) presiona:

        Ctrl + O (guardar)

        Enter (confirmar nombre)

        Ctrl + X (salir)

Paso 3: Aplicar los cambios

    Ejecuta estos dos comandos en la Terminal (uno a la vez):

    sudo systemctl daemon-reload

    Le dice al sistema: "vuelve a leer todos los servicios")

    sudo systemctl restart ollama

    (Reinicia Ollama con la nueva configuración)


Guia de funcionamiento de SmokerMirror

🔧 PASO 1: Configurar Ollama en la Computadora A la que tiene Ollama

Antes de que la Computadora B pueda conectarse, la Computadora A debe abrir las puertas

1.1 Activar OLLAMA_HOST

Esto le dice a Ollama: "Escucha conexiones que vengan de otras computadoras"
En Windows:

    Presiona Windows + R, escribe sysdm.cpl y Enter

    Ve a Opciones avanzadas → Variables de entorno

    En Variables de usuario, haz clic en Nueva

    Escribe:

        Nombre: OLLAMA_HOST

        Valor: 0.0.0.0

    Haz clic en Aceptar y cierra todo

    Reinicia Ollama (ciérralo y ábrelo de nuevo)

En Linux:

    Abre la Terminal

    Escribe:

    sudo systemctl edit ollama.service

    Agrega estas líneas:
    text

    [Service]
    Environment="OLLAMA_HOST=0.0.0.0"

    Guarda (Ctrl+O, Enter, Ctrl+X)

    Aplica cambios:
    bash

    sudo systemctl daemon-reload
    sudo systemctl restart ollama

1.2 Activar OLLAMA_ORIGINS (para permitir conexiones web)

(Si ya lo hiciste antes, sáltate este paso)

    Agrega también OLLAMA_ORIGINS="*" (sigue los mismos pasos de arriba, pero con este nombre y valor)

🔍 PASO 2: Encontrar la IP de la Computadora A la que tiene Ollama

La Computadora B necesita saber dónde está Ollama. La IP es como la dirección de tu casa en la red.
En Windows Computadora A)

    Presiona Windows + R, escribe cmd y Enter

    En la ventana negra (terminal), escribe:
    bash

    ipconfig

    Busca la línea que dice "Dirección IPv4" o "IPv4 Address"

    Anota el número, se ve así: 192.168.1.XXX o 10.0.0.XXX

        Ejemplo: 192.168.1.105

En Linux (Computadora A):

    Abre la Terminal y escribe:
    bash

    hostname -I

    Verás varios números. El primero normalmente es tu IP local

        Ejemplo: 192.168.1.105

🌐 PASO 3: Configurar el Dashboard desde la Computadora B (la que NO tiene Ollama)

Ahora ve a la otra computadora, abre la aplicación y entra al dashboard
3.1 Ve a Configuración

    Dentro del dashboard, busca el ícono de ⚙️ Configuración o Settings

3.2 Encuentra el campo "Ollama API Conexión"

3.3 Escribe la IP de la Computadora A

    NO escribas localhost eso solo funciona en la misma computadora

    En su lugar, escribe la IP que anotaste en el PASO 2:

    http://192.168.1.105:11434

    Reemplaza 192.168.1.105 con la IP que obtuviste

3.4 Guarda la configuración

    Haz clic en Guardar / Conectar

    Deberías ver un mensaje de "✅ Conectado" o "✅ Conexión exitosa"

🤖 PASO 4: Crear tu Agente (desde la Computadora B)

Ahora que el dashboard está conectado a Ollama, puedes crear tu agente
4.1 Ve a la sección de Agentes

    Busca Agentes en el menú

4.2 Haz clic en Crear Nuevo Agente

    Busca el botón "+ Nuevo Agente" o "Crear"

4.3 Completa los datos
Campo	¿Qué poner?	Ejemplo
Nombre	El nombre de tu asistente	Mi Asistente Remoto
Modelo	El modelo que descargaste en la Computadora A	llama2, mistral, phi, etc.
4.4 Selecciona el modelo

    En el menú desplegable deberían aparecer todos los modelos que tienes en la Computadora A

    Elige el que prefieras

4.5 (Opcional) Dale personalidad

    En "Instrucciones del sistema" escribe:

        "Eres un asistente experto en tecnología. Respondes en español de forma clara y útil."

4.6 Guarda tu agente

    Haz clic en Guardar / Crear

💬 PASO 5: Iniciar conversación desde la Computadora B
5.1 Ve a la sección de Chat

    Busca Chat o Conversaciones en el menú

5.2 Selecciona tu agente

    En el selector de agentes, elige el que acabas de crear

5.3 Escribe tu primer mensaje
text

¡Hola! Estoy hablando contigo desde otra computadora. ¿Cómo funciona esto?

5.4 ¡Recibirás respuesta! 🎉

    El modelo de la Computadora A procesa tu mensaje y te responde en la Computadora B

    ¡Ya tienes tu IA funcionando en toda la red local!


       .-._                                                   _,-,
    `._`-._                                           _,-'_,'
       `._ `-._                                   _,-' _,'
          `._  `-._        __.-----.__        _,-'  _,'
             `._   `#==="""           """===#'   _,'
                `._/)  ._               _.  (\_,'
                 )*'     **.__     __.**     '*( 
                 #  .==..__  ""   ""  __..==,  # 
                 #   `"._(_).       .(_)_."'   #
