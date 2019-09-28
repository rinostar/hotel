1. What classes does each implementation include? Are the lists the same?
Same: CartEntry, ShoppingCart, Order.

2. Write down a sentence to describe each class.
CartEntry: the item added to ShoppingCart, with unit price and quantity info
ShoppingCart: a collection of all CartEntry items
Order: a unique ShoppingCart record with total price info

3. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
CartEntry exists within the array of ShoppingCart, which is initialized by a Order object

4. What data does each class store? How (if at all) does this differ between the two implementations?
CartEntry: unit price and quantity for the item(s)
ShoppingCart: each items within the current cart
Order: total price for the current cart

Implementation B let each class carries its own pricing info, while A sum the total price in Order class only. 

5. What methods does each class have? How (if at all) does this differ between the two implementations?
Implementation A has only one instance variable method, "total_price", within the Order class; Implementation B, on the other hand, has the instance variable method, "price", for the other two classes additionally.

6. Consider the Order#total_price method. In each implementation:
  1). Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  2). Does total_price directly manipulate the instance variables of other classes?
It makes sense to delegate price methods to lower level classes to keep the total price method at higher level clean. That way, Order class doesn't need to know "how" the prices at lower level is calculated; Instead, it just simply call for "what" the prices, which prevent direct manipulation and ensure loose coupling among classes.


7. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
If we apply bulk discount for specific items, prices would be different at lower level. Implementation B would easier to modify, since we can directly apply changes to price method at CartEntry class, which will isolate impact for other items not bought in bulk within the same shopping cart. 

8. Which implementation better adheres to the single responsibility principle?
Implementation B. 

9. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B.

10. To ensure the code's adaptability to future changes on room unit price, I will delegate the price info to the Room class, and call it from Reservation class to calculate total price per reservation. 