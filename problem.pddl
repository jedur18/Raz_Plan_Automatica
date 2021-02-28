
(define (problem actividad3_problem) (:domain actividad3_domain)
(:objects 
    ambulancia - vehiculo
    enfermo1 enfermo2 - enfermo
    L1 L2 L3 L4 - localizacion
    
)

(:init
    ;Posiciones iniciales
    (ubicacion ambulancia L1)
    (ubicacion enfermo1 L4)
    (ubicacion enfermo2 L3)
    ; Conexiones (considerando ambos sentidos)
    (enlace L1 L2)
    (enlace L2 L1)
    (enlace L2 L4)
    (enlace L4 L2)
    (enlace L4 L3)
    (enlace L3 L4)
    ; La ambulancia comienza vacia
    (vacio ambulancia)
)

(:goal (and
    ; Posicion final
    (ubicacion enfermo1 L1)
    (ubicacion enfermo2 L1)
    (ubicacion ambulancia L1)
    ; Para garantizar que los descarga
    (vacio ambulancia)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
