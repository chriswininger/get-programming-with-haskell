const fs = require('fs');
const path = require('path');

const  HEADER = '# X          Y         Z\n';
const DATA_FILE = 'sqr-sum.dat';
const PATH_TO_DATA_FILE = path.resolve('./', DATA_FILE);

const xStart = 1;
const xEnd = 1000;

const yStart = 1;
const yEnd = 1000;

fs.writeFileSync(PATH_TO_DATA_FILE, HEADER);

for (let x = xStart; x < xEnd; x++) {

  for (let y = yStart; y < yEnd; y++) {
    const z = (x + y)^2;
  
    const dataStr = `${x} ${y} ${z}\n`;
    fs.appendFileSync(PATH_TO_DATA_FILE, dataStr);
  }
}

console.log('done');
