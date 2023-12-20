describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit('localhost:3000');
  });

  it("There is products on the page", () => {

    cy.contains("My Cart")
    .should("include.text", "(0)")
    
    cy.contains("Add").click()
    
    cy.contains("My Cart")
    .should("include.text", "(1)")
  });  

});