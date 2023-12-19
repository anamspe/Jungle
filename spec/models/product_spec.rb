require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    it "is valid with valid attributes" do
      category = Category.new({ name: "Flowers" })
      product = Product.new({
          name: "Tulips", 
          quantity: 5, 
          price: 15.99,
          category: category
        })

      expect(product).to be_valid
    end
       
    it "is not valid without a name" do
      category = Category.new({ name: "Flowers" })
      product = Product.new({ 
          name: nil,
          quantity: 5, 
          price: 15.99,
          category: category
        })

      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without price" do
      category = Category.new({ name: "Flowers" })
      product = Product.new({
          name: "Tulips", 
          quantity: 5, 
          category: category
        })

      
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without quantity" do
      category = Category.new({ name: "Flowers" })
      product = Product.new({
          name: "Tulips", 
          quantity: nil,
          price: 15.99,
          category: category
        })
      
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")      
    end

    it "is not valid without a category" do      
      product = Product.new({
          name: "Tulips", 
          quantity: 5, 
          price: 15.99,
          category: nil
        })

      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
  
end
