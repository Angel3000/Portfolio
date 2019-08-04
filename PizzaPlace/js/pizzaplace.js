function clearAll() {
	document.getElementById("formP").reset();
	document.getElementById("cart").style.opacity=0;
};

function getReceipt() {
	text1 = ""; // These initialize as empty strings but get passed from  
	text2 = ""; // function to function, growing line by line into a full receipt
    text2 = "<table><tr><th colspan=2>Receipt Detail:</th></tr>"
    var Total = 0;
    var T1 = '<tr><td>'
    var T2 = '</td><td>'
    var T3 = '</td></tr>'
    var ind = 0;
	var sizeArray = document.getElementsByClassName("size");
	for (var i = 0; i < sizeArray.length; i++) {
		if (sizeArray[i].checked) {
            var selectedSize = sizeArray[i].value;
            ind = i;
            text1 = text1+selectedSize+"<br>";
            text2 = text2+T1+selectedSize+T2;            
		}
    }
    
    switch (ind){
        case 0:
        Total = 6;
        break;

        case 1:
        Total = 10;
        break;
        
        case 2:
        Total = 14;
        break;

        case 3:
        Total = 16;
        break;
    }
    text2 = text2+"$"+Total+".00"+T3;

    var sauceArray = document.getElementsByClassName("sauce");
    ind = 0;
    for (var i = 0; i < sauceArray.length; i++) {
		if (sauceArray[i].checked) {
            var selectedSauce = sauceArray[i].value;
            text1 = text1+selectedSauce+"<br>";
            text2=text2+T1+selectedSauce+T2+"$0.00"+T3; 
		}
    }
    
    var cheeseArray = document.getElementsByClassName("cheese");
    ind = 0;
    for (var i = 0; i < cheeseArray.length; i++) {
		if (cheeseArray[i].checked) {
            var selectedCheese = cheeseArray[i].value;
            ind = i;
            text1 = text1+selectedCheese+"<br>";
            text2=text2+T1+selectedCheese+T2;
            if (ind == 2){
                Total = Total + 3;
                text2=text2+"$3.00"+T3;
            } else {
                text2=text2+"$0.00"+T3;    
            }
		}
    }
     

    var crustArray = document.getElementsByClassName("crust");
    ind = 0;
    for (var i = 0; i < crustArray.length; i++) {
		if (crustArray[i].checked) {
            var selectedCrust = crustArray[i].value;
            ind = i;
            text1 = text1+selectedCrust+"<br>";
            text2=text2+T1+selectedCrust+T2;
            if (ind == 2){
                Total = Total + 3;
                text2=text2+"$3.00"+T3;
            } else {
                text2=text2+"$0.00"+T3;    
            }
        }   
    }

    var meatArray = document.getElementsByClassName("meat");
    totalMeat = 0;
    for (var i = 0; i < meatArray.length; i++) {
		if (meatArray[i].checked) {
            var selectedMeat = meatArray[i].value;
            totalMeat = totalMeat + 1;
            text1 = text1+selectedMeat+"<br>";
            if (totalMeat < 2) {
                text2=text2+T1+selectedMeat;
            } else{
                text2=text2+", "+selectedMeat;
            } 
        }
    }
    if (totalMeat != 0){
    text2=text2+T2+"$"+totalMeat+".00"+T3;
    }
    if (totalMeat > 0){
        totalMeat = totalMeat - 1;
    }
    Total = Total + totalMeat; 
    
    var vegsArray = document.getElementsByClassName("vegs");
    totalVegs = 0;
    for (var i = 0; i < vegsArray.length; i++) {
		if (vegsArray[i].checked) {
            var selectedVegs = vegsArray[i].value;
            totalVegs = totalVegs + 1;
            text1 = text1+selectedVegs+"<br>";
            if (totalVegs < 2) {
                text2=text2+T1+selectedVegs;
            } else{
                text2=text2+", "+selectedVegs;
            } 
		}
    }
    
    if (totalVegs != 0){
        text2=text2+T2+"$"+totalVegs+".00"+T3;
        }
    if (totalVegs > 0){
        totalVegs = totalVegs - 1;
    }
    Total = Total + totalVegs;
   
    text2=text2+"<tr id='FinalR'><td>Final Price"+T2+"$"+Total+".00"+T3+"</table>";
    document.getElementById("cart").style.opacity=1;
    document.getElementById("totalPrice2").innerHTML = text2;
};