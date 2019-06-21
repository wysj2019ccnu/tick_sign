// pages/join_list/join_list.js
Page({
//获取joinlist
  onLoad: function (options) {
    let app = getApp()
    var that = this;
    wx.request({
      url: 'http://www.tickey.xyz/tick_php/join_list.php',
      dataType: 'json',
      data: {
        theme: '',
        event_id: '',
        joiner_id: app.globalData.openid,
        time: ''
      },
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      
      success: function (res) {
        console.log(res.data) //constructor返回对创建此对象的数组函数的引用
        if (res.data.constructor === Array) {
          that.setData({
            list: res.data
          })
        } else {
          wx.showModal({
            title: '暂无数据',
            content: '去加入签到',
            cancelText: '取消',
            confirmText: '确定',
            confirmColor:'',//这里设置颜色
            success(res) {
              if (res.confirm) {
                // 用户点击了确定属性的按钮
                wx.switchTab({
                  url: '../join_search/join_search',
                })
              }
              else if(res.cancel){
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

//删除join
  joinDelete:function(e){
    wx.showModal({
       title: '确定要删除吗', 
       content: '可没有后悔药哦', 
    success(res) {
      if (res.confirm) {
         console.log('用户点击确定') 
        var that = this
        wx.request({
          url: 'http://www.tickey.xyz/tick_php/join_delete.php',
          data: {
            join_id: e.currentTarget.dataset.join_id,
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
                      url: '../join_list/join_list',
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
         console.log('用户点击取消') } 
         } 
    })

  }

})