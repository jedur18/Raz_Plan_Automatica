

(define (domain actividad3_domain)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    vehiculo enfermo localizacion - object

)


(:predicates ;todo: define predicates here
    (ubicacion ?element - (either vehiculo enfermo) ?l - localizacion)
    (enlace ?l1 ?l2 - localizacion)
    (vacio ?a - vehiculo )
)


(:action conducir_vacio ; No hay pasajero subido
    :parameters (?ambulancia - vehiculo ?posInicial ?posFinal - localizacion)
    :precondition (and 
        (ubicacion ?ambulancia ?posInicial)
        (enlace ?posInicial ?posFinal)
        (vacio ?ambulancia)
    )
    :effect (and 
        (not (ubicacion ?ambulancia ?posInicial))
        (ubicacion ?ambulancia ?posFinal)

    )
)
(:action conducir_lleno ; Hay paciente subido
    :parameters (?ambulancia - vehiculo ?enfermo - enfermo ?posInicial ?posFinal - localizacion)
    :precondition (and 
        (ubicacion ?ambulancia ?posInicial)
        (ubicacion ?enfermo ?posInicial) ; Necesario para que sepa que enfermo lleva
        (enlace ?posInicial ?posFinal)
        (not(vacio ?ambulancia))
    )
    :effect (and 
        (not (ubicacion ?ambulancia ?posInicial))
        (ubicacion ?ambulancia ?posFinal)
        (not (ubicacion ?enfermo ?posInicial))
        (ubicacion ?enfermo ?posFinal)
    )
)

(:action cargar_enfermo
    :parameters (?enfermo - enfermo ?ambulancia - vehiculo ?localizacion - localizacion)
    :precondition (and 
        ; Que esten ambulancia y enfermo en la posicion inicial
        (ubicacion ?ambulancia ?localizacion)
        (ubicacion ?enfermo ?localizacion)
        ; Que la ambulancia vaya vacia
        (vacio ?ambulancia)
    )
    :effect (and 
        ; La ambulancia ya no esta vacia
        (not (vacio ?ambulancia))
    )
)
(:action descargar_enfermo
    :parameters (?enfermo - enfermo ?ambulancia - vehiculo ?localizacion - localizacion)
    :precondition (and 
        ; Que la ambulancia este en la posicion
        (ubicacion ?ambulancia ?localizacion)
        ; Que el enfermo este en la posicion (sino hace cosas raras y coge al otro enfermo)
        (ubicacion ?enfermo ?localizacion)
        ; Que la ambulancia este llena
        (not(vacio ?ambulancia))
    )
    :effect (and 
        ; La ambulancia vuelve a estar vacia
        (vacio ?ambulancia)
    )
)



)