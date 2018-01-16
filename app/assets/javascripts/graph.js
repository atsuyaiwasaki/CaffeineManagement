var jikan = new Date();
var nowHour = jikan.getHours();
var dataListEv = [];
var timeSet = [];
var evTime =1;
var minTime = 0;
var maxTime = (24/evTime)+1;
var drinkTimeData  = gon.drinkdataset;

for(var ini=minTime;ini<maxTime;ini++){
	dataListEv[ini]=0;
}
for(var ev=minTime;ev<maxTime;ev++){
	timeSet[ev]='"'+ev*evTime+':00"'
	var showTime = ev*evTime;

	var daC = 0;
	drinkTimeData.forEach(function(data){
		if(showTime==drinkTimeData[daC].timeh){
			amountInMax = drinkTimeData[daC].cafeinAmount+dataListEv[ev+1];
			amountInMin = amountInMax/2;
			amountDecre1h = amountInMin/6;

			dataListEv[ev+1]= amountInMax;
			console.log(amountInMax);
			var phcon = 2;
			var boo = true;
				while(boo){
					console.log(phcon+"----"+dataListEv[ev+phcon]);
					 if(phcon<6&&dataListEv[ev+phcon]>=0){
					  			dataListEv[ev+phcon]= dataListEv[ev+phcon-1]-amountDecre1h;
									console.log("if-------------------"+dataListEv[ev+phcon]+"---------------------");
									phcon+=1;
								}else if(dataListEv[ev+phcon]>=0){
									dataListEv[ev+phcon]= dataListEv[ev+phcon-1]-amountDecre1h/2;
									if(dataListEv[ev+phcon]<0){
									 dataListEv[ev+phcon]=0;
									 }
									phcon+=1;
									console.log("else-----------------"+dataListEv[ev+phcon]+"-------------------------");
								}else {
										break;}
					}
				//dataListEv[phcon]<0)
					console.log(boo);
				 console.log(phcon);
				phcon = 0;
			console.log();
		};
		daC += 1 ;
	})
};

// var name_list = gon.name_list;
var Daytime = ["7:00","8:00","9:00","10:00","11:00","12:00"];
'use strict';

window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
};

(function(global) {
	var Months = [
		'January',
		'February',
		'March',
		'April',
		'May',
		'June',
		'July',
		'August',
		'September',
		'October',
		'November',
		'December'
	];

	var COLORS = [
		'#4dc9f6',
		'#f67019',
		'#f53794',
		'#537bc4',
		'#acc236',
		'#166a8f',
		'#00a950',
		'#58595b',
		'#8549ba'
	];

	var Samples = global.Samples || (global.Samples = {});
	var Color = global.Color;

	Samples.utils = {
		// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/
		srand: function(seed) {
			this._seed = seed;
		},

		rand: function(min, max) {
			var seed = this._seed;
			min = min === undefined ? 0 : min;
			max = max === undefined ? 1 : max;
			this._seed = (seed * 9301 + 49297) % 233280;
			return min + (this._seed / 233280) * (max - min);
		},

		numbers: function(config) {
			var cfg = config || {};
			var min = cfg.min || 0;
			var max = cfg.max || 1;
			var from = cfg.from || [];
			var count = cfg.count || 8;
			var decimals = cfg.decimals || 8;
			var continuity = cfg.continuity || 1;
			var dfactor = Math.pow(10, decimals) || 0;
			var data = [];
			var i, value;

			for (i = 0; i < count; ++i) {
				value = (from[i] || 0) + this.rand(min, max);
				if (this.rand() <= continuity) {
					data.push(Math.round(dfactor * value) / dfactor);
				} else {
					data.push(null);
				}
			}

			return data;
		},

		labels: function(config) {
			var cfg = config || {};
			var min = cfg.min || 0;
			var max = cfg.max || 100;
			var count = cfg.count || 8;
			var step = (max - min) / count;
			var decimals = cfg.decimals || 8;
			var dfactor = Math.pow(10, decimals) || 0;
			var prefix = cfg.prefix || '';
			var values = [];
			var i;

			for (i = min; i < max; i += step) {
				values.push(prefix + Math.round(dfactor * i) / dfactor);
			}

			return values;
		},

		months: function(config) {
			var cfg = config || {};
			var count = cfg.count || 12;
			var section = cfg.section;
			var values = [];
			var i, value;

			for (i = 0; i < count; ++i) {
				value = Months[Math.ceil(i) % 12];
				values.push(value.substring(0, section));
			}

			return values;
		},

		color: function(index) {
			return COLORS[index % COLORS.length];
		},

		transparentize: function(color, opacity) {
			var alpha = opacity === undefined ? 0.5 : 1 - opacity;
			return Color(color).alpha(alpha).rgbString();
		}
	};

	// DEPRECATED
	window.randomScalingFactor = function() {
		return Math.round(Samples.utils.rand(-100, 100));
	};

	// INITIALIZATION

	Samples.utils.srand(Date.now());

	// Google Analytics
	/* eslint-disable */
	if (document.location.hostname.match(/^(www\.)?chartjs\.org$/)) {
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-28909194-3', 'auto');
		ga('send', 'pageview');
	}
	/* eslint-enable */

}(this));

//-----------------------------------初期設定---------------------------
var config = {
    	type: 'line',
    	data: {
        // labels: ["0:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"]
				labels: timeSet,
				datasets: [{
            label: "2017/11/28",
            backgroundColor: window.chartColors.red,
            borderColor: window.chartColors.red,
            scaleFontColor:"rgba(0,0,0,0.2)",
            fill: false,
						data: dataListEv,
            // data: [
						// 	// 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
						// 	 // for (var time = 0; time < 7; time += 1) {
						// 	 // 	time*10,
						// 	 // 								}
            //   todayH6M00,
            //   todayH9M00,
            //   todayH12M00,
            //   todayH15M00,
            //   todayH18M00,
            //   todayH21M00,
            //   todayH24M00
            // ],
        }
        , {
            label: "2017/11/27",
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            fill: false,
            data: dataListEv,
        }]
    },
    options: {
        responsive: true,
        title:{
            display:true,
            text:'カフェインの血中濃度'
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
									max :400,
                  stepSize:30
              }
            }]
        }
    }
};
//console.log(config);//-----------------------------ﾃﾞﾊﾞｯｸﾞ-------------------------------------------------
function healthCheck(){
	document.getElementById("healthRes").textContent="あ、ああ...死ぬ"
	// if(){
	// 	document.getElementById
	// }else if(){
  //
	// }else if(){
  //
	// }
}
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

  console.log(testTime);
}

/*document.getElementById('randomizeData').addEventListener('click', function() {
    config.data.datasets.forEach(function(dataset) {
        dataset.data = dataset.data.map(function() {
            return randomScalingFactor();
        });
    });
    window.myLine.update();
});*/
