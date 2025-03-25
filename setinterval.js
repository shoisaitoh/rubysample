console.log("setinterval test!");

let hoge = 0;
function counter() {
  hoge += 1000;
  console.log(hoge);
  //console.log(intervalId);
};

let intervalId = setInterval(() => {
  if (hoge < 6000) {
    counter();
  } else {
    clearInterval(intervalId);
    console.log("end");
  }
}, 1000);