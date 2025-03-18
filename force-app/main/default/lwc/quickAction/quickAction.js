import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import parseTransactions from "@salesforce/apex/QuickActionController.parseTransactions";

export default class QuickAction extends LightningElement {
    @api recordId;
    @api async invoke() {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Parsing transactions'
        }));
        console.log(this.recordId);
        let response = await parseTransactions({ accountId: this.recordId});

        this.dispatchEvent(new ShowToastEvent({
            title: response
        }));
    }
}