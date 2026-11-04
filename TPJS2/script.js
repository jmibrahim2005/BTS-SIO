function somme()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) + Number(b);
  
    document.getElementById("resultat").value=c;
}

function soustraction()
{
     var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) - Number(b);
  
    document.getElementById("resultat").value=c;


}

function produit()
{
     var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) * Number(b);
  
    document.getElementById("resultat").value=c;
}
function division()
{
     var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) / Number(b);
  
    document.getElementById("resultat").value=c;
}


function pair()
{
    var x = document.getElementById("t1").value
	if (x % 2 ==0){
    	document.getElementById("pair").value = " Paire "
	}
	else{
    	document.getElementById("pair").value = " Impaire "
	}
}

function permutation() {
    let n1 = document.getElementById("t1").value;
    let n2 = document.getElementById("t2").value;

    let temp;

    temp = n1;
    n1 = n2;
    n2 = temp;

    document.getElementById("t1").value = n1;
    document.getElementById("t2").value = n2;

    
}
function effacer(){
    document.getElementById("t1").value="";
    document.getElementById("t2").value="";
    document.getElementById("resultat").value="";
    document.getElementById("pair").value="";
}
