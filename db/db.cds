namespace cappokebasic.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

type item {
    type     : String;
    quantity : Integer;
};

type pocion : item {
    curacion : Decimal;
}

type pokeball : item {
    exito : Decimal;
}

entity entrenadores : cuid, managed {
    nombre    : String;
    mimochila : Composition of one mochilas;
    pokemones : Composition of many pokemones on pokemones.entrenador = $self;
}

entity mochilas : cuid {
    pociones : pocion;
    pokeballs: pokeball;
}

entity ciudades {
    key ID: Integer;
    name: localized String;
    num_casas: Integer;
}

entity pokemones: cuid, managed {
    entrenador: Composition of one entrenadores;
    level: Integer;
    name: String;
}
