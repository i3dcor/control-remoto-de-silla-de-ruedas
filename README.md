# Control inalámbrico de silla de ruedas

Proyecto de un mando inalámbrico para que una usuaria, sentada en su silla de ruedas, controle sus dos ruedas mientras puede mover las manos para dar indicaciones a su perro en competiciones de adiestramiento canino. Este es el objetivo de uso: el repositorio reúne el código del emisor, firmware compilado, diseños mecánicos y material de investigación para desarrollarlo.

## Para qué se desarrolla

Durante el adiestramiento, la usuaria necesita coordinar sus desplazamientos con las señales que da a su perro. El propósito es que el mando pueda acompañar el movimiento de su mano, permitiéndole dirigir la silla sin tener que mantenerla en una posición fija sobre un control unido a ella.

El diseño debe combinar el control de avance y giro de las dos ruedas con un mando cómodo de sujetar y manejar. La colocación, el agarre y la facilidad para alternar entre conducir y dar indicaciones al perro forman parte de la adaptación a su uso real.

## Estado del proyecto

El [emisor micro:bit](microbit-joystick-2-ruedas/main.ts) implementa la lectura de un joystick y el envío de órdenes para ambas ruedas. Hay también un [archivo compilado identificado como receptor de radio](microbit/microbit-microbit-joystick-2-ruedas-radio-receiver.hex). Su presencia no acredita por sí sola la compatibilidad con el emisor actual ni el funcionamiento completo de mando, receptor, controladores y motores.

El material revisado no permite afirmar que el conjunto esté validado en competición. La interacción implementada en el emisor es mediante joystick; la ergonomía del mando durante las señales al perro queda por evaluar con la usuaria.

## Cómo funciona el emisor

El código de [MakeCode](microbit-joystick-2-ruedas/pxt.json) lee los ejes del joystick en **P0 y P1**, aplica una zona muerta central y calcula un valor para cada rueda. Para girar, reduce el valor de una respecto a la otra.

Transmite por **radio micro:bit, grupo 1**, tres mensajes separados: `reverse`, `left` y `right`. Cada ciclo incluye una pausa de **500 ms**. Los valores calculados son órdenes transmitidas, no una comprobación del movimiento real de las ruedas.

### Limitaciones actuales

- **Marcha atrás:** `reverse += 1` acumula el valor y las otras ramas usan `reverse += 0`, sin restablecerlo. El código actual no permite afirmar un control fiable de la marcha atrás.
- **Actualización y enlace:** la pausa de 500 ms limita la frecuencia de actualización. El emisor no comprueba confirmaciones del receptor; tampoco permite verificar cómo se detienen los motores ante una pérdida de señal.
- **Pruebas:** [test.ts](microbit-joystick-2-ruedas/test.ts) contiene únicamente un comentario, sin pruebas implementadas. Queda por verificar el comportamiento del conjunto sobre el hardware real.

## Navegación del proyecto

| Material | Qué contiene |
|---|---|
| [microbit-joystick-2-ruedas/](microbit-joystick-2-ruedas/) | Proyecto MakeCode del emisor. Su [README original](microbit-joystick-2-ruedas/README.md) conserva la referencia al proyecto de origen y las instrucciones de importación. |
| [microbit/](microbit/) | Archivos de firmware compilado, incluido el receptor de radio. |
| [3d/](3d/) | Modelos de carcasas del mando, adaptadores, abrazaderas y cajas de batería en STL, 3MF y OpenSCAD. |
| [doc/](doc/) | Memorias, propuestas, imágenes y vídeos del desarrollo; entre los documentos figura «Memoria silla eléctrica.pdf». |
| [ble/](ble/) | Experimentos y referencias Bluetooth Low Energy para ESP32 y MicroPython. Son una línea de exploración distinta del emisor por radio; [ble_joystick.py](ble/esp32micropython/ble_joystick.py) contiene un ejemplo de temperatura simulada. |
| [bldc-hardware/](bldc-hardware/README.md) | Diseños de referencia del controlador VESC, con esquemas y archivos KiCad. |
| [Joystick-Controlled-Wheelchair-BLDC-master/](Joystick-Controlled-Wheelchair-BLDC-master/wheelchair_simple_with_brake/README.md) | Referencia de control de silla con Arduino Mega y motores BLDC. No demuestra su integración con el mando micro:bit. |

## Licencias y procedencia

La raíz incluye una [licencia GNU AGPL v3](LICENSE). También se conservan materiales de terceros con avisos propios: el [hardware VESC](bldc-hardware/README.md) declara CC BY-SA 4.0 y la [carcasa Mini Joystick Housing](3d/Mini_Joystick_Housing__With_Space_For_Arduino_Micro_Pro_Leonardo/LICENSE.txt) declara CC BY 3.0. Consulta la procedencia y los avisos de cada componente antes de reutilizarlo; no se presupone una licencia uniforme para todo el repositorio.
