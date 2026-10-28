      ███████╗███╗   ███╗ ██████╗ ██╗  ██╗███████╗
      ██╔════╝████╗ ████║██╔═══██╗██║ ██╔╝██╔════╝
      ███████╗██╔████╔██║██║   ██║█████╔╝ █████╗
      ╚════██║██║╚██╔╝██║██║   ██║██╔═██╗ ██╔══╝
      ███████║██║ ╚═╝ ██║╚██████╔╝██║  ██╗███████╗
      ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
       
      ███╗   ███╗██╗██████╗ ██████╗  ██████╗ ██████╗
      ████╗ ████║██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗
      ██╔████╔██║██║██████╔╝██████╔╝██║   ██║██████╔╝
      ██║╚██╔╝██║██║██╔══██╗██╔══██╗██║   ██║██╔══██╗
      ██║ ╚═╝ ██║██║██║  ██║██║  ██║╚██████╔╝██║  ██║
      ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝

# SmokeMirror

Tu asistente de IA local con **Ollama**, diseñado para funcionar en tu red doméstica u oficina sin depender de internet.

---

## 📦 Descargar e instalar

Elige el instalador para tu dispositivo:

| Dispositivo | Archivo |
|-------------|---------|
| 📱 Android | `SmokeMirror_v0.15.apk` |
| 🐧 Linux (Ubuntu, Mint, Debian) | `SmokeMirror_0.15.0_amd64.deb` |
| 🐧 Linux (Fedora, CentOS, RHEL) | `SmokeMirror-0.15.0-1.x86_64.rpm` |
| 🪟 Windows (instalador estándar) | `SmokeMirror_0.15.0_x64-setup.exe` |
| 🪟 Windows (instalador profesional/MSI) | `SmokeMirror_0.15.0_x64.msi` |

---

## 🧠 ¿Qué es Ollama y por qué necesitas configurarlo?

**Ollama** es un programa que te permite ejecutar modelos de inteligencia artificial (como ChatGPT) directamente en tu propia computadora, de forma privada y sin conexión a internet.

Por defecto, Ollama solo escucha conexiones desde la misma computadora. Para que SmokeMirror pueda hablar con Ollama desde otro dispositivo (celular, tablet o segunda PC), debes permitir que Ollama reciba conexiones de tu red local.

> ⚠️ Esto solo se recomienda en redes de confianza (casa u oficina). No expongas Ollama a internet público.

---

## 🛠️ Paso 1: Configurar Ollama en la Computadora A

La **Computadora A** es aquella que tiene Ollama instalado y ejecuta los modelos de IA.

### En Windows

1. Presiona `Windows + R`, escribe `sysdm.cpl` y presiona Enter.
2. Ve a **Opciones avanzadas** → **Variables de entorno**.
3. En **Variables de usuario**, haz clic en **Nueva**.
4. Crea la siguiente variable:
   - **Nombre:** `OLLAMA_HOST`
   - **Valor:** `0.0.0.0`
5. Haz clic en **Aceptar**.
6. Crea otra variable:
   - **Nombre:** `OLLAMA_ORIGINS`
   - **Valor:** `*`
7. Haz clic en **Aceptar** y cierra todas las ventanas.
8. **Reinicia Ollama** (ciérralo y vuélvelo a abrir).

### En Linux (Ubuntu, Debian, etc.)

1. Abre la Terminal.
2. Edita el servicio de Ollama:
   ```bash
   sudo systemctl edit ollama.service
   ```
3. Agrega este contenido y guarda:
   ```ini
   [Service]
   Environment="OLLAMA_HOST=0.0.0.0"
   ```
   En nano: `Ctrl + O`, `Enter`, `Ctrl + X`.
