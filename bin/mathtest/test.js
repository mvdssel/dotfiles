var a = 1;
var b = a / 10;

for (var i = 0; i < 9; i++) {
    a = a - b;
}

var delta = 1 - a*10;
console.log(delta);
