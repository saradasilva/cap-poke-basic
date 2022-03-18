namespace cappokebasic.srv;
using { cappokebasic.db as my } from '../db/db';

service pokemon {
    entity entrenadores : my.entrenadores{
        level : Integer
    };
    entity mochilas as projection on my.mochilas;
    entity pokemones as projection on my.pokemones;
    entity ciudades as select from my.ciudades where num_casas > 0;
}
