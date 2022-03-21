const cds = require('@sap/cds')
module.exports = function () {
    //const { ciudades } = this.entities;
    this.before('CREATE', 'entrenadores', (req) => {
        req.data.level = 1;
        /*if (!req.data.level) {
            req.error (409,`Level is not informed`);
        }*/  
    });
    this.on('getAllCities', async (req) => {
        const tx = cds.transaction(req);
        let cities = await tx.run(SELECT.from('ciudades'));
        return cities;
    });
}