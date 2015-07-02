<!DOCTYPE HTML>
<html>
<head>
<title>Perform Billrun</title>
<meta charset="UTF-8" />
<meta name="Designer" content="PremiumPixels.com">
<meta name="Author" content="$hekh@r d-Ziner, CSSJUNTION.com">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/structure.css">

<meta charset="utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  
  $(function() {
    $( "#datepicker1" ).datepicker();
  });
  
  $(function() {
    $( "#datepicker2" ).datepicker();
  });
  
  $(function() {
    $( "#datepicker3" ).datepicker();
  });
  </script>




</head>

<body>

<form class="custTable" action="performBilling.php" method ="post" name="Bill Run Parameters">
  <table style="border: 1px solid black" align="center" class=""> 
    <tr>
	  <td class="billrun">EffectiveDate</td>
	  <td class="billrun">
	    <input type="date" name="EffectiveDate" id="datepicker" tabindex="1" required>
      </td>
	</tr>
    <tr>
	  <td class="billrun">WhereClause</td><td class="billrun">
	    <input type="text" name="WhereClause" tabindex="1">
	  </td>
	</tr>
    <tr>
	  <td class="billrun">
	    <input type="submit" name="ExecuteBillRun" value="ExecuteBillRun">
      </td>
	</tr>
</table>
</form>
<?php
if (isset($_POST['ExecuteBillRun'])) 
{
	
    $dbc=mysqli_connect('localhost','root','root','triLads_Billing');

    $EffDate     = $_POST["EffectiveDate"];
    $WhereClause = $_POST["WhereClause"];
    echo "EffDate and Where Clause are: " . $EffDate . " ..." . $WhereClause;
    $CustsForBillRunSql = "SELECT c.accountId, e.equipmentId, IFNULL(c.LastBillDate, STR_TO_DATE('01/01/2000', '%m/%d/%Y')) LastBillDate
                             FROM customer c, account a, equipment e
		    				WHERE IFNULL(c.LastBillDate, STR_TO_DATE('01/01/2000', '%m/%d/%Y')) < STR_TO_DATE('$EffDate', '%m/%d/%Y')
			    			  AND c.accountid = a.accountid
				    		  AND sysdate() BETWEEN c.StartDate AND c.EndDate
					    	  AND c.accountid = e.accountid " . $WhereClause;
    if ($CustsForBillRunCsr = mysqli_query($dbc, $CustsForBillRunSql))
	{
        echo "Number of rows fetched" . mysqli_num_rows($CustsForBillRunCsr);
        while($lCustForBillRun = mysqli_fetch_assoc($CustsForBillRunCsr))
        {
			echo "EquipmentId" . $lCustForBillRun['equipmentId'];
			$MeterId = $lCustForBillRun['equipmentId'];
			echo "Last Bill Date" . $lCustForBillRun['LastBillDate'] . "..";
			$LastBillDate = $lCustForBillRun['LastBillDate'];
            $NEStageSQL = "SELECT Meter_id, extract(YEAR_MONTH from StartDate) StartDate, extract(year_month from EndDate) EndDate, units_consumed 
			                 FROM ne_stage 
							WHERE Meter_id = $MeterId
							  AND str_to_date('$LastBillDate', '%Y-%m-%d') < StartDate
							  AND STR_TO_DATE('$EffDate', '%m/%d/%Y') > EndDate
							GROUP BY extract(YEAR_MONTH from StartDate), extract(year_month from EndDate) 
							ORDER BY Meter_Id, StartDate";
							
		    $NEStageCsr = mysqli_query($dbc, $NEStageSQL);
			while($NEStageRow = mysqli_fetch_assoc($NEStageCsr))
			{
				echo "Meter Id: " . $NEStageRow["Meter_id"];
				echo "Start Month: " . $NEStageRow["StartDate"];
				echo "End Month: " . $NEStageRow["EndDate"];
				echo "Units Consumed: " . $NEStageRow["units_consumed"];
				
				// Use Units Consumed, fetch Rates, compare currency, store in NE and charge tables, create subtotals and generate invoice.
				
			}	
			echo $lCustForBillRun["accountId"];
	        echo $lCustForBillRun["equipmentId"];
        }
	}
	else
	{
        echo "Error is :".mysqli_connect_error();
        echo "Error is :".mysqli_connect_errno();
	}

    mysqli_close($dbc);
}

?>
<footer id="main">
  <a href="http://wwww.cssjunction.com">Simple Login Form (HTML5/CSS3 Coded) by CSS Junction</a> | <a href="http://www.premiumpixels.com">PSD by Premium Pixels</a>
</footer>
</body>
</html>
