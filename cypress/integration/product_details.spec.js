describe('Product page', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
  });

  it("visits specific product page", () => {
    cy.get(".products article")
    .first()
    .click()

    cy.get("article.product-detail")
    .should("be.visible")
  });


});