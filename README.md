# Rails Engine!
    Welcome to my first API build! This project utilizes RESTful routes and ActiveRecord to fetch your data.

## Routes
##### Merchant CRUD
* GET /api/v1/merchants -> Gets index page of all merchants
* GET /api/v1/merchants/:id -> Gets show page for a merchant
* POST /api/v1/merchants?name=FooBar -> Creates merchant with name
* PATCH /api/v1/merchants/:id?name=BarFoo -> Updates a merchant
* DESTROY /api/v1/merchants/:id -> Destroys a merchant

##### Item CRUD
* GET /api/v1/items -> Gets index of all items
* GET /api/v1/items/:id -> Gets show page for a item
* POST /api/v1/items?name=FooBar&description=Shiney -> Creates items with attributes
* PATCH /api/v1/items/:id?name=BarFoo&description=Rusty -> Updates an item's attributes
* DESTROY /api/v1/items/:id -> Destroys an item

##### Relationships
* Get /api/v1/merchants/:id/items -> Gets all items associated with a merchant
* Get /api/v1/items/:id/merchants -> Gets the merchant associated with an item

##### Find Endpoints
* Get /api/v1/merchant/find?name=FooBar -> Gets a merchant with name
* Get /api/v1/merchant/find_all?name=FooBar -> Gets a merchant with a partial match
* Get /api/v1/items/find?name=FooBar -> Gets an item with attribute
* Get /api/v1/items/find_all?name=FooBar -> Gets an item with partial match for an attribute

##### Business Intelligence Endpoints
* GET /api/v1/merchants/most_revenue?quantity=x -> Gets merchants with most revenue
* GET /api/v1/merchants/most_items?quantity=x -> Gets merchants with largest amount of items

##### Coming soon!
* GET /api/v1/revenue?start=<start_date>&end=<end_date> -> Revenue across Date Range
* GET /api/v1/merchants/:id/revenue -> Revenue for a merchant
