const weeks = ['日', '月', '火', '水', '木', '金', '土']
const date = new Date()//現在の日時を取得
let year = date.getFullYear()//年を取得
let month = date.getMonth() + 1//月を取得
const config = {
    show: 3,
}

function showCalendar(year, month) {
    for ( i = 0; i < config.show; i++) {
        const calendarHtml = createCalendar(year, month)
        const sec = document.createElement('section')//Webページにsectionタグを作る。
        sec.innerHTML = calendarHtml//セクションタグの中に、ceateCalendarで作ったHTMLを挿入
        document.querySelector('#calendar').appendChild(sec)//上記で作ったsectionタグを　ID:calenderの中に入れる。

        month++//次のカレンダーのために月をプラス１
        if (month > 12) {//　年をまたぐ場合のif
            year++//年をプラス１
            month = 1//月を１月に戻す
        }
    }
}

function createCalendar(year, month) {
    const startDate = new Date(year, month - 1, 1) // 月の最初の日を取得
    const endDate = new Date(year, month,  0) // 月の最後の日を取得
    const endDayCount = endDate.getDate() // 月の末日
    const lastMonthEndDate = new Date(year, month - 2, 0) // 前月の最後の日の情報
    const lastMonthendDayCount = lastMonthEndDate.getDate() // 前月の末日
    const startDay = startDate.getDay() // 月の最初の日の曜日を取得
    let dayCount = 1 // 日にちのカウント
    let calendarHtml = '' // HTMLを組み立てる変数

    calendarHtml += '<h1>' + year  + '/' + month + '</h1>'
    calendarHtml += '<table>'

    // 曜日の行を作成
    for (let i = 0; i < weeks.length; i++) {
        calendarHtml += '<td>' + weeks[i] + '</td>'
    }

    for (let w = 0; w < 6; w++) {
        calendarHtml += '<tr>'

        for (let d = 0; d < 7; d++) {
            if (w == 0 && d < startDay) {
                // 1行目で1日の曜日の前
                let num = lastMonthendDayCount - startDay + d + 1
                calendarHtml += '<td class="is-disabled">' + num + '</td>'
            } else if (dayCount > endDayCount) {
                // 末尾の日数を超えた
                let num = dayCount - endDayCount
                calendarHtml += '<td class="is-disabled">' + num + '</td>'
                dayCount++
            } else {//普通の日
                calendarHtml += `<td class="calendar_td" data-date="${year}/${month}/${dayCount}">${dayCount}</td>`
                dayCount++
            }
        }
        calendarHtml += '</tr>'
    }
    calendarHtml += '</table>'

    return calendarHtml
}

function moveCalendar(e) {
    document.querySelector('#calendar').innerHTML = ''//カレンダー非表示にする。

    	//　前の月のカレンダーを表示
    if (e.target.id === 'prev') {// e.targetはクリックされたオブジェクト。　e.target,idでクリックされたオブジェクトのID。
        month--//　現在の月をマイナス１する。　６月　⇒　５月など

        if (month < 1) {// 0月になった場合は前年の１２月を表示させる。
            year--
            month = 12
        }
    }
    	
    
    // 次の月のカレンダーを表示
      if (e.target.id === 'next') {
        month++
   ////　現在の月をマイナス１する。　５月　⇒　６月など 
        if (month > 12) {// １３月になった場合は翌年の１月を表示させる。
            year++
            month = 1
        }
    }

    showCalendar(year, month)//	showCalendarを実行
}

//イベントリスナーを追加する。
document.addEventListener("DOMContentLoaded", function(){//　HTMLが読み込まれた時
	document.querySelector('#prev').addEventListener('click', moveCalendar)//　前の月ﾎﾞﾀﾝが押されたら、moveCalendarメソッドを実行される
	document.querySelector('#next').addEventListener('click', moveCalendar)//　次の月ﾎﾞﾀﾝが押されたら、moveCalendarメソッドを実行される

	document.addEventListener("click", function(e) {//webページがクリック
	    if(e.target.classList.contains("calendar_td")) {//クリックされた対象が"Calendar_td"クラスだった場合
	    	var spl = e.target.dataset.date.split('/');//日付を３分割して配列している。　
	    	var year =spl[0];//2020を取得
	    	var month =spl[1];//６を取得
	    	var day =spl[2];//30を取得


	    	/* 取得した値をパラメータにセット(アンパサンド'&'で連結) */
	        var pram="year="+year+"&month="+month+"&day="+day;
	        /* アドレスにパラメータを付加 */
	        location.href="Payment?"+pram;
	        return false;
	    	
	    }
	})

	showCalendar(year, month);//showCalendarメソッドを実行
	

}, false);
