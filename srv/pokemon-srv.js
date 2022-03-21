const cds = require('@sap/cds')
module.exports = function (){
  this.before('CREATE', 'entrenadores',(req)=>{
    req.data.level = 1;
  });
  this.on('READ', 'generation', async (req) =>{
      let sQuery;
    const pokedexApi = await cds.connect.to("pokedex");
    if (req.data.id) {
        sQuery = "/generation/" + req.data.id;
    }else{
        sQuery = "/generation/";
    }
      const generation = await pokedexApi.tx(req).get(sQuery);
    return generation;
  });
}