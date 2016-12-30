import {Component} from '@angular/core';
import {AngularFire, FirebaseListObservable} from 'angularfire2';

@Component({
    selector: 'mock-drafts-list',
    templateUrl: './mockDraftsList.component.html',
    styleUrls: ['./mockDraftsList.component.css']
})
export class MockDraftsList {
    title = 'Mock Drafts';
    items: FirebaseListObservable<any[]>;

    constructor(af: AngularFire) {
        this.items = af.database.list('/mock-drafts');
    }
}
