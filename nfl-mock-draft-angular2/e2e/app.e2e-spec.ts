import { NflMockDraftAngular2Page } from './app.po';

describe('nfl-mock-draft-angular2 App', function() {
  let page: NflMockDraftAngular2Page;

  beforeEach(() => {
    page = new NflMockDraftAngular2Page();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
