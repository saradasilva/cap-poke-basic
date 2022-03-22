namespace cappokebasic.srv;
using { cappokebasic.db as my } from '../db/db';
using { northwind } from './external/northwind.csn';

service pokemon {
    extend my.entrenadores with {
        level : Integer
    };
    type nameUrl : {
        name: String;
        url: String;
    };
    type langName:{
        language: nameUrl;
        name: String;
    }
    entity generation {
        key id: Integer;
        name: String;
        main_region: nameUrl;
        moves: array of nameUrl;
        abilities: array of String;
        names: array of langName;
        pokemon_species: array of nameUrl;
        types: array of nameUrl;
        version_groups: array of nameUrl;
        results: array of nameUrl;
    }
    entity entrenadores as projection on my.entrenadores;
    entity pokemones as projection on my.pokemones;
    entity items as projection on my.items;
    entity ciudades as select from my.ciudades where num_casas > 0;


    entity Products as projection on northwind.Products;

    function getAllCities() returns array of ciudades;
}
