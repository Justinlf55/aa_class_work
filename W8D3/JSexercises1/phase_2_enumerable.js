Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]); 
  }
}


Array.prototype.myMap = function(callback) {
  let result = [];
  this.myEach((el) => {
    result.push(callback(el));
  })
  return result;
}

Array.prototype.myReduce = function(callback,initialValue) {
  let result;
  if (initialValue === undefined){
    result = 0;
    this.myEach((el) => { 
      result += callback(el);
    })
  } else { 
      result = initialValue;
      this.myEach((el) => {
        result += callback(el); 
      })
  }

  return result;
}



// [1,2,3,4].myReduce((el) => {
//   return el;
// },5)

