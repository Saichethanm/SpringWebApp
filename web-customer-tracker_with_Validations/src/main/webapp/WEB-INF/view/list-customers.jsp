<!-- jstl tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers List</title>

    <!-- reference our style sheet -->

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>

        <div id="content">

            <!-- put new button: Add Customer -->

            <p>

            <input type="button" value="Add Customer"
            onclick="window.location.href='showFormForAdd'; return false;"
            class="add-button"/>

            </p>

            <!-- add out html table here -->

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>

                <!-- loop over and print our Customers -->

                <c:forEach var="tempCustomer" items="${customers}">

                    <!-- construct an "update" link with customer id -->
                    <c:url var="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>

                    <!-- construct an "delete" link with customer id -->
                    <c:url var="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>


                    <tr>
                        <td> ${tempCustomer.firstName} </td>
                        <td> ${tempCustomer.lastName} </td>
                        <td> ${tempCustomer.email} </td>
                        <td>
                            <!-- display the update link -->
                            <a href="${updateLink}"> Update </a>
                            |
                            <!-- display the update link -->
                            <a href="${deleteLink}"
                            onclick="if (!(confirm('Are you sure you want to delete this customer'))) return false;"> Delete </a>
                        </td>

                    </tr>

                </c:forEach>

            </table>

        </div>
    </div>
</body>
</html>