4. Aplica los cambios:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart ollama
   ```

---

## 🔍 Paso 2: Encontrar la IP de la Computadora A

La **Computadora B** (donde instalaste SmokeMirror) necesita saber la dirección de la Computadora A en la red.

### En Windows

1. Presiona `Windows + R`, escribe `cmd` y presiona Enter.
2. Escribe: `ipconfig`
3. Busca la línea **Dirección IPv4** o **IPv4 Address**.
   - Ejemplo: `192.168.1.105`

### En Linux

1. Abre la Terminal y escribe:
   ```bash
   hostname -I
   ```
2. El primer número suele ser tu IP local.
   - Ejemplo: `192.168.1.105`

> 📝 **Anota esta IP**, la necesitarás en el siguiente paso.

---

## 🌐 Paso 3: Conectar SmokeMirror a Ollama (Computadora B)

1. Abre SmokeMirror en la Computadora B.
2. Ve a **Configuración** (⚙️).
3. En **Dirección API de Ollama**, escribe la IP de la Computadora A:
   ```
   http://192.168.1.105:11434
   ```
   Reemplaza `192.168.1.105` por la IP que anotaste.
   - **No uses `localhost`**, eso solo funciona en la misma computadora.
4. Haz clic en **Probar conexión**.
5. Deberías ver: ✅ **Conectado**.

---

## 🤖 Paso 4: Crear tu Agente

Un agente es tu asistente personalizado. Puedes crear tantos como quieras.

1. Ve a **Gestión de Agentes**.
2. Haz clic en **Nuevo agente**.
3. Completa los datos:

   | Campo | Qué poner | Ejemplo |
   |-------|-----------|---------|
   | Nombre | Cómo se llamará tu asistente | Mi Asistente Remoto |
   | Modelo base | El modelo instalado en Ollama | `llama2`, `mistral`, `phi` |
   | Instrucciones (opcional) | Rol, tono y reglas | "Eres un experto en tecnología. Responde en español." |
   | Foto del agente | Imagen para identificar al agente | (sube una foto) |

4. Haz clic en **Guardar agente**.
5. Selecciona el agente desde el menú para usarlo en el chat.

---

## 💬 Paso 5: Chatea con tu IA

1. Ve a **Chat**.
2. Selecciona tu agente creado.
3. Escribe tu mensaje:
   > ¡Hola! Estoy hablando contigo desde otra computadora. ¿Cómo funciona esto?
4. Recibirás la respuesta del modelo que corre en la Computadora A.

---

## 🚀 Funcionalidades de SmokeMirror

### 👤 Perfil de Usuario
Crea tu identidad en la app:
- **Usuario y contraseña** (mínimo 8 caracteres).
- **Foto de perfil** personalizada.
- Cambia tu nombre o contraseña en cualquier momento (si ya hay contraseña, se te pedirá la actual).
- Tu perfil se guarda localmente y se carga al iniciar la app.

### ⚙️ Configuración
Desde esta sección puedes:
- Cambiar el **tema visual** entre Modo día y Modo noche.
- Configurar la **dirección de la API de Ollama**.
- **Probar la conexión** con Ollama y ver el estado en tiempo real.
- Establecer el **tiempo de inactividad** antes de que la app se bloquee automáticamente (mínimo 1 minuto).
- Guardar cambios protegido por contraseña (si configuraste una en tu perfil).

### 🔒 Pantalla de Bloqueo
- La app se bloquea automáticamente tras los minutos de inactividad configurados.
- Para desbloquear, ingresa tu contraseña. Si no hay contraseña configurada, basta con hacer clic.
- Muestra una animación de SmokeMirror mientras está bloqueada.

### 📎 Chat con Archivos Adjuntos
Puedes enviar archivos junto con tus mensajes:
- Arrastra y suelta un archivo en el área de chat, o usa el botón de adjuntar (📎).
- Vista previa del archivo antes de enviarlo (imágenes, código, PDF, documentos, texto).
- Iconos y colores distintos según el tipo de archivo:
  - 🖼️ Imágenes: `png`, `jpg`, `gif`, `webp`, etc.
  - 💻 Código: `js`, `ts`, `vue`, `py`, `html`, `css`, `json`, etc.
  - 📄 Documentos: `pdf`, `doc`, `docx`, `txt`, etc.

---

## 🌐 Resumen rápido: Conectar dos computadoras

1. **Computadora A (con Ollama):** configura `OLLAMA_HOST=0.0.0.0` y `OLLAMA_ORIGINS=*`, luego reinicia Ollama.
2. **Computadora A:** anota su IP local (ej: `192.168.1.105`).
3. **Computadora B (con SmokeMirror):** en Configuración, escribe `http://<IP>:11434`.
4. **Computadora B:** prueba la conexión hasta ver ✅ Conectado.
5. **Computadora B:** crea tu agente en Gestión de Agentes y empieza a chatear.

---

## ✅ Requisitos previos

- Tener **Ollama** instalado y ejecutándose en la Computadora A.
- Tener al menos un modelo descargado en Ollama (ej: `ollama pull llama2`).
- Ambas computadoras deben estar en la **misma red local Wi-Fi**.
- SmokeMirror instalado en la Computadora B.

---

## 📞 Soporte

Si tienes problemas para conectar:
1. Verifica que Ollama esté encendido en la Computadora A.
2. Confirma que ambas computadoras estén en la misma red Wi-Fi.
3. Revisa que el firewall no bloquee el puerto `11434`.
4. Prueba la conexión desde la sección Configuración de SmokeMirror.
