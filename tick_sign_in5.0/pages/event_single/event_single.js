var app = getApp()
var util = require('../../utils/util.js')

Page({
  data: {
    join:'',
    event_id: 0,
    theme: '',
    fromTime: '',
    note:''
  },
//获取从event_list来的数据
  onLoad: function (options) {
    var that = this
    that.setData({
      event_id: options.event_id,
      theme: options.theme,
      fromTime: options.fromTime,
      note: options.note
    })

//获取join信息
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/event_single.php',
      data: {
        event_id : that.data.event_id,
        joinName: '',
        joiner_id: '',
        joinTime: ''
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      success: function (res) {
        if (res.data.constructor === Array) {
          that.setData({
            join: res.data//在html里面wxfor循环
          })
          console.log(that.data.join)
        } 
        else{
          that.setData({
            join:[{'joinName': '还没有人加入'}]
          })
        }
      }
    })
  },
//删除event
  eventDelete: function () {
    var that = this
    wx.showModal({
      title: '确定要删除吗',
      content: '可没有后悔药哦',
      success(res) {
        if (res.confirm) {
          console.log('用户点击确定')
          
          wx.request({
            url: 'http://www.tickey.xyz/tick_php/event_delete.php',
            data: {
              event_id: that.data.event_id,
            },
            method: 'POST',
            header: {
              'content-type': 'application/x-www-form-urlencoded' // 默认值
            },
            success: function (res) {
              console.log(res.data)
              if (res.data == true) {
                wx.showToast({
                  title: '删除成功',
                  duration: 1000,
                  success: function () {
                    setTimeout(function () {
                      wx.redirectTo({
                        url: '../me/me',
                      })
                    }, 1000)

                  }
                })
              }
              else {
                wx.showToast({
                  title: '删除失败',
                  duration: 1000,
                  image: "/images/icon/error.png"
                })
              }
            },
          })
        }
        else if (res.cancel) {
          console.log('用户点击取消')
        }
      }
    })

  },


//用户点击右上角分享

  onShareAppMessage: function (res) {
    var that = this
    if (res.from === 'button') {
      // 来自页面内转发按钮
      console.log(res.target)
    } else {
      // 来自菜单栏转发按钮
      //console.log(res.target)
    }
    return {
      title: '[时刻签到]快来加入我的签到',
      path: '/pages/join_add/join_add?event_id=' + that.data.event_id + '&theme=' + that.data.theme + '&fromTime=' + that.data.fromTime + '&note=' + that.data.note,
      imageUrl: '',
      // 成功的回调
      success: (res) => {
        console.log('succeed')
        wx.showToast({
          title: '分享成功',
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
      // 失败的回调
      fail: (res) => {
        console.log('fail')
        wx.showToast({
          title: '分享失败',
          duration: 1000,
          image: "/images/icon/error.png"
        })
       },
    }
  }
})


