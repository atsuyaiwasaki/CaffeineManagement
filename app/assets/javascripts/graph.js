var jikan = new Date();
var nowHour = jikan.getHours();
var todayH6M00 = 0;
var todayH9M00 = 0;
var todayH12M00 = 0;
var todayH15M00 = 0;
var todayH18M00 = 0;
var todayH21M00 = 0;
var todayH24M00 = 0;
var yesterdayH6M00 = 0;
var yesterdayH9M00 = 0;
var yesterdayH12M00 = 0;
var yesterdayH15M00 = 0;
var yesterdayH18M00 = 0;
var yesterdayH21M00 = 0;
var yesterdayH24M00 = 30;
var name_list = gon.name_list;
var Daytime = ["7:00","8:00","9:00","10:00","11:00","12:00"];
//-----------------------------------初期設定---------------------------
var config = {
    type: 'line',
    data: {
        labels: ["6:00", "9:00", "12:00", "15:00", "18:00", "21:00", "24:00"],
        datasets: [{
            label: "2017/11/28",
            backgroundColor: window.chartColors.red,
            borderColor: window.chartColors.red,
            scaleFontColor:"rgba(0,0,0,0.2)",
            fill: false,
            data: [
              todayH6M00,
              todayH9M00,
              todayH12M00,
              todayH15M00,
              todayH18M00,
              todayH21M00,
              todayH24M00
            ],
        }
        , {
            label: "2017/11/27",
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            fill: false,
            data: [
            yesterdayH6M00,
            yesterdayH9M00,
            yesterdayH12M00,
            yesterdayH15M00,
            yesterdayH18M00,
            yesterdayH21M00,
            yesterdayH24M00
            ],
        }]
    },
    options: {
        responsive: true,
        title:{
            display:true,
            text:'カフェイの血中濃度'
        },
        scales: {
            xAxes: [{
                drawBorder:false,
                gridLines:{
              }
            }],
            yAxes: [{
              gridLines:{
                  highlightVerticalLine: true,
                  color: ['', 'red', 'orange', 'green','']
                  /*color:fuction(context){
                    var index = context.dataIndex;
                    var value = context.dataset.data[index];
                    return value < 0 ? 'red' :
                           index % 2 ? 'blue':
                           'green';
                  }*/
              },
              ticks: {
                  min :0,
                  max:180,
                  stepSize:30
              }
            }]
        }
    }
};
//console.log(config);//-----------------------------ﾃﾞﾊﾞｯｸﾞ-------------------------------------------------
function add(i) {
  //console.log(i);
    return i+20;
};
window.onload = function() {
    var ctx = document.getElementById("canvas").getContext("2d");
    window.myLine = new Chart(ctx, config);
};
var i=nowHour;
var setC  = "blue"
function setNowTime(){
  console.log(i-1+":00");
  nowDisplay=[i-3+":00",i-2+":00",i-1+":00",i+":00",i+1+":00",i+2+"00",i+3+"00"];
  config.options.scales.xAxes[0].gridLines.color=["","","", setC, "", "",""];
  config.options.scales.xAxes[0].gridLines.lineWidth=null;
  config.options.scales.yAxes[0].gridLines.lineWidth=null;
  config.data.labels=nowDisplay;
  window.myLine.update();
}
function setTime(){
  console.log(nowHour);

  if(i!=24){
    i++;
  }else{
    i=0;
  }
  Daytime.push(i+':00');
  Daytime.shift();
  config.data.labels=Daytime;
  window.myLine.update();
}
function setWeight(){
  config.options.scales.yAxes[0].ticks.max+=30;
  window.myLine.update();
}
function registDrink2() {
  config.data.datasets[0].data[1]+=100;
  config.data.datasets[0].data[2]+=50;
  config.data.datasets[0].data[3]+=30;
        //return randomScalingFactor();
  window.myLine.update();
}
function registDrink3() {
  config.data.datasets[0].data[3]+=50;
  config.data.datasets[0].data[4]+=20;
  config.data.datasets[0].data[5]+=10;
        //return randomScalingFactor();
  window.myLine.update();
}
//-----------------GONのテスト-----------------------------------
function gontest(){
  console.log(name_list);
}

/*document.getElementById('randomizeData').addEventListener('click', function() {
    config.data.datasets.forEach(function(dataset) {
        dataset.data = dataset.data.map(function() {
            return randomScalingFactor();
        });
    });
    window.myLine.update();
});*/
