// function initForm() {
//   var formTemplate = document.getElementById("recipe-form-template").innerHTML
//   var template = Handlebars.compile(formTemplate)
//   document.getElementsByTagName("main")[0].innerHTML = template({'submitAction': 'createRecipe()'})
// }
//
// function createRecipe() {
//   var recipe = getRecipeVals()
//   var recipeTemplate = document.getElementById("recipe-template").innerHTML
//   var template = Handlebars.compile(recipeTemplate)
//   document.getElementById("main").innerHTML = template(recipe)
// }
//
// function updateRecipe() {
//   var recipe = getRecipeVals()
//   var recipeTemplate = document.getElementById("recipe-template").innerHTML
//   var template = Handlebars.compile(recipeTemplate)
//   document.getElementById("main").innerHTML = template(recipe)
// }
//
// function displayEditForm() {
//   var name = document.getElementById("nameHeader").innerText
//   var description = document.getElementById("recipeDescription").innerText
//   var ingredientsNodes = document.getElementsByName("ingredientsList")
//   var ingredients = []
//   for(var i=0;i<ingredientsNodes.length;i++) {
//     ingredients.push(ingredientsNodes[i].innerText)
//   }
//
//   var recipe = {name, description, ingredients, submitAction: 'createRecipe()'}
//
//   var recipeFormTemplate = document.getElementById("recipe-form-template").innerHTML
//   var template = Handlebars.compile(recipeFormTemplate)
//   document.getElementById("main").innerHTML = template(recipe)
// }
//
// function getRecipeVals() {
//   var ingredientsNodes = document.getElementsByName("ingredients")
//   var ingredients = []
//   for(var i=0;i<ingredientsNodes.length;i++) {
//     if(ingredientsNodes[i].value !== "") {
//       ingredients.push(ingredientsNodes[i].value)
//     }
//   }
//   var name = document.getElementById("name").value
//   var description = document.getElementById("description").value
//   var recipe = {name, ingredients, description}
//   return(recipe)
// }
//
// function handlebarsSetup() {
//   //put any handlebars registrations here.
//   Handlebars.registerHelper('displayIngredient', function(ingredient) {
//     return new Handlebars.SafeString('<li name="ingredientsList">' + ingredient + '</li>')
//   })
//   Handlebars.registerPartial('recipeDetailsPartial', document.getElementById("recipe-details-partial").innerHTML)
//   Handlebars.registerPartial('recipeFormPartial', document.getElementById("recipe-form-partial").innerHTML)
// }
//
//
// function init() {
//   //put any page initialization/handlebars initialization here
//   handlebarsSetup()
//   initForm()
// }
// document.addEventListener("DOMContentLoaded", function(event) {
//   init()
// })
//
//   <main id="main"></main>
//
//   <script id="recipe-template" type="text/x-handlebars-template">
//     <article>
//       <header><h2 id="nameHeader">{{name}}</h2></header>
//       <div>{{> recipeDetailsPartial }}</div>
//       <footer><a href="#" onclick="displayEditForm();">Edit Recipe</a></footer>
//     </article>
//   </script>
//
  // <script id="recipe-details-partial" type="text/x-handlebars-template">
  //   <p id="recipeDescription">{{description}}</p>
  //   <ul>
  //     {{#each ingredients}}
  //     {{ displayIngredient this }}
  //     {{/each}}
  //   </ul>
  // </script>
//
//   <script id="recipe-form-template" type="text/x-handlebars-template">
//     <form id="recipe-form" onsubmit="{{submitAction}};return false;">
//       {{> recipeFormPartial }}
//     </form>
//   </script>
//
//   <script id="recipe-form-partial" type="text/x-handlebars-template">
//     Name: <input id="name" type="text" value="{{name}}"><br>
//     Description: <input id="description" type="text" value="{{description}}"><br>
//     <h4>Ingredients</h4>
//     {{#each ingredients}}
//     <input name="ingredients" type="text" value="{{this}}"><br>
//     {{else}}
//     <input name="ingredients" type="text"><br>
//     <input name="ingredients" type="text"><br>
//     <input name="ingredients" type="text"><br>
//     <input name="ingredients" type="text"><br>
//     <input name="ingredients" type="text"><br>
//     {{/each}}
//     <input type="submit">
//   </script>
