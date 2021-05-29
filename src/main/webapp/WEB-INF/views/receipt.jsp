<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="totalDiscount" value="${0}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Order Receipt</title>
    <link
      href="https://fonts.googleapis.com/css?family=Abel&display=swap"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
    <script>
      var deliveryLocation = prompt('Enter delivery location', '');
    </script>
    <style>
      * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
      }
      .text-center {
        text-align: center;
      }
      .clearfix:after {
        content: '';
        display: table;
        clear: both;
      }

      a {
        color: #5d6975;
        text-decoration: underline;
      }

      body {
        position: relative;
        width: 1070px;
        height: auto;
        margin: 0 auto;
        color: #001028;
        background: #ffffff;
        font-family: abel;
        font-size: 23px;
      }
      hr {
        margin: 0 auto;
        margin-top: 35px;
        width: 40%;
        border: 0;
        height: 1px;
        background-image: linear-gradient(
          to right,
          rgba(255, 255, 255, 0),
          rgba(255, 255, 255, 0.75),
          rgba(255, 255, 255, 0)
        );
      }
      header {
        padding: 20px 0;
        margin-bottom: 45px;
      }

      #logo {
        text-align: center;
        margin-bottom: 20px;
      }

      #logo img {
        width: 230px;
      }

      h4 {
        color: #80b7c4;
      }

      main {
        padding: 10px;
      }

      #project {
        float: left;
      }

      #project span {
      }

      #company {
        float: right;
        text-align: left;
        padding-bottom: 30px;
      }
      #project span,
      #company span {
        font-size: 24px;
        color: #5d6975;
        display: inline-block;
      }

      #project div,
      #company div {
        white-space: nowrap;
        padding: 2px;
        font-family: abel;
        font-size: 32px;
      }
      main .container {
        margin-bottom: 30px;
      }

      .tablebody {
        margin-top: 30px;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 30px;
        font-family: abel;
      }

      /* table tr:nth-child(2n-1) td {
		  background: #F5F5F5;
		} */

      table th,
      table td {
        text-align: right;
      }

      table th {
        padding: 5px 8px;
        color: #5d6975;
        border-bottom: 1px solid #c1ced9;
        white-space: nowrap;
        font-weight: normal;
      }

      table .service,
      table .desc {
        text-align: left;
      }

      table .o-p td {
        padding: 4px;
        padding-right: 18px;
      }

      table td {
        padding: 16px 18px;
        text-align: right;
      }

      table td.service,
      table td.desc {
        /* vertical-align: top; */
      }

      table td.unit,
      table td.qty,
      table td.total,
      table td.service {
        /* font-size: 1.2em; */
      }

      .o-p {
        font-size: 1.15em;
      }

      table td.grand {
        border-top: 1px solid #5d6975;
      }

      #notices .notice {
        color: #5d6975;
        font-size: 1em;
        font-family: abel;
      }

      footer {
        color: #5d6975;
        width: 100%;
        height: auto;
        border-top: 1px solid #c1ced9;
        margin-top: 15px;
        padding-top: 15px;
        text-align: center;
      }
      .clearfix {
        clear: both;
      }
    </style>
  </head>
  <body style="background: #f0f0f0">
    <div id="receipt" style="padding: 60px; background-color: #fff">
      <header class="clearfix" style="background-color: #000">
        <div id="logo">
          <img
            src="/public/images/logo-white.png"
            style="padding-bottom: 40px; padding-right: 30px"
          /><br />
          <img src="/public/images/logo2.png" />
          <hr />
        </div>
      </header>
      <div>
        <div class="container" style="margin-bottom: 15px">
          <div id="company" class="clearfix">
            <div>
              <b>Invoice No. <span>${order.id}</span></b>
            </div>
            <div><span>+977 981-334-4166</span></div>
            <div>
              <a href="mailto:exampple.com"
                ><span>your_email@example.com</span></a
              >
            </div>
          </div>

          <div id="project">
            <div><b>${order.customer.fullname}</b></div>
            <div><span>${order.customer.contactNumber }</span></div>
            <div><span id="dLocation"></span></div>
            <div>
              <span><fmt:formatDate type="date" value="${now}" /></span>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>

        <table>
          <thead>
            <tr>
              <th class="desc">PRODUCT</th>
              <th class="service">PRICE</th>
              <th>QTY</th>
              <th>TOTAL</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${order.customerOrderItems}" var="item">
              <c:set
                var="totalDiscount"
                value="${totalDiscount + item.discount}"
              />
              <tr>
                <td class="desc">${item.product}</td>
                <td class="service">${item.sellingPrice}</td>
                <td class="qty">${item.quantity}</td>
                <td class="total">${item.totalSellingPrice}</td>
              </tr>
            </c:forEach>

            <tr class="o-p">
              <td colspan="3" style="padding-top: 28px">SUB TOTAL:</td>
              <td class="total" style="padding-top: 28px">
                ${order.grandTotal + totalDiscount}
              </td>
            </tr>

            <tr class="o-p">
              <td colspan="3">DISCOUNT:</td>
              <td class="total">${totalDiscount}</td>
            </tr>
            <tr class="o-p">
              <td colspan="3" style="padding-bottom: 25px">DELIVERY CHARGE</td>
              <td class="total" style="padding-bottom: 25px">
                ${order.deliveryPrice}
              </td>
            </tr>
            <tr class="o-p">
              <td colspan="3" class="grand total" style="padding-top: 25px">
                GRAND TOTAL
              </td>
              <td class="grand total" style="padding-top: 25px">
                <strong>NRS. ${order.grandTotal}</strong>
              </td>
            </tr>
          </tbody>
        </table>

        <div id="notices">
          <div>NOTICE:</div>
          <div class="notice">
            7 days return/exchange.
            <b style="color: red"
              >Please do not throw the bill for return/exchange.</b
            >
          </div>
        </div>
      </div>
      <footer>THANK YOU | <span>&#10084;</span> FASHION MANAGER</footer>
    </div>
    <script>
      $('#dLocation').text(deliveryLocation);
      html2canvas(document.getElementById('receipt')).then(function (canvas) {
        document.write(
          '<div style="text-align: center;"><img alt="receipt" src="' +
            canvas.toDataURL('image/png') +
            '"/></div>'
        );
      });
    </script>
  </body>
</html>
