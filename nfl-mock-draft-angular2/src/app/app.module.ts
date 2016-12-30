import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpModule} from '@angular/http';
import {AppComponent} from './app.component';
import {AngularFireModule} from 'angularfire2';

import {MockDraftsListModule} from './mockDraftsList/mockDraftsList.module'

export const firebaseConfig = {
    apiKey: "AIzaSyARFUq6069wW_8VHGryWuVxOMqfsETMGw4",
    authDomain: "nfl-mock-draft-demo.firebaseapp.com",
    databaseURL: "https://nfl-mock-draft-demo.firebaseio.com",
    storageBucket: "nfl-mock-draft-demo.appspot.com",
    messagingSenderId: "414476418606"
};

@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        BrowserModule,
        FormsModule,
        HttpModule,
        AngularFireModule.initializeApp(firebaseConfig),
        MockDraftsListModule
    ],
    providers: [],
    bootstrap: [AppComponent]
})

export class AppModule {
}
