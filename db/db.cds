namespace cappokebasic.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

type item {
    type   : String;
    efecto : Integer;
    precio: Decimal;
};

entity items : item {
    key ID: Integer;
};

entity entrenadores : cuid, managed {
    nombre    : String;
    mimochila : Composition of mochilas;
   /* pokemones : Composition of many pokemones
                    on pokemones.entrenador = $self;*/
}

entity mochilas : cuid {
    misItems  : array of item null;
}

entity ciudades {
    key ID        : Integer;
        name      : localized String;
        num_casas : Integer;
}

entity pokemones : cuid, managed {
    entrenador : Composition of one entrenadores;
    level      : Integer;
    name       : String;
}
