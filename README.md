
## slackアプリの例のファイル
```
/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
```
↓を追記
```
var refreshBgImage = function() {
  var fileName = 'http://localhost:9010/current.png' + '?' + Math.random();
  var css = `\
  #messages_container {\
      background-image: url('`+ fileName +`');\
      background-repeat: no-repeat;\
      background-position: bottom right;\
      background-size: auto 55%;\
  }\
  .c-scrollbar__hider {\
      background-color: rgba(255,255,255,0) !important;\
  }\
  .c-message--hover {\
      background-color: rgba(240, 240, 240, 0.3) !important;\
  }\
  .c-message--focus {\
      background-color: rgba(240, 240, 240, 0.3) !important;\
  }\
  ts-message:hover {\
      background-color: rgba(240, 240, 240, 0.3) !important;\
  }`
  $("<style></style>").appendTo('head').html(css);
}

document.addEventListener('DOMContentLoaded', refreshBgImage);
setInterval(refreshBgImage, 60 * 1000); //1分ごとに見に行く。

```

## 画像配信サーバ
```
docker-compose up -d
```
- images/image-default.png が、デフォルト画像です。
- images/image-HH.png の"HH"の部分を00〜23にした画像を用意する、その時刻の画像になります。