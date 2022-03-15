# Run the APP
1. In Terminal, `cd` into `veterinary_clinic`
2. Run `bundle install`
3. Run  `ruby ./bin/run.rb` to start the CLI
4. If the following error message is returned: `zsh: permission denied: ./bin/run.rb`, run the following command: `chmod +x ruby ./bin/run.rb`

# Deliverables 
A local veterinary clinic has asked you to make a CLI app to help them track their patients and those at other nearby clinics.

Today, we'll be creating a `Patient` class to add consistency / reusability and to expand on existing features.

## Break Out Activity #1

1. Let's start by cleaning up the CLI. Compartmentalize the menu logic into it's own method, `menu`. Call `menu` inside of `initialize_app` before verifying that your program still works. What are the benefits - for ourselves and other developers - of organizing our code in this manner?

2. In `Patient.rb`, create a `Patient` class. Back in `cli.rb`, refactor `create_patient` to create a new patient instance before outputting it in Terminal (`puts Patient.new`). After creating a new Patient, you should see `#<Patient:some mix of numbers and characters>` in your Terminal console. What does this output signify?

3. In the `Patient` class, create an `initialize` method that accepts `species`, `age`, `name`, `owner` and `phone` as params. Create corresponding instance variables for each (i.e., `@species`), assigning their values as necessary. How can we directly "get" and "set" these instance variables without using attribute accessor macros?

## Break Out Activity #2

4. At the beginning of the `Patient` class, add `attr_reader` and / or `attr_accessor`, setting `:id`, `:species`, `:age`, `:name`, `:owner`, and `:phone` accordingly. Should all of these attributes be both "readable" and "writable"?

5. In `cli.rb`, refactor `create_patient` to call `Patient.new` along with the user inputted values before assigning the new Patient instance to a variable, `p1`. Using `binding.pry`, verify that you can read new Patient attributes with `p1.id`, `p1.species`, `p1.age`, `p1.name`, `p1.owner`, and `p1.phone`. To assure that you can update these attributes, try setting the `age` to a new value in your Pry session.

6. Add a new class variable, `@@all`, to the `Patient` class. Shovel `self` into `@@all` at the end of `initialize`. Create a class method (i.e., `self.all`) that returns `@@all`. Using `binding.pry`, verify that you can retrieve an array of all existing Patient instances.

### Bonus

7. In `cli.rb`, refactor the `"1"` case block to iterate over `Patient.all` and print each patient's name. To check your work, run your app and create a few new patients before running `"1. List All Patients"`. How can we add `if...else` conditional logic to notify the user that there are no patients before returning them to the main menu?

8. How can we utilize `menu` more generally to make our CLI more user friendly? To experiment, try invoking this method within the appropriate case blocks set out in `cli.rb`.

9. In `Patient.rb`, add an instance method `give_name` that returns `@name`. Using `binding.pry`, test that the method successfully retrieves the `name` of any patient instance. Within `give_name`, how can we instead use `self` to return the `name` for any patient instance?