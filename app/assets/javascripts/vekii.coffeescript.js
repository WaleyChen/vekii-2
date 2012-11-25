atts = { 
  id: 'myytplayer' 
}
dev_key = 'AI39si5Cwgvp6TJAY4pqrUcK8dCcL8WntrOGNmmn6MBvBpN40Ru_pKF99Y0m-y_WJvLxtblt4REVaTqlQYsmr5Q05E1Bwvkmyw'
params = { 
  allowScriptAccess: 'always',
  wmode: 'transparent' 
}

swfobject.embedSWF(
  'http://www.youtube.com/v/u1zgFlCw8Aw?enablejsapi=1&playerapiid=ytplayer&version=3', 
  'yt-api-player', 
  '540', 
  '390', 
  '8', 
  null, 
  null, 
  params, 
  atts
 )