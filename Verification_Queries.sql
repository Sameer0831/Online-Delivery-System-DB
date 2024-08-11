-- 1. Verify Customers and their Orders:
SELECT c.customer_name, o.order_id, o.total_amount, o.status
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id;
-- Purpose: Ensures that customers are correctly associated with their orders.

-- 2. Verify Orders and the Products within them:
SELECT o.order_id, p.product_name, op.quantity, op.price_at_purchase
FROM `Order` o
JOIN OrderProduct op ON o.order_id = op.order_id
JOIN Product p ON op.product_id = p.product_id;
-- Purpose: Checks if products are correctly linked to orders and the price/quantity details match.

-- 3. Verify Deliveries Associated with Orders:
SELECT o.order_id, d.delivery_date, d.delivery_status, dp.personnel_name
FROM `Order` o
JOIN Delivery d ON o.order_id = d.order_id
JOIN DeliveryPersonnel dp ON d.personnel_id = dp.personnel_id;
-- Purpose: Confirms that deliveries are correctly assigned to orders and handled by the right personnel.

-- 4. Verify Payments for Each Order:
SELECT o.order_id, p.payment_method, p.amount, p.payment_status
FROM `Order` o
JOIN Payment p ON o.order_id = p.order_id;
-- Purpose: Verifies that each order has the correct payment details associated with it.

-- 5. Verify Products in Inventory:
SELECT p.product_name, i.stock_quantity, i.reorder_level, i.last_restock_date
FROM Product p
JOIN Inventory i ON p.product_id = i.product_id;
-- Purpose: Ensures that product inventory levels are correctly maintained and linked.

-- 6. Verify Suppliers and the Products They Supply:
SELECT s.supplier_name, p.product_name, p.price
FROM Supplier s
JOIN Product p ON s.supplier_id = p.supplier_id;
-- Purpose: Ensures that products are correctly associated with their suppliers.

-- 7. Verify Orders and Applied Promotions:
SELECT o.order_id, p.promotion_code, p.description, p.discount_percentage
FROM `Order` o
JOIN OrderPromotion op ON o.order_id = op.order_id
JOIN Promotion p ON op.promotion_id = p.promotion_id;
-- Purpose: Checks if promotions are correctly linked to orders and the discounts are applied as expected

-- 8. Verify Delivery Personnel Availability Status:
SELECT dp.personnel_name, dp.availability_status, COUNT(d.delivery_id) AS active_deliveries
FROM DeliveryPersonnel dp
LEFT JOIN Delivery d ON dp.personnel_id = d.personnel_id AND d.delivery_status = 'Out for Delivery'
GROUP BY dp.personnel_name, dp.availability_status;
-- Purpose: Verifies the availability status of delivery personnel and counts their active deliveries.

-- 9. Verify Products by Category:
SELECT c.category_name, p.product_name, p.price
FROM Category c
JOIN Product p ON c.category_id = p.category_id
ORDER BY c.category_name;
-- Purpose: Ensures that products are correctly categorized and their prices are listed under the right category.

-- 10. Verify Total Amount of Orders for Each Customer:
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
-- Purpose: Confirms the total amount spent by each customer, helping to identify top customers.





