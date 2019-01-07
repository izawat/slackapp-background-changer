#!/bin/bash
#このシェルスクリプトは1分ごとにcronで実行されます。
function log() {
  local _logfile=/usr/share/nginx/html/images/log.txt
  local _date=`date`
  echo "${_date} ${1}" >> ${_logfile}
}

function main() {
  log '--- start ---'

  #このフォルダ内の画像をどれか選んで、../current.pngに移動する。
  #slackでは ../current.png を1分間隔で読み込んでいる。
  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  local _currentHours=`date "+%H"`

  moveTo='/usr/share/nginx/html/current.png'
  moveFrom="/usr/share/nginx/html/images/image-${_currentHours}.png"
  if [ -f ${moveFrom} ]; then
    :
  else
    moveFrom='/usr/share/nginx/html/images/image-default.png'    
    if [ -f ${moveFrom} ]; then
      :
    else
      log "${moveFrom}すらありません。"
      log '--- end with error ---'
      exit 9
    fi
  fi

  log "${moveFrom}を${moveTo}に移動します。"
  \cp -f ${moveFrom} ${moveTo}
  log '--- end ---'
}

main