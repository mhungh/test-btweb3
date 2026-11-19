<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murach's Java Servlets and JSP — Your Cart</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <header class="store-header">
        <div class="header-inner">
            <a class="brand" href="index.jsp">
                <span class="brand-badge">CD SHOP</span>
                <span>Murach Music Store</span>
            </a>
            <nav class="nav-links">
                <a class="nav-link" href="index.jsp">Catalog</a>
                <a class="nav-link active" href="cart.jsp">Shopping Cart</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="page-card">
            <div class="page-header">
                <h1>Your cart</h1>
                <p class="subtitle">Review items, adjust quantities, or proceed to checkout</p>
            </div>

            <div class="table-wrap">
                <table>
                    <tr>
                        <th>Quantity</th>
                        <th>Description</th>
                        <th class="right">Price</th>
                        <th class="right">Amount</th>
                        <th class="right">Remove</th>
                    </tr>

                    <c:forEach var="item" items="${cart.items}">
                        <tr>
                            <td>
                                <form action="" method="post">
                                    <input type="hidden" name="productCode"
                                           value="<c:out value='${item.product.code}'/>">
                                    <input type="text" name="quantity"
                                           value="<c:out value='${item.quantity}'/>" id="quantity">
                                    <input type="submit" value="Update">
                                </form>
                            </td>
                            <td class="product-title"><c:out value='${item.product.description}'/></td>
                            <td class="right price-tag">${item.product.priceCurrencyFormat}</td>
                            <td class="right price-tag">${item.totalCurrencyFormat}</td>
                            <td class="right">
                                <form action="" method="post">
                                    <input type="hidden" name="productCode"
                                           value="<c:out value='${item.product.code}'/>">
                                    <input type="hidden" name="quantity" value="0">
                                    <input type="submit" value="Remove Item">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <p class="cart-note">
                <b>To change the quantity</b>, enter the new quantity and click on the Update button.
            </p>

            <div class="cart-actions">
                <div class="action-group">
                    <form action="" method="post">
                        <input type="hidden" name="action" value="shop">
                        <input type="submit" value="Continue Shopping">
                    </form>
                </div>

                <div class="action-group">
                    <form action="" method="post">
                        <input type="hidden" name="action" value="checkout">
                        <input type="submit" value="Checkout">
                    </form>
                </div>
            </div>
        </section>
    </main>
</body>
</html>