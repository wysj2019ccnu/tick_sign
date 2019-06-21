// pages/join_add/join_add.js
var util = require('../../utils/util.js')
var app = getApp()

Page({

  data: {
    theme:'',
    note:'',
    fromTime:''//因为和line39 time重合了所以改个名字
  },

  onLoad: function (options) {
    //获取join_search页面传过来的数据
    var that = this
    that.setData({
      theme: options.theme,
      fromTime: options.fromTime,
      note: options.note,
      event_id: options.event_id
    })
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
      date: year + '-' + month + '-' + day,
      dat: year + '-' + month + '-' + day,
      time: '00:00'
    })
  },

  //输入姓名并添加签到
  formsubmit: function (e) {
    var that = this
    //解决不填满表单的问题
    if (e.detail.value.joinName == '') {
      wx.showToast({
        title: '请填写姓名',
        duration: 1000,
        image: "/images/icon/error.png"
      })
      return
    }
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/join_add.php',
      data: {
        joinName: e.detail.value.joinName,
        joinTime: util.formatTime(new Date()),
        event_id: that.data.event_id,
        joiner_id: app.globalData.openid
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      success: function (res) {
        console.log(res)
        wx.showToast({
          title: '签到成功',
          duration: 1000,
          success: function () {
            setTimeout(function () {
              wx.redirectTo({
                url: '../join_list/join_list',
              })
            }, 1000)

          }
        })
      },
      fail: function () {
        wx.showToast({
          title: '签到失败',
          duration: 1000,
          image: "/images/icon/error.png"
        })
      }
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})