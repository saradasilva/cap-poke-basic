const cds = require('@sap/cds')
module.exports = function () {
    //const { ciudades } = this.entities;
    this.before('CREATE', 'entrenadores', (req) => {
        req.data.level = 1;
        /*if (!req.data.level) {
            req.error (409,`Level is not informed`);
        }*/
    });
    this.on('READ', 'generation', async (req) => {
        let sQuery;
        const pokedexApi = await cds.connect.to("pokedex");
        if (req.data.id) {
            sQuery = "/generation/" + req.data.id;
        } else {
            sQuery = "/generation/";
        }
        const generation = await pokedexApi.tx(req).get(sQuery);
        return generation;
    });
    this.on('getAllCities', async (req) => {
        const tx = cds.transaction(req);
        let cities = await tx.run(SELECT.from('ciudades'));
        return cities;
    });
}