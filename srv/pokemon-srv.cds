namespace cappokebasic.srv;
using { cappokebasic.db as my } from '../db/db';

service pokemon {
    extend my.entrenadores with {
        level : Integer
    };
    entity entrenadores as projection on my.entrenadores;
    entity pokemones as projection on my.pokemones;
    entity items as projection on my.items;
    entity ciudades as select from my.ciudades where num_casas > 0;
}
