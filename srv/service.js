const cds = require('@sap/cds');

module.exports = class Sales extends cds.ApplicationService {
  
    async init () {
        const {OrderHead} = this.entities;

        this.before("NEW", OrderHead.drafts, (req) => {
            req.data.createOn = new Date().toISOString().slice(0,10);  //Only YYYY-MM-DD
            req.data.orderStatus_code = 'Open';           
        });

        return super.init();
    }

}