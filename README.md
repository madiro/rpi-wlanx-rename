# Renombrar interfaces Raspbian stretch

  Este script tiene como objetivo asignar un nombre permanente a las interfaces wifi en raspbian. Asignando permanentemente el nombre wlan0 al dispositivo wifi interno y, por ejemplo, wlan1 a un dispositivo USB. Dentro del script se encuentran dos posibilidades. Una en la cual se asignara wlan[X] dependiento del puerto usb donde se conecte siendo wlan1 el puerto sub superior izquierdo de la raspberry pi 3 y wlan4 el inferior derecho. La otra posibilidad asignara wlan1 al dispositivo wifi usb independientemente del puerto usb donde se conecte. Tenga en cuenta que en la segunda opcion, es muy probable que tenga conflictos si conecta mas de un dispositivo wifi por usb ya que los 2 o mas seran renombrados como wlan1
