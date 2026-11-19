<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murach's Java Servlets and JSP — CD Store</title>
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
                <a class="nav-link active" href="index.jsp">Catalog</a>
                <a class="nav-link" href="cart.jsp">Shopping Cart</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="page-card">
            <div class="page-header">
                <h1>CD list</h1>
                <p class="subtitle">Select an album to add to your shopping cart</p>
            </div>

            <div class="table-wrap">
                <table>
                    <tr>
                        <th>Description</th>
                        <th class="right">Price</th>
                        <th class="right">Action</th>
                    </tr>
                    <tr>
                        <td class="product-title">86 (the band) - True Life Songs and Pictures</td>
                        <td class="right price-tag">$14.95</td>
                        <td class="right">
                            <form action="cart" method="post">
                                <input type="hidden" name="productCode" value="8601">
                                <input type="submit" value="Add To Cart">
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td class="product-title">Paddlefoot - The first CD</td>
                        <td class="right price-tag">$12.95</td>
                        <td class="right">
                            <form action="cart" method="post">
                                <input type="hidden" name="productCode" value="pf01">
                                <input type="submit" value="Add To Cart">
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td class="product-title">Paddlefoot - The second CD</td>
                        <td class="right price-tag">$14.95</td>
                        <td class="right">
                            <form action="cart" method="post">
                                <input type="hidden" name="productCode" value="pf02">
                                <input type="submit" value="Add To Cart">
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td class="product-title">Joe Rut - Genuine Wood Grained Finish</td>
                        <td class="right price-tag">$14.95</td>
                        <td class="right">
                            <form action="cart" method="post">
                                <input type="hidden" name="productCode" value="jr01">
                                <input type="submit" value="Add To Cart">
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </section>
    </main>
</body>
</html>