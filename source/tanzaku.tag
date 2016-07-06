<tanzaku>
  <div>
    <div class='input-group'>
      <input name="input" onkeyup={ edit } class='form-control' placeholder='ねがいごとをかいてね' type='text'>
    </div>
  </div>
  <div class="result" show={ text != "" }>
    <pre>{ text }</pre>
  </div>
  <div show={ text != "" }>
    <button class="my-twitter-share-button" onclick="{tweet}">ツイート</button>
  </div>

  <style scoped>
    :scope .input-group {
      width: 20em;
    }
    :scope .result {
      padding-top: 15px;
    }
    :scope .result pre {
      display:inline-block;
    }

    /* base css: https://dev.twitter.com/docs/tfw/embed-code-css */
   :scope button.my-twitter-share-button{
      display: inline-block;
      padding: 1px 3px 0 19px;

      border: #ccc solid 1px;
      border-radius: 3px;
      background: #f8f8f8 url(//twitter.com/favicons/favicon.ico) 2px 3px no-repeat;
      background: url(//twitter.com/favicons/favicon.ico) 2px 3px no-repeat,
                  -webkit-linear-gradient(#fff, #dedede);
      background: url(//twitter.com/favicons/favicon.ico) 2px 3px no-repeat,
                  linear-gradient(#fff, #dedede);
      background-size: 17px 14px, auto auto;

      /* Text */
      font: bold 13px/19px Helvetica, Arial, sans-serif;
      text-decoration: none;
      color: #333;
      text-shadow: 0 1px 0 rgba(255, 255, 255, .5);

      white-space: nowrap;
    }
  </style>

  text = "";
  to_tanzaku(str){
    if( str == "" ){
      return "";
    }

    text = str.replace(/[A-Za-z0-9]/g, function(s) {
        return String.fromCharCode(s.charCodeAt(0) + 0xFEE0);
    }).replace(/ /g, "　").replace(/ー|-/g, "｜");

    body = text.split('').map(function (elem, index, array){
        return "┃" + elem + "┃";
    });
    return "┏┷☆\n" + body.join("\n") + "\n★━┛";
  }

  edit(e){
    text = e.target.value;
    this.text = this.to_tanzaku(text);
  }

  tweet(){
    window.open('https://twitter.com/share?text=' + encodeURIComponent(this.text + "\n短冊ジェネレータ\n"),'','scrollbars=yes,width=500,height=300,left=100,top=100,');
  }


</tanzaku>
