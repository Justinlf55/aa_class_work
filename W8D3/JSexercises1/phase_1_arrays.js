Array.prototype.uniq = function(){
  let unique = [];
  for(let i = 0; i < this.length; i++ ){
    if (unique.includes(this[i]) === false){
        unique.push(this[i]);
    }
  }
  return unique;
}


Array.prototype.twoSum = function(){
  let pairs = [];
  for(let i =0; i< this.length; i++ ){
    for(let j = i+1; j < this.length; j++){
      if (this[i]+this[j] === 0 ){
        pairs.push([i,j]);
      }
    }
  }
  return pairs;
}


Array.prototype.transpose = function(){
  let ans = [];
  for (let i = 0; i < this.length; i++) {
    let row = [];
    for (let j = 0; j < this.length; j++) {
      row.push(this[j][i]);
    }
    ans.push(row);
  }
  return ans;
}