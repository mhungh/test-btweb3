<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murach's Java Servlets and JSP — Order Confirmation</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <style>
        .order-status {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            background-color: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 16px 20px;
            border-radius: 8px;
            margin-bottom: 22px;
        }
        .status-badge {
            background-color: #059669;
            color: #ffffff;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 999px;
            letter-spacing: 0.4px;
        }
        .summary-box {
            margin-top: 20px;
            padding: 18px 20px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
        }
        .summary-total {
            padding-top: 10px;
            margin-top: 4px;
            border-top: 1px solid #cbd5e1;
            font-size: 18px;
            font-weight: 700;
            color: #0f766e;
        }
        .empty-cart-box {
            background-color: #fffbeb;
            border: 1px solid #fde68a;
            color: #92400e;
            padding: 18px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .footer-actions {
            margin-top: 24px;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
        }
    </style>
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
                <a class="nav-link" href="cart.jsp">Shopping Cart</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="page-card">
            <div class="page-header">
                <h1>Order Summary &amp; Checkout</h1>
                <p class="subtitle">Thank you for shopping at Murach Music Store</p>
            </div>

            <c:choose>
                <c:when test="${not empty cart && not empty cart.items}">
                    <div class="order-status">
                        <div>
                            <strong>Checkout ready</strong> &mdash; Your selected CDs are listed below.
                        </div>
                        <span class="status-badge">CONFIRMED</span>
                    </div>

                    <div class="table-wrap">
                        <table>
                            <tr>
                                <th>Code</th>
                                <th>Description</th>
                                <th class="right">Qty</th>
                                <th class="right">Unit Price</th>
                                <th class="right">Amount</th>
                            </tr>

                            <c:set var="totalQty" value="0" />
                            <c:set var="grandTotal" value="0" />

                            <c:forEach var="item" items="${cart.items}">
                                <c:set var="totalQty" value="${totalQty + item.quantity}" />
                                <c:set var="grandTotal" value="${grandTotal + item.total}" />
                                <tr>
                                    <td><strong><c:out value="${item.product.code}"/></strong></td>
                                    <td class="product-title"><c:out value="${item.product.description}"/></td>
                                    <td class="right"><c:out value="${item.quantity}"/></td>
                                    <td class="right price-tag">${item.product.priceCurrencyFormat}</td>
                                    <td class="right price-tag">${item.totalCurrencyFormat}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="summary-box">
                        <div class="summary-row">
                            <span>Total CD items:</span>
                            <strong><c:out value="${totalQty}"/></strong>
                        </div>
                        <div class="summary-row">
                            <span>Shipping:</span>
                            <span>Free ($0.00)</span>
                        </div>
                        <div class="summary-row summary-total">
                            <span>Total Payment:</span>
                            <span><fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="$"/></span>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="empty-cart-box">
                        <strong>Your cart is currently empty.</strong> Please add at least one CD before checking out.
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="footer-actions">
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="shop">
                    <input type="submit" value="Continue Shopping">
                </form>
                <a class="btn-secondary" href="cart.jsp">&larr; Back to Cart</a>
            </div>
        </section>
    </main>
</body>
</html>