<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Livres</title>
</head>
<body>
	<h1>Votre chariot</h1>
	<table>
		<tr>
			<th>Quantité</th>
			<th>Description</th>
			<th>Prix</th>
			<th>montant</th>
			<th></th>
		</tr>

		<c:forEach var="item" items="${cart.items}">
			<tr>
				<td>
					<form action="" method="post">
						<input type="hidden" name="productCode"
							value="<c:out value='${item.product.code}'/>"> <input
							type=text name="quantity"
							value="<c:out value='${item.quantity}'/>" id="quantity">
						<input type="submit" value="Update">
					</form>
				</td>
				<td><c:out value='${item.product.description}' /></td>
				<td>${item.product.priceCurrencyFormat}</td>
				<td>${item.totalCurrencyFormat}</td>
				<td>
					<form action="" method="post">
						<input type="hidden" name="productCode"
							value="<c:out value='${item.product.code}'/>"> <input
							type="hidden" name="quantity" value="0"> <input
							type="submit" value="Remove Item">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<p>
		<b>pour changer la quantite</b>, entrez la nouvelle quantite puis
		appuyer sur le bouton UPDATE.
	</p>

	<form action="" method="post">
		<input type="hidden" name="action" value="shop"> <input
			type="submit" value="Continuer vos achats">
	</form>

	<form action="" method="post">
		<input type="hidden" name="action" value="checkout"> <input
			type="submit" value="Checkout">
	</form>

</body>
</html>