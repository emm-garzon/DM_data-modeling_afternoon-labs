CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(25),
  "last_name" VARCHAR(25),
  "user_email" VARCHAR(50),
  "password_hash" VARCHAR(500)
);

CREATE TABLE "ingredients" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "ingredient_name" VARCHAR(50)
);

CREATE TABLE "recipe" (
  "recipe_id" SERIAL PRIMARY KEY,
  "recipe_name" VARCHAR(50),
  "author_id" INT NOT NULL,
  "ingredients_list" INT NOT NULL,
  "cooking_instructions" VARCHAR(2000),
  "private" boolean
);

CREATE TABLE "recipe_ingredients" (
  "recipe_ingredients_id" SERIAL PRIMARY KEY,
  "recipe_id" INT NOT NULL,
  "ingredients" INT NOT NULL,
  "quantity" INT NOT NULL
);

CREATE TABLE "grocery_list" (
  "grocery_list_id" SERIAL PRIMARY KEY,
  "author_id" INT NOT NULL,
  "item" INT NOT NULL,
  "quantity" INT NOT NULL
);

CREATE TABLE "occasion" (
  "occasion_id" SERIAL PRIMARY KEY,
  "occasion_name" VARCHAR(50),
  "author_id" INT NOT NULL,
  "recipe_id" INT NOT NULL
);

ALTER TABLE "recipe" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "recipe" ADD FOREIGN KEY ("ingredients_list") REFERENCES "recipe_ingredients" ("recipe_ingredients_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("ingredients") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("item") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "occasion" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "occasion" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id");
