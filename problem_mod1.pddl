; Esta versión cuenta con tres enfermos
(define (problem actividad3_problem_mod1) (:domain actividad3_domain_mod1)
(:objects 
    ambulancia - vehiculo
    enfermo1 enfermo2 enfermo3 - enfermo
    L1 L2 L3 L4 - localizacion
    
)

(:init
    ;Posiciones iniciales
    (ubicacion ambulancia L1)
    (ubicacion enfermo1 L4)
    (ubicacion enfermo2 L3)
    (ubicacion enfermo3 L3)
    ; Conexiones (considerando ambos sentidos)
    (enlace L1 L2)
    (enlace L2 L1)
    (enlace L2 L4)
    (enlace L4 L2)
    (enlace L4 L3)
    (enlace L3 L4)
    ; La ambulancia comienza vacia
    (amb_vacia ambulancia)
    


)

(:goal (and
    ; Posicion final
    (ubicacion enfermo1 L1)
    (ubicacion enfermo2 L1)
    (ubicacion enfermo3 L1)
    (ubicacion ambulancia L1)
    
    ; Para garantizar que los descarga
    (amb_vacia ambulancia)
    
))

)
