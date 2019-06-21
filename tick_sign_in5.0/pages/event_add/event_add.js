var util = require('../../utils/util.js')
var app = getApp()

Page({

  data: {
    array: [3, 5, 10, 15, 30],
    index: 0,
    min: ' 分钟',
    count: 3,
    start_date: '',
    start_time: '',
  },


  bindDateChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      start_date: e.detail.value
    })
  },
  bindTimeChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      start_time: e.detail.value
    })
  },

  formsubmit: function (e) {
    var them = this
    //解决不填满表单的问题
    if (e.detail.value.theme == '') {
      wx.showToast({
        title: '未填写签到主题',
        duration: 1000,
        image: "/images/icon/error.png"
      })
      return
    }
    //计算初始时间
    var startDate = e.detail.value.StartTimeDay + ' ' + e.detail.value.StartTimeHour + ''
    console.log(startDate)
    //var date = "2019-06-01 08:08";
    startDate = new Date(startDate);
    startDate = startDate.getTime()
    
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/event_add.php',
      data: {
        theme: e.detail.value.theme,
        fromTime: util.formatTime(new Date(startDate)),
        note: e.detail.value.note,
        time: util.formatTime(new Date()),
        admin_id: app.globalData.openid
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      success: function (res) {
        console.log(res)
        wx.showToast({
          title: '发布成功',
          duration: 1000,
          success: function () {
            setTimeout(function () {
              wx.navigateTo({
                url: '../event_list/event_list',
              })
            }, 1000)

          }
        })
      },
      fail: function () {
        wx.showToast({
          title: '创建失败',
          duration: 1000,
          image: "/images/icon/error.png"
        })
      }
    })
  },
  
  onLoad: function (options) {
    //获取当前时间
    var myDate = new Date()
    var year = myDate.getFullYear()
    var month = myDate.getMonth() + 1
    var day = myDate.getDate()
    var hour = myDate.getHours()
    var minute = myDate.getMinutes()
    var second = myDate.getSeconds()
    if (month < 10) {
      month = '0' + month
    }
    this.setData({
      start_date: year + '-' + month + '-' + day,
      start_time: '00:00'
    })
  },
})