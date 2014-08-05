Calculator
=========

A simple calculator that can chain results

It has following features..

 - runs on a Node.js web application server; can be made to run on any web server with minimal changes
 - Supports addition, subtraction, division and multiplication
 - Supports clearing the last result to 0
 - User can type to interact with the calculator
 - Supported in Firefox, Safari, Chrome & IE
 - Supports mobile browsers
 - All buttons are clickable
 - Hover effect for buttons
 
About the code..

 - Written in Coffeescript & Less.js
 - Tested using Jasmine unit testing framework

Installation
=========

- Clone the git repository https://github.com/asirupa/calculator.git
- 'connect' and 'serve-static' node modules need to be installed in order to run this application.

 
 ```sh
git clone https://github.com/asirupa/calculator.git calculator
cd calculator
npm install -g connect
npm install -g serve-static

 ```

Running the application
=========

Once, the node modules are installed, 

- run "node server.js" 
- Then, load http://localhost:8080/index.html in the browser to use the application.

Running the unit tests
=========

- open jasmine-standalone-2.0.1/SpecRunner.html in any browser

Jasmine Tests
=========

- can be found in jasmine-standalone-2.0.1/spec/calculatorSpec.js

License
----

MIT


**Free Software**
