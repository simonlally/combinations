# Currency Combinations

### Requirements: 

This project was built with ruby version 2.4.1, make sure you are running this version before proceeding.

This project uses yarn and bundler2.  Make sure you have both before proceeding. 
Instructions on upgrading to bunder2 may be found here: https://bundler.io/guides/bundler_2_upgrade.html

### Getting Started:

1. In the root directory run the following command:
    ``` yarn install  --check-files ```
    
2. Run ```bundler install``` to install gems.  

3. Run the command ```rails s``` to start the app.
    
4. To view the app navigate to ```localhost:3000``` in your browser.


## Technologies Used
This project uses 
- Rails 5.2.2.1 
- Vue.js
- Webpacker


The idea behind this project is to output all distinct currency combinations that make up a target value given  the name of each denomination along with the number required of
that denomination to reach our target sum.  The example in the screenshot below takes in four types of currency: quarters, dimes, nickels and pennies and how the quantity of each denomination that equals the target value of $1.  This input will print all coin combinations equalling up to the $1 target.

[![Screen-Shot-2019-03-28-at-11-31-49-AM.png](https://i.postimg.cc/v8jLRb0j/Screen-Shot-2019-03-28-at-11-31-49-AM.png)](https://postimg.cc/WtGJgLL6)

[![Screen-Shot-2019-03-28-at-11-32-26-AM.png](https://i.postimg.cc/2SmVBKHT/Screen-Shot-2019-03-28-at-11-32-26-AM.png)](https://postimg.cc/Yhnp5bBm)
