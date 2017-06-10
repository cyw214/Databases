This project models a business enterprise.

<b>The Enterprise: </b>
This Project Models REI. REI is a retail store that specializes in outdoor products. The interfaces take advantage processes in the buffer read class to clear the screen on upon any meaningful change from one menu to another. to enable a more dynamic experience, a back option is offered in many menus to go back to a previous menu. 

<b>Customer interface:</b>
The customer relation may be accessed from the first menu of the main interface offering a choice between interfaces. Following selection of the customer interface the user is prompted with two choices: a) store and b) online.

a) store: this selection represents a decision to shop at a physical location rather than online. upon selection of choice a), a customer is prompted with a shopping menu.
     a) select items 
     b) shopping cart
     c) check out
      
* a customer is considered anonymous until checkout in a physical store
* here are some usernames and logins for the online store:
username: cgriffin17
pass: 51hYbUp

username: wfox21 
pass: xk6ry2Jr1L

    a)select items - choosing select items opens a menu which presents 5 department     representing subtypes of the main product relation in the data base. selection of one of these subtypes or “departments” then brings the user to a 	screen where available products, broken down into more granular subtypes are listed and may be chosen. a selection of numbers associated with each product may be chosen to go to another menu asking the user whether or not he/she wishes to add a product to a market basket.
	upon selection the user is asked the quantity they wish to put into the shopping cart then returned to the previous menu. another product may be selected or the customer may choose to go back to the shopping menu.
	b) shopping cart: the shopping car allows a user to remove any quantity of a specified product from their cart and view the items currently in their cart.
	c) at check out, like in the shopping cart option. users are able to see what is in their cart, remove items if they wish and purchase products. A user can choose to pay by cash or by credit card. If paying by cash the user is recorded as an anonymous customer, represented by the id number 0 in the customer relation, and the first and last name Unkown. when a user enters their credit card if the user is already in the data base, with the specified first name, last name, credit card, and expiration date requested as an identifier for this particular instance, a cust_trans tuple is added to the cust_tran relation representing a transaction. the cust_trans relation records the price of one unit of a product, then the number of units bought by the customer.  If the user is not in the store_cust relation, then the customer is both added to the store_cust relation and logged as having made a purchase in the cust_trans relation.

b) online
    upon selection of online a customer is either asked to sign up or log in. if login is chose, the user enters their user name and password, is verified or rejected and continues to shop in store 111 which is designated as the online store. the only major difference between the online shopping experience and the physical store is that online credit card transactions are conducted automatically and the user has the option to view their profile. any user of the interface, if not a customer, may choose sign up, create an account and proceed to the store to shop if they so wish.
  

<b>Store manager interface:</b>
From the first menu offering a selection of interfaces a user may choose the store manager interface. Upon choosing this option,  a manager is asked to enter a store. After choosing the store, The store manager interface is populated with two options, customer and inventory. in customer the manager may view the total balance of any transaction that took place between a specified date along with all the transactions. The store manager may also choose to view customer profiles of customers whose data has been collected under customer profiles within this same menu.

the second set of choices allows for reorders from vendors, as well as an option to add products not in inventory from a list of available products not contained in inventory, but available through vendors.

<b>PLSQL:</b>
there are two triggers that take care of  much needed constraints on the data base. 

store_inv_after_cut_trans: subtracts the quantity of a product held from any given store inventory after any cut_trans, and automatically reorders if the balance drops to 0.

store_inv_after_vend_tran: updates the quantity of a product in a stores inventory after a vendor transaction and adds the product to inventory if the product is not contained in inventory.

there is one function: 
find_store_product which locates a given product and returns 1 if tis there and 0 if its not.

there is one procedure:
the order_product_from vendor procedure is used in the store_in v_after_cut_trans trigger to initiate an insertion of a vendor_tran into the vend_tran relation.
