| **Attribute**  | **Description**                            | **Type** | **Details / Notes**                                                            |
| -------------- | ------------------------------------------ | -------- | ------------------------------------------------------------------------------ |
| `invoice_no`   | Invoice number                             | Nominal  | 6-digit unique number per transaction. Starts with 'c' if its a cancellation. |
| `stock_code`   | Product (item) code                        | Nominal  | 5-digit unique number for each product.                                        |
| `description`  | Product (item) name                        | Nominal  | Name of the product.                                                           |
| `quantity`     | Quantities of each product per transaction | Numeric  | Number of units sold per transaction.                                          |
| `invoice_date` | Invoice date and time                      | Numeric  | Day and time when the transaction occurred.                                    |
| `unit_price`   | Unit price                                 | Numeric  | Price per unit in sterling (£).                                                |
| `customer_id`  | Customer number                            | Nominal  | 5-digit unique number assigned to each customer.                               |
| `country`      | Country name                               | Nominal  | Country where the customer resides.                                            |
