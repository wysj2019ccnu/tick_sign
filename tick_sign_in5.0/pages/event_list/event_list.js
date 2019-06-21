// pages/event_list/event_list.js
Page({
//打印eventlist
  onLoad: function (options) {
    let app = getApp()
    var that = this;
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/event_list.php',
      data: {
      theme:'',
      event_id:'',
      admin_id: app.globalData.openid,
      time:'',
      fromTime: ''
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      success: function (res) {
        //console.log(res.data) //constructor返回对创建此对象的数组函数的引用
        if (res.data.constructor=== Array) {
          that.setData({
            list: res.data//在html里面wxfor循环
          })
          //console.log(that.data.list)
        } else {
          wx.showModal({
            title: '暂无数据',
            content: '去发布签到',
            cancelText: '取消',
            confirmText: '确定',
            confirmColor: '',//这里设置颜色
            success(res) {
              if (res.confirm) {
                // 用户点击了确定属性的按钮
                console.log('test')//why?
                wx.switchTab({
                  url: '../event_add/event_add',
                })
              }
              else if (res.cancel) {
                wx.switchTab({
                  url: '../me/me',
                })
              }
            }
          })
        }
      }

    })
  },

//携带数据点击进入单个event
  single:function(e){
    var that = this
    var list = e.currentTarget.dataset.list;
    //console.log(list)
    wx.navigateTo({
      url: '/pages/event_single/event_single?event_id=' + list.event_id + '&theme=' + list.theme + '&fromTime=' + list.fromTime + '&note=' + list.note,
    })
  }

})