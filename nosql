// create and use ecommerce database
use ecommerce;

// inserting documents into the users collection
db.users.insertMany( [{
      "_id": ObjectId("6123456789abcdef01234567"),
      "userId": "user001",
      "name": "John Doe",
      "email": "john@example.com"
    },
    {
      "_id": ObjectId("abcdef012345678901234567"),
      "userId": "user002",
      "name": "Jane Smith",
      "email": "jane@example.com"
    }
]
)


// inserting documents into the products collection
db.products.insertMany( [
    {
      "_id": ObjectId("0123456789abcdef01234567"),
      "productId": "P001",
      "title": "Laptop",
      "category": "Electronics",
      "price": 999.99
    },
    {
      "_id": ObjectId("123456789abcdef012345678"),
      "productId": "P002",
      "title": "Smartphone",
      "category": "Electronics",
      "price": 699.99
    },
    {
      "_id": ObjectId("23456789abcdef0123456789"),
      "productId": "P003",
      "title": "Headphones",
      "category": "Electronics",
      "price": 99.99
    },
    {
      "_id": ObjectId("3456789abcdef01234567890"),
      "productId": "P004",
      "title": "Backpack",
      "category": "Fashion",
      "price": 49.99
    }
  ]
)
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('0123456789abcdef01234567'),
    '1': ObjectId('123456789abcdef012345678'),
    '2': ObjectId('23456789abcdef0123456789'),
    '3': ObjectId('3456789abcdef01234567890')
  }
}


/* retrieving all product details (title, category, price) 
   where the price is less than $50.
*/
db.products.find({price: {$lt:50}});


// Update the product price of the product with productId "P003" to $75.   
db.products.updateOne(
  { productId: "P003" },
  { $set: {price: 75} }
)

/* Insert a new product with the following details: 
	productId "P005", title "Smartwatch", category "Electronics", 
	and price $149.99.
*/
db.products.insertOne(
	{
		productId: "P005",
		title:  "Smartwatch",
		category: "Electronics",
		price: 149.99
	}
)


// Delete all products from the "Fashion" category.
db.products.deleteMany(
  { category: "Fashion" }
)
