 function range(start, end) {
   if (start === end){
     return [end];
   }
   if(start< end){
    return [start].concat(range(start+1, end));
   }else{
     return [start].concat(range(start-1, end));
   }

 }

 function sumRec(arr){
  if (arr.length === 0){
    return 0;
  }
  if (arr.length === 1){
    return arr[0];
  }

  return arr[0] += sumRec(arr.slice(1));

 }

function exponent(base,exp){
  if (exp === 0){
    return 1;
  }

  return base * exponent(base, exp-1)
}


function exponent2(base, exp){
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }

  if (exp%2 === 0){
    return exponent2(base, exp / 2) * exponent2(base, exp / 2);
  } else {
    return base * (exponent2(base, (exp - 1) / 2) * exponent2(base, (exp - 1) / 2));
  }

}

