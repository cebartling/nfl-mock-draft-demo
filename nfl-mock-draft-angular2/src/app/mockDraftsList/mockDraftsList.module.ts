import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MockDraftsList } from './mockDraftsList.component';

@NgModule({
    imports: [CommonModule],
    declarations: [
        MockDraftsList
    ],
    providers: [],
    exports: [MockDraftsList]
})
export class MockDraftsListModule {}