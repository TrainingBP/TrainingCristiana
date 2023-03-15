import {LightningElement, wire, api} from 'lwc';
import adoptionLabel from '@salesforce/label/c.Adoptions';
import fetchAdoptions from '@salesforce/apex/AdoptionListController.fetchAdoptions';

export default class AdoptionList extends LightningElement {
    @api recordId;
    labels = {
        adoptionLabel
    }
    adoptions;

async connectedCallback() {
    try{
        this.adoptions = await fetchAdoptions({accountId : this.recordId});
        console.log('TTTTTT', this.adoptions);

    }catch (error) {
        console.error(error)
    }
   
}

// @wire(fetchAdoptions, {accountId : '$recordId'})
// wiredAdoptions ({error, data}) {
//     if(data) {
//          this.adoptions = data;
//          console.log(this.adoptions);
//          this.error = undefined;

//     } else if (error) {
//         console.error(error);
//     }
// }
}