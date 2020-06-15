# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): User has_many entities, Property has_many Tenants, Entity has_many Properties
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User): Entity belongs_to User, Property belongs_to Entity, Tenant belongs_to Property
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients): User has_many Properties through Entities and Tenants through Properties, Entities has_many Tenants through Properties
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients): User has_many Properties through Entities and Tenants through Properties, Entities has_many Tenants through Properties
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity): Tenant, Property, and Entity has attributes that must be user submitted.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item): Validates presence and uniqueness where necessary
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes): Property and Tenant models have methods
- [x] Include signup (how e.g. Devise): Built manual
- [x] Include login (how e.g. Devise): Built manual
- [x] Include logout (how e.g. Devise): Built manual
- [x] Include third party signup/login (how e.g. Devise/OmniAuth): Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes): /properties/:id/tenants
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new):/users/:id/entities/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new): all forms validate

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate