var jikan = new Date();
var month = jikan.getMonth()+1;
var today = jikan.getDate();
var nowHour = jikan.getHours();
var dayLabel =month+'/'+today;
var Tomorrow =parseInt(today)+1;
var TomorrowLab =month+'/'+Tomorrow;
var dataListEv = [];
var TomoList = [];
var timeSet = [];
var evTime =1;
var minTime = 0;
var maxTime = (24/evTime)+1;
var drinkTimeData  = gon.drinkdataset;
var DaySafe =   gon.userCaffeinDayMax;
var OneTimeSafe = gon.userCaffeinOneTimeMax;
var Step = 50;
var maxCafeAmount = 0;
var testpass = gon.testpass;
var timelist = gon.timelist;
var colorlist = [];
var message ;
var expr;
var inf;
var areaColor;
var nowTimeLine =[];
var data5hview = [];
var overinf ="";
var safeinf ="";

console.log("testpass"+testpass);

//各時刻初期化
for(var ini=minTime;ini<maxTime;ini++){
	dataListEv[ini]=0;
	TomoList[ini] =0;
	nowTimeLine[ini]='#00000010';
}
if(nowHour!=0){
	nowTimeLine[nowHour]='blue';
}
for(var ev=minTime;ev<maxTime;ev++){
	//各時刻表示初期化
	timeSet[ev]='"'+ev*evTime+':00"'
	var showTime = ev*evTime;//表示時刻
	//
	var daC = 0;
	drinkTimeData.forEach(function(data){
		if(showTime==drinkTimeData[daC].timeh){
			amountInMax = drinkTimeData[daC].cafeinamount+dataListEv[ev+1];
			amountInMin = amountInMax/2;
			amountDecre1h = amountInMin/6;//カフェインの半減期は６時間と仮定
			dataListEv[ev+1]= amountInMax;//飲んだ１時間後が最大
			maxCafeAmount = amountInMax;//

			var phcon = 2;
			var boo = true;
				while(boo){
					//6時間経過前&&データが0以上なら1時間前のデータから１時間分減少
					 if(phcon<6&&dataListEv[ev+phcon]>=0){
					  			dataListEv[ev+phcon]= dataListEv[ev+phcon-1]-amountDecre1h;

									if(ev+phcon==24){
										TomoList[0]=dataListEv[ev+phcon];
									}else if(ev+phcon>=24){
										tomoTime = ev+phcon-24;
										TomoList[tomoTime]=TomoList[tomoTime-1]-amountDecre1h;
									}
									phcon+=1;

								}else if(dataListEv[ev+phcon]>=0||TomoList[ev+phcon-24]>=0){
									dataListEv[ev+phcon]= dataListEv[ev+phcon-1]-amountDecre1h/2;

									if(ev+phcon==24){
										TomoList[0]=dataListEv[ev+phcon];
									}else if(ev+phcon>24){
										tomoTime = ev+phcon-24;
										TomoList[tomoTime]=TomoList[tomoTime-1]-amountDecre1h/2;
									}
									//データがゼロ未満のとき０を代入
									if(dataListEv[ev+phcon]<0||TomoList[ev+phcon-24]<0){
									 dataListEv[ev+phcon]=0;
									 TomoList[ev+phcon-24]=0;
									}

									phcon+=1;

								}else {
										break;
									}
					}

				phcon = 0;

		};
		daC += 1 ;
	})
};


onestep = OneTimeSafe+Step;
onestep2 = OneTimeSafe+Step*2;
safelength = OneTimeSafe-dataListEv[nowHour+1];
overlength = dataListEv[nowHour+1]-OneTimeSafe;
if(maxCafeAmount>=onestep2){
	expr = "カフェインの摂取量がかなり多いです<br>：水を飲むなどの対処をしましょう";
	areaColor = '#FF4300';
}else if(maxCafeAmount>=onestep){
	expr = "カフェインの摂取量が多いので控えましょう";
	areaColor = '#FFFF50';
}else if(maxCafeAmount>=OneTimeSafe||maxCafeAmount>=0){
	expr = "緑の線を目安にカフェインを摂取しましょう";
	inf = "";
	areaColor = '#00ff7c'

}else{
	expr = "ドリンクを選んでカフェインの推移を確認しましょう";
	areaColor = '#65b6e2';
	console.log("まだ攻めれる"+safelength+"mgいけるはず")
	console.log(nowHour+"時："+dataListEv[nowHour]);
	console.log(nowHour+1+"時："+dataListEv[nowHour+1]);
}

function calc(){
	var noinf =[];
	var safeinflength = [] ;
	var over1inflength = [] ;
	var nearinf = [];
	for(var t=0;t<=48;t++){
		if(dataListEv[t]<=onestep&&dataListEv[t]>=80){
			if(t>24){
				t2 = t-24;
				safeinflength.push(t2);
				continue;
			}
			safeinflength.push(t);
		}
		if(dataListEv[t]>=onestep){
			if(t>24){
				t2 = t-24;
				over1inflength.push(t2);
				continue;
			}
			over1inflength.push(t);
		}

		if(dataListEv[t]<=80){
			if(t>24){
				t2 = t-24;
				noinf.push(t2);
				continue;
			}
			noinf.push(t);
		}
	}
	if(over1inflength!=""){
	overinf = "副作用："+over1inflength[0]+"時～"+over1inflength[over1inflength.length - 1]+"時";
	console.log(over1inflength);
	}
	if(safeinflength!=""){
	safeinf = "効果："+safeinflength[0]+"時～"+safeinflength[safeinflength.length - 1]+"時";
	console.log(safeinf);
	}
	// return inflegth
}

function message() {
	message = document.getElementById("message");
	Area = document.getElementById("message-row");
	overArea = document.getElementById("message-over");
	safeArea = document.getElementById("message-safe");
	calc();
	Area.style.backgroundColor = areaColor;
	message.innerHTML=expr;
		var sDiv = document.createElement('div');
		sDiv.id = 'safeM';
		sDiv.className = 'safeM ';
	if(safeinf!=""){

		safeArea.appendChild(sDiv);
		var sDivEl = document.getElementById("safeM");
		sDivEl.innerHTML = safeinf+'<hr class="meshr">';
		var inflist = document.createElement('div');
		inflist.className = 'list-group';
		sDiv.appendChild(inflist);

		var listitem1 = document.createElement('a');
		listitem1.className = 'list-group-item';
		listitem1.innerHTML = "・覚醒作用";
		inflist.appendChild(listitem1);

		var listitem2 = document.createElement('a');
		listitem2.className = 'list-group-item';
		listitem2.innerHTML = "・集中力向上";
		inflist.appendChild(listitem2);

		var listitem3 = document.createElement('a');
		listitem3.className = 'list-group-item';
		listitem3.innerHTML = "・記憶力向上";
		inflist.appendChild(listitem3);

	}
		var oDiv = document.createElement('div');
		oDiv.id = 'overM';
		oDiv.className = 'overM';
		if(overinf!=""){
			overArea.appendChild(oDiv);
			var oDivEl = document.getElementById("overM");
			oDivEl.innerHTML = overinf+'<hr class="meshr">';
			var inflist = document.createElement('div');

			inflist.className = 'list-group';
			oDiv.appendChild(inflist);

			var listitem1 = document.createElement('a');
			listitem1.className = 'list-group-item';
			listitem1.innerHTML = "・頭痛";
			inflist.appendChild(listitem1);

			var listitem2 = document.createElement('a');
			listitem2.className = 'list-group-item';
			listitem2.innerHTML = "・疲労感";
			inflist.appendChild(listitem2);

			var listitem3 = document.createElement('a');
			listitem3.className = 'list-group-item';
			listitem3.innerHTML = "・軽度の鬱";
			inflist.appendChild(listitem3);

		}
// Now create and append to iDiv

}
function backSet(){
	document.body.style.backgroundImage = 'linear-gradient(-90deg, #FD4E66, #D8FF57)';
}
// var name_list = gon.name_list;


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
data5hview = [0,100,0,100,0];
//-----------------------------------初期設定---------------------------
var config = {
    	type: 'line',
    	data: {
				labels: timeSet,
				datasets: [{
            label: dayLabel.toString(),
            backgroundColor: window.chartColors.red,
            borderColor: window.chartColors.red,
            scaleFontColor:"rgba(0,0,0,0.2)",
            fill: false,
						data: dataListEv,
        }
        , {
            label: TomorrowLab.toString(),
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            fill: false,
            data: TomoList,
        }]
    },
    options: {
        responsive: true,
        title:{
            display:true,
            text:'カフェインの血中濃度',
						fontSize:30
        },
        scales: {
            xAxes: [{
                drawBorder:false,
                gridLines:{
									color: nowTimeLine
              	},
								scaleLabel: {                 //軸ラベル設定
                       display: true,             //表示設定
                       labelString: '<<時刻>>',  //ラベル
                       fontSize: 30               //フォントサイズ
                    },
										ticks:{
											fontSize:30
										},

            }],
            yAxes: [{
              gridLines:{
                  highlightVerticalLine: true,
                  color: ['', 'red', 'orange', 'green']
                  /*color:fuction(context){
                    var index = context.dataIndex;
                    var value = context.dataset.data[index];
                    return value < 0 ? 'red' :
                           index % 2 ? 'blue':
                           'green';
                  }*/
              },
							scaleLabel: {                 //軸ラベル設定
										 display: true,             //表示設定
										 labelString: 'mg',  //ラベル
										 fontSize: 40               //フォントサイズ
									},
              ticks: {
                  min :0,
									max : OneTimeSafe+Step*2,
                  stepSize: Step,
									fontSize:30
              },
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

//-----------------GONのテスト-----------------------------------
function gontest(){

  console.log(testTime);
}
function getSafe(){
	//safelength
	v = 200+1;
	console.log(v);
	return v
}
/*document.getElementById('randomizeData').addEventListener('click', function() {
    config.data.datasets.forEach(function(dataset) {
        dataset.data = dataset.data.map(function() {
            return randomScalingFactor();
        });
    });
    window.myLine.update();
});*/
