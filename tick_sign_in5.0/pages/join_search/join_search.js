var app = getApp()
var util = require('../../utils/util.js')

Page({
  data: {
    event_id: 0,
    theme: '',
    fromTime:'',
    data_list: []
  },

  //获取用户搜索的eventid，查找和返回数据
  formsubmit: function (res) {
    var event_id = res.detail.value.event_id
    //console.log(event_id)
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/join_search.php',
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      data:{
        event_id: event_id,
      },
      success: function (res) {

       // console.log(res.data);
        if (res.data[0].theme != null) {
          var that = this
          var theme = res.data[0].theme
          var fromTime = res.data[0].fromTime
          var note = res.data[0].note
          //console.log(theme)
          wx.navigateTo({
            url: '../join_add/join_add?event_id=' + event_id + '&theme=' + theme + '&fromTime=' + fromTime + '&note=' + note,
          })
        }
        else {
          wx.showToast({
            title: '没有这个签到',
            duration: 1000,
            image: "/images/icon/error.png"
          })
        }
      }
    })
  },
})
