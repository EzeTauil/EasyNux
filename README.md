# EasyNux

Domina Linux paso a paso 📄🚀

EasyNux es una herramienta interactiva diseñada para usuarios que se inician en el mundo Linux. Automatiza tareas comunes y facilita la instalación de paquetes esenciales, drivers, herramientas de rendimiento y conceptos básicos del sistema.

## Características principales

* ✅ Actualización del sistema con un solo clic.
* ✅ Instalación de herramientas esenciales como wget, curl, git, pip, etc.
* ✅ Instalación de drivers de video (y herramientas gaming como Steam, Lutris, Heroic).
* ✅ Visualización de información del sistema (RAM, CPU, disco, GPU).
* ✅ Módulo de aprendizaje de comandos básicos de Linux.
* ✅ Actualizador automático de EasyNux mediante Git.

## Instalación

### Paso 1 - Clonar el repositorio

```bash
git clone https://github.com/EzeTauil/EasyNux.git
cd EasyNux
```

### Paso 2 - Dar permisos de ejecución

```bash
chmod +x easy_nux.sh
chmod +x MODULOS/*.sh
```

### Paso 3 - Ejecutar la herramienta

```bash
./easy_nux.sh
```

## Requisitos

* Distribución basada en Debian/Ubuntu (Kubuntu, Xubuntu, Linux Mint, etc.)
* Conexión a internet para instalar paquetes

## Estructura del proyecto

```bash
EasyNux/
├── easy_nux.sh                  # Script principal
├── MODULOS/                     # Scripts individuales por función
│   ├── updateSyst.sh
│   ├── esenciales.sh
│   ├── optlinuxV2.sh
│   ├── check.sh
│   ├── comandos.sh
│   └── EasyNuxUP.sh
```
Sistema de actualizaciones

EasyNux detecta si hay cambios locales en los archivos antes de realizar una actualización desde GitHub. Si hay modificaciones en los scripts locales, se le pregunta al usuario si desea forzar la actualización (sobrescribiendo los cambios) o cancelar la operación para conservar su versión actual.

Esto protege la integridad de los datos del usuario, pero permite mantener EasyNux siempre actualizado con un simple clic.

## Créditos

Desarrollado por **BlackSec** ( EzeTauil ).

---

Si querés colaborar, podés hacer un fork, abrir un issue o sugerir mejoras.

☕ Hecho con pasión para hacer Linux más accesible.
