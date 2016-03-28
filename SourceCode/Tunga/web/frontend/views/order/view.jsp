<%-- 
    Document   : index
    Created on : Mar 21, 2016, 10:09:09 AM
    Author     : Hoangha.FPT
--%>

<%@include file="../layout/header.jsp" %>
<div class="information">
    <h2>Order number:</h2>
    <div class="row">
        <div class="col-sm-12">
            <div class="order-number"><span class="col-sm-4 col-sm-offset-4 alert alert-success">${invoice.token}</span></div>
        </div>
    </div>
</div>
<div class="information">
    <h2>Your information</h2>
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <label class="control-label col-sm-3" for="fullName">Full name: </label>
                <div class="input-group col-sm-7">
                    ${invoice.fullName}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="email">Email: </label>
                <div class="input-group col-sm-7">
                    ${invoice.email}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="address">Address: </label>
                <div class="input-group col-sm-7">
                    ${invoice.address}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="phone">Phone: </label>
                <div class="input-group col-sm-7">
                    ${invoice.phone}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="phone">Order status: </label>
                <div class="input-group col-sm-7">
                    ${invoice.statusText}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="phone">Order date: </label>
                <div class="input-group col-sm-7">
                    ${invoice.createdAt}
                </div>
            </div>
        </div>
    </div>
    <div class="shopping-cart">
        <h2>Your order</h2>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-responsive table-striped">
                    <tr>
                        <th class="col-sm-5">Food's name</th>
                        <th class="col-sm-2">Price</th>
                        <th class="col-sm-2">Quantity</th>
                        <th class="col-sm-2">Sub-total</th>
                    </tr>
                    <c:forEach var="invoiceFood" items="${invoice.invoiceFoods}">
                        <tr>
                            <td>${invoiceFood.food.name}</td>
                            <td>${helper:currency(invoiceFood.food.price)}</td>
                            <td>${invoiceFood.quantity}</td>
                            <td>${helper:currency(invoiceFood.quantity * invoiceFood.food.price)}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3"><strong>Total:</strong></td>
                        <td class="total"><strong>${helper:currency(invoice.total)}</strong></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    <c:if test="${invoice.notify == 0}">
    var socket = new WebSocket("${helper:socketUrl()}/websocket");
    socket.onopen = function (e) {
        addInvoice();
    };
    function addInvoice() {
        var InvoiceAction = {
            action: "add",
            id: ${invoice.id}
        };
        socket.send(JSON.stringify(InvoiceAction));
    }
    </c:if>
</script>
<%@include file="../layout/footer.jsp" %>