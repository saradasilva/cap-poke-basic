const cds = require('@sap/cds')
module.exports = function (){
  this.before('CREATE', 'entrenadores',(req)=>{
    req.data.level = 1;
  });
